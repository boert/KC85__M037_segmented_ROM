/*
 * (c) 2020 Bert Lange
 *
 * EPROM-Generator für M037-Module (M045/M046/M047)
 *
 * Einlesen und Verarbeiten von KCC-Dateien, inkl. Bildvorschau
 */
#include <iostream>     // cout
#include <fstream>      // ifstream
#include <cstring>      // memcpy
#include <sys/stat.h>   // stat
#include "kcc.h"
extern "C" {
#include "zx7/zx7.h"
}

#define LOBYTE(x)   (*((uint8_t*)&(x)))   // low byte
#define HIBYTE(x)   (*((uint8_t*)&(x)+1))

Kcc::Kcc( void)
{
    m_filesize          = 0;
    m_compressedsize    = 0;
    m_compressedblock   = 0;
    m_delta             = 0;
    m_addressargs       = 0;
    m_loadaddress       = 0;
    m_endaddress        = 0;
    m_startaddress      = 0;
    m_proglength        = 0;
    m_percent           = 0.0;
    m_use_more16k       = false;
    m_active            = false;
    m_use_compression   = false;
    m_use_preview       = false;
    m_use_startaddress  = false;
}


Kcc::Kcc( const std::string filename)
{
    this->load( filename);
}


Kcc::~Kcc( void)
{
}


int Kcc::load( const std::string filename)
{
    m_filename = filename;
    std::ifstream readfile;
    readfile.open( m_filename, std::ifstream::in | std::ifstream::binary);
    if( !readfile)
    {
        std::cout << "FEHLER: Kann Datei " << m_filename << " nicht öffnen!" << std::endl;
        exit( 1);
    }
    //cout << "INFO: Lade Datei: " << m_filename << endl;

    // komplette Datei lesen
    std::ifstream stream( m_filename, std::ios::in | std::ios::binary);
    std::vector<uint8_t> contents(( std::istreambuf_iterator<char>( stream)), std::istreambuf_iterator<char>());

    // Länge ermitteln
    m_filesize = contents.size();

    // Header einlesen
    copy( begin( contents), begin( contents)+128, back_inserter( m_header));
    m_filesize -= 128;

    // Daten einlesen
    copy( begin( contents)+128, end( contents), back_inserter( m_data));
    
    // extract Name
    for( int index = 0; index < 8; index++)
    {
        if( isprint( m_header[ index]))
        {
            m_name += m_header[ index];
        }
        else
        {
            m_name += ' ';
        }
    }
    
    // extract Extension
    for( int index = 8; index < 11; index++)
    {
        if( isprint( m_header[ index]))
        {
            m_ext += m_header[ index];
        }
        else
        {
            m_ext += ' ';
        }
    }

    // Adressen ermitteln
    m_addressargs  = int( m_header[ 16]);
    m_loadaddress  = m_header[ 17] + ( m_header[ 18] << 8);
    m_endaddress   = m_header[ 19] + ( m_header[ 20] << 8);
    m_startaddress = m_header[ 21] + ( m_header[ 22] << 8);
    m_proglength   = m_endaddress - m_loadaddress;

    // control byte anlegen
    if( m_addressargs > 2)
    {
        m_use_startaddress = true;
    }
    else
    {
        m_use_startaddress = false;
    }

    if( m_endaddress > 0x4000)
    {
        m_use_more16k = true;
    }
    else
    {
        m_use_more16k = false;
    }

    // generate compressed data
    uint8_t *compress_ptr;
    compress_ptr = compress( optimize( m_data.data(), m_filesize, 0), m_data.data(), m_filesize, 0, &m_compressedsize, &m_delta);
    for( size_t index = 0; index < m_compressedsize; index++)
    {
        m_compressed_data.push_back( compress_ptr[ index]);
    }
    free( compress_ptr);

    // fill up to 128 byte blocks
    m_compressedblock = m_compressedsize;
    while(( m_compressed_data.size() % 128) > 0)
    {
        m_compressed_data.push_back( 0xff);
    }
    m_loadcompressed = 0x8000 - m_compressedsize;
    //m_percent = 100.0 - m_compressedsize * 100.0 / m_filesize;
    m_percent = 100.0 * m_compressedsize / m_filesize;
    if( m_percent < 100.0)
    {
        this->set_compressed();
    }
    else
    {
        this->set_uncompressed();
    }

    // fill with 0xff
    while(( m_data.size() % 128) > 0)
    {
        m_data.push_back( 0xff);
    }


    // try to load ICN
    m_icn_filename = filename.substr( 0, filename.size() - 3) + "ICN";
    load_icon();

    m_active = true;

    return 0;
}

void Kcc::load_icon()
{
    if( file_exists( m_icn_filename))
    {
        //cout << "gefunden: " << icn_filename << endl;
        // komplette Datei lesen
        std::ifstream icnstream( m_icn_filename, std::ios::in | std::ios::binary);
        std::vector<uint8_t> icn_contents(( std::istreambuf_iterator<char>( icnstream)), std::istreambuf_iterator<char>());
        set_icon( icn_contents);
    }
    else
    {
        std::vector<uint8_t> empty;
        set_icon( empty);
    }
}


void Kcc::set_icon( std::vector<uint8_t> content)
{
    m_preview = content;
    if( content.size() == 0)
    {
        m_use_preview = false;
        m_compressed_preview = content;
        return;
    }
    m_use_preview = true;

    // generate compressed image
    uint8_t *compress_image_ptr;
    size_t compress_image_size;
    long   compress_image_delta;
    compress_image_ptr = compress( optimize( content.data(), content.size(), 0), content.data(), content.size(), 0, &compress_image_size, &compress_image_delta);
    for( size_t index = 0; index < compress_image_size; index++)
    {
        m_compressed_preview.push_back( compress_image_ptr[ index]);
    }
    free( compress_image_ptr);

    // fill up to 128 byte blocks
    while(( m_compressed_preview.size() % 128) > 0)
    {
        m_compressed_preview.push_back( 0xff);
    }
}


bool Kcc::file_exists( const std::string &name) const
{
    struct stat buffer;
    return( stat( name.c_str(), &buffer) == 0);
}


std::string Kcc::get_filename() const
{
    return m_filename;
}


std::string Kcc::get_name() const
{
    return m_name;
}


std::string Kcc::get_ext() const
{
    return m_ext;
}


size_t Kcc::get_rawsize() const
{
    return m_filesize;
}


size_t Kcc::get_compressedsize() const
{
    return m_compressedsize;
}


size_t Kcc::get_size() const
{
    if( m_use_compression)
    {
        return m_compressedsize;
    }
    return m_filesize;
}


size_t Kcc::get_previewsize() const
{
    return m_compressed_preview.size();
}


int Kcc::get_addressargs() const
{
    return m_addressargs;
}


uint16_t Kcc::get_loadaddress() const
{
    return m_loadaddress;
}


uint16_t Kcc::get_endaddress() const
{
    return m_endaddress;
}


uint16_t Kcc::get_startaddress() const
{
    return m_startaddress;
}


uint16_t Kcc::get_proglength() const
{
    return m_proglength;
}


uint8_t Kcc::get_controlbyte() const
{
    uint8_t controlbyte;
    if( m_use_startaddress)
    {
        controlbyte = 3;
    }
    else
    {
        controlbyte = 2;
    }
    if( m_use_more16k)
    {
        controlbyte |= ( 1 << 5);
    }
    if( m_use_compression)
    {
        controlbyte |= ( 1 << 6); // compression
        controlbyte |= ( 1 << 5); // more than 16k
    }
    //cout << "usestart: " << m_use_startaddress << "  16k+: " << m_use_more16k << "  compr: " << m_use_compression << endl;
    return controlbyte;
}


float Kcc::get_percent() const
{
    return m_percent;
}


bool Kcc::get_compressed() const
{
    return m_use_compression;
}


void Kcc::set_compressed()
{
    m_use_compression = true;
}


void Kcc::set_uncompressed()
{
    m_use_compression = false;
}


void Kcc::set_compressed( bool value)
{
    m_use_compression = value;
}


bool Kcc::get_use_preview() const
{
    return m_use_preview;
}


void Kcc::set_use_preview( bool value)
{
    m_use_preview = value;
    if( m_preview.size() == 0)
    {
        m_use_preview = 0;
    }
}


std::vector<uint8_t> Kcc::get_binary() const
{
    if( m_use_compression)
    {
        return m_compressed_data;
    }
    return m_data;
}


std::vector<uint8_t> Kcc::get_preview() const
{
    return m_compressed_preview;
}


std::vector<uint8_t> Kcc::get_preview_raw() const
{
    return m_preview;
}


std::vector<uint8_t> Kcc::get_direntry( bool lastentry, uint16_t startblock, uint16_t picture_start_block, uint16_t picture_length)
{
    std::vector<uint8_t> directory_entry = std::vector<uint8_t>( 28, (uint8_t) 0xff);

    // control byte
    directory_entry[ 0] = this->get_controlbyte();
    if( lastentry)
    {
        directory_entry[ 0] |= ( 1 << 7);
    }
    //cout << m_name.c_str() << " cb: " << hex << (( int) directory_entry[ 0]) << dec << endl;

    // Name
    memcpy( &directory_entry[ 1], m_name.c_str(), 8);

    // Erweiterung
    memcpy( &directory_entry[ 9], m_ext.c_str(), 3);

    // Adressen
    directory_entry[ 12] = LOBYTE( m_loadaddress);
    directory_entry[ 13] = HIBYTE( m_loadaddress);
    
    directory_entry[ 14] = LOBYTE( m_proglength);
    directory_entry[ 15] = HIBYTE( m_proglength);
    
    directory_entry[ 16] = LOBYTE( m_startaddress);
    directory_entry[ 17] = HIBYTE( m_startaddress);
    
    directory_entry[ 18] = LOBYTE( startblock);
    directory_entry[ 19] = HIBYTE( startblock);
    
    directory_entry[ 20] = LOBYTE( m_loadcompressed);
    directory_entry[ 21] = HIBYTE( m_loadcompressed);

    directory_entry[ 22] = LOBYTE( m_compressedsize);
    directory_entry[ 23] = HIBYTE( m_compressedsize);
    
    directory_entry[ 24] = LOBYTE( picture_start_block);
    directory_entry[ 25] = HIBYTE( picture_start_block);
    
    // picture length
    directory_entry[ 26] = LOBYTE( picture_length);
    directory_entry[ 27] = HIBYTE( picture_length);

    return directory_entry;
}


bool Kcc::get_active() const
{
    return m_active;
}


void Kcc::set_active( bool value)
{
    m_active = value;
}


std::string Kcc::get_icon_filename() const
{
    return m_icn_filename;
}
