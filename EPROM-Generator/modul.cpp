/*
 * (c) 2020,2024 Bert Lange
 *
 * EPROM-Generator für M037-Module (M045/M046/M047)
 * und M062 (32k/64k)
 *
 * Klasse enthält Informationen zum jeweiligen Modultyp
 */

#include <fstream>      // ifstream
#include <math.h>       // floor

#include <QFile>
#include <QDebug>

#include "modul.h"


Modul::Modul( void)
{
    m_romstart_binary_m045 = load_binary( M045);
    m_romstart_binary_m046 = load_binary( M046);
    m_romstart_binary_m047 = load_binary( M047);
    m_romstart_binary_m062_32k = load_binary( M062_32k);
    m_romstart_binary_m062_64k = load_binary( M062_64k);
    m_type = M045;
}


Modul::~Modul( void)
{
}


void Modul::set_type( const Modultyp m)
{
    m_type = m;
}


Modultyp Modul::get_type( void)
{
    return m_type;
}


std::string Modul::get_name( void)
{
    return this->get_name( m_type);
}


std::string Modul::get_name( const Modultyp m) const
{
    switch( m)
    {
        case M045: return "M045";
        case M046: return "M046";
        case M047: return "M047";
        case M062_32k: return "M062 (32k)";
        case M062_64k: return "M062 (64k)";
    }
    return "false";
}


int Modul::get_size( void)
{
    switch( m_type)
    {
        case M045: return 32768;
        case M046: return 65536;
        case M047: return 131072;
        case M062_32k: return 32768;
        case M062_64k: return 65536;
    }
    return -1;
}


int Modul::get_blocks( void)
{
    switch( m_type)
    {
        case M045: return 256;
        case M046: return 512;
        case M047: return 1024;
        case M062_32k: return 256;
        case M062_64k: return 512;
    }
    return -1;
}


std::string Modul::get_eprom_name( void)
{
    switch( m_type)
    {
        case M045: return "2764";
        case M046: return "27128";
        case M047: return "27256";
        case M062_32k: return "M48Z35";
        case M062_64k: return "27512";
    }
    return "Error";
}


int Modul::get_eprom_count( void)
{
    switch( m_type)
    {
        case M045: return 4;
        case M046: return 4;
        case M047: return 4;
        case M062_32k: return 1;
        case M062_64k: return 1;
    }
    return -1;
}



int Modul::size_to_blocks( const size_t size)
{
    if(( size % 128) == 0)
    {
        return( int( size / 128));
    }
    return( 1 + floor( size / 128));
}


int Modul::calc_dirblocks( const int direntrys)
{
    int bytes = direntrys * 28;
    return size_to_blocks( bytes);
}


std::vector<uint8_t> Modul::load_binary( const Modultyp m_type)
{
    QString                 filename;
    QFile                   file;
    std::vector<uint8_t>    result;

    // erster Versuch -> Datei vorhanden?
    switch( m_type)
    {
        case M045: filename = "romstartm045.bin"; break;
        case M046: filename = "romstartm046.bin"; break;
        case M047: filename = "romstartm047.bin"; break;
        case M062_32k: filename = "romstartm062_32k.bin"; break;
        case M062_64k: filename = "romstartm062_64k.bin"; break;
    }
    file.setFileName( filename);
    if( !file.exists())
    {
        //qDebug() << "INFO: Keine Binärdatei" << filename << "gefunden, verwende Voreinstellung.";

        // zweiter Versuch -> resurces
        switch( m_type)
        {
            case M045: filename = "://binarys/romstartm045.bin"; break;
            case M046: filename = "://binarys/romstartm046.bin"; break;
            case M047: filename = "://binarys/romstartm047.bin"; break;
            case M062_32k: filename = "://binarys/romstartm062_32k.bin"; break;
            case M062_64k: filename = "://binarys/romstartm062_64k.bin"; break;
        }
        file.setFileName( filename);
    }
    else
    {
        qDebug() << "INFO: Verwende Binärdatei" << filename << "für" << QString::fromStdString( this->get_name( m_type));
    }

    if( file.open( QIODevice::ReadOnly | QIODevice::ExistingOnly))
    {
        QByteArray data = file.readAll();
        file.close();
        for( int index = 0; index < data.size(); index++)
        {
            result.push_back( data.data()[ index]);
        }
        //qDebug() << "INFO: Binädatei" << filename << "geladen.";
    }
    else
    {
        qDebug() << "FEHLER: Kann Binärdatei" << filename << "nicht verwenden.";
    }
    return result;
}


std::vector<uint8_t> Modul::get_romstart_binary( void)
{
    switch( m_type)
    {
        case M045: return m_romstart_binary_m045;
        case M046: return m_romstart_binary_m046;
        case M047: return m_romstart_binary_m047;
        case M062_32k: return m_romstart_binary_m062_32k;
        case M062_64k: return m_romstart_binary_m062_64k;
    }
    std::vector<uint8_t> empty;
    return empty; // "Error with binary";
}


int Modul::get_romstart_blocksize( void)
{
    return size_to_blocks( get_romstart_binary().size());
}
