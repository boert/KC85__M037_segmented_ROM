/*
 * (c) 2020 Bert Lange
 *
 * EPROM-Generator für M037-Module (M045/M046/M047)
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
    }
    return -1;
}


std::string Modul::get_eprom( void)
{
    switch( m_type)
    {
        case M045: return "2764";
        case M046: return "27128";
        case M047: return "27256";
    }
    return "Error";
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
    }
    std::vector<uint8_t> empty;
    return empty; // "Error with binary";
}


int Modul::get_romstart_blocksize( void)
{
    return size_to_blocks( get_romstart_binary().size());
}
