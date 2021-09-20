/*
 * (c) 2020 Bert Lange
 *
 * EPROM-Generator für M037-Module (M045/M046/M047)
 *
 * Handling der Farben und des Bildwiederholspeichers (BWS)
 */
#include "kc85color.h"

#include <QFile>
#include <QDebug>
#include <QByteArray>
#include <QPoint>
#include <QImage>


KC85Color::KC85Color()
{
}


QRgb KC85Color::foreground( const uint8_t color_byte) const
{
    QRgb result = m_fgcolors[ (color_byte >> 3) & 0x0F];
    return result;
}


QRgb KC85Color::background( const uint8_t color_byte) const
{
    QRgb result = m_bgcolors[ color_byte & 0x07];
    return result;
}


uint8_t KC85Color::colorbyte( const int fg_index, const int bg_index) const
{
    return (( fg_index & 0x0F) << 3) | (bg_index & 0x07);
}


QPixmap KC85Color::load_PNG( QString filename)
{
    QPixmap result;

    result = QPixmap( filename);

    // scale up, if too small
    if( result.width() < 320)
    {
        result = result.scaledToWidth( 320, Qt::SmoothTransformation);
    }
    if( result.height() < 256)
    {
        result = result.scaledToHeight( 256, Qt::SmoothTransformation);
    }

    // choose center part
    int x = ( result.width() - 320) / 2;
    int y = ( result.height() - 256) / 2;

    // crop
    result = result.copy( x, y, 320, 256);

    // save to internal BWS
    pixmap_to_bws( result);

    return result;
}


void KC85Color::pixmap_to_bws( const QPixmap pixmap)
{
    QImage  img = pixmap.toImage();
    QRgb    pixelcol;
    int     fg_count[16];
    int     bg_count[8];
    int     fg_col;
    int     bg_col;
    int     cb;

    for( int x = 0; x < img.width(); x += 8)
    {
        for( int y = 0; y < img.height(); y++)
        {
            for( int i = 0; i < 16;  i++)
            {
                fg_count[ i] = 0;
            }
            for( int i = 0; i < 8;  i++)
            {
                bg_count[ i] = 0;
            }
            for( int bitpos = 0; bitpos < 8; bitpos ++)
            {
                pixelcol = img.pixel( x + bitpos, y);
                if( front_or_back( pixelcol))
                {
                    fg_col = nearest_fg_color_index( pixelcol);
                    fg_count[ fg_col]++;
                }
                else
                {
                    bg_col = nearest_bg_color_index( pixelcol);
                    bg_count[ bg_col]++;
                }
            }

            // suche häufigster und zweithäufigster Hintergund
            int     bg_max;
            int     bg_max2;
            int     bg_col2;

            if( bg_count[0] < bg_count[1])
            {
                bg_max  = bg_count[1]; bg_col  = 1;
                bg_max2 = bg_count[0]; bg_col2 = 0;
            }
            else
            {
                bg_max  = bg_count[0]; bg_col  = 0;
                bg_max2 = bg_count[1]; bg_col2 = 1;
            }
            for( int i = 2; i < 8; i++)
            {
                if( bg_count[i] > bg_max)
                {
                    bg_max2 = bg_max;
                    bg_col2 = bg_col;
                    bg_max = bg_count[i];
                    bg_col = i;
                }
                else if( bg_count[i] > bg_max2)
                {
                    bg_max2 = bg_count[i];
                    bg_col2 = i;
                }
            }

            // suche häufigster Vordergund
            int     fg_max;     // häufigster Wert
            fg_max = fg_count[0];
            fg_col = 0;
            for( int i = 1; i < 16; i++)
            {
                if( fg_count[i] > fg_max)
                {
                    fg_max = fg_count[i];
                    fg_col = i;
                }
            }

            // nur Hintergundfarben
            if( fg_max == 0)
            {
#if 0
                fg_col = bg_col;
                bg_col = bg_col2;
#else
                fg_col = bg_col2;
#endif
            }

#if 0
            if(( x==7*8) & ( y< 10))
            {
                QString f;
                QString b;
                for ( int i = 0 ; i <16 ; i++)
                {
                    f += QString::number( fg_count[i]) + " ";
                }
                for ( int i = 0 ; i <8 ; i++)
                {
                    b += QString::number( bg_count[i]) + " ";
                }
                qDebug() << "bg" << b << bg_col;
                qDebug() << bg_max << bg_max2 << " ind" << bg_col << bg_col2;
            }
#endif


            cb = colorbyte( fg_col, bg_col);
            for( int bitpos = 0; bitpos < 8; bitpos ++)
            {
                pixelcol = img.pixel( x + bitpos, y);
                m_colorram[x+bitpos][y] = cb;
                m_pixelram[x+bitpos][y] = front_or_back( pixelcol, fg_col, bg_col);
            }
        }
    }
}


QPixmap KC85Color::load_PIC( QString filename)
{
    QFile file( filename);
    if( !file.open( QIODevice::ReadOnly))
    {
        qDebug() << "Kann Datei" << filename << "nicht öffnen!";
        return QPixmap();
    }

    QByteArray data = file.readAll().mid( 128, 12800 + 1); // payload
    file.close();

    int kennbyte = int( data[ 0]);
    if(( kennbyte != 0) && ( kennbyte != 1))
    {
        qDebug() << "Unerwartetes Kennbyte:" << kennbyte;
    }

    this->clear_screen( 0x79);

    for( int index = 0; index < data.size(); index++)
    {
        if( index < 0x2800)
        {
            // pixel ram
            QPoint pix = this->get_pixel_address_85_3( index + 0x8000);
            uint8_t byte = data[ index];
            for( int bitpos = 0; bitpos < 8; bitpos++)
            {
                int bit = ( byte >> bitpos) & 0x01;
                if( bit == 1)
                {
                    m_pixelram[ pix.x() * 8 + 7 - bitpos][ pix.y()] = 1;
                }
            }
        }
        else
        {
            // color ram
            QPoint pix = this->get_color_address_85_3( index + 0x8000);
            //qDebug() << "index:" << index << "  pix:" << pix;
            uint8_t color = data[ index];
            for( int crow = 0; crow < 4; crow++)
            {
                for( int ccol = 0; ccol < 8; ccol++)
                {
                    m_colorram[ pix.x() * 8 + ccol][ pix.y() + crow] = color;
                }
            }
        }
    }

    return this->get_bws();
}


QPixmap KC85Color::load_PIP( QString filename)
{
    // valide: nur PIP  oder PIP+PIF

    QString name = filename.left( filename.size() - 3);
    QString ext = filename.right( 3);
    QString pipname;
    QString pifname;

    if(( ext == "pip") || (ext == "pif"))
    {
        pipname = name + "pip";
        pifname = name + "pif";
    }
    else if (( ext == "PIP") || ( ext == "PIF"))
    {
        pipname = name + "PIP";
        pifname = name + "PIF";
    }
    else
    {
        return QPixmap();
    }

    QByteArray data;
    QFile file( pipname);
    if( !file.open( QIODevice::ReadOnly))
    {
        qDebug() << "Kann Datei" << pipname << "nicht öffnen!";
        return QPixmap();
    }
    data = file.readAll().mid( 128, 12800); // payload
    file.close();

    QByteArray colordata;
    file.setFileName( pifname);
    if( !file.open( QIODevice::ReadOnly))
    {
        qDebug() << "INFO: Kann Datei" << pifname << "nicht öffnen!";
    }
    else
    {
        colordata = file.readAll().mid( 128, 12800); // payload
    }
    file.close();

    int kennbyte;
    kennbyte = int( data[ 0]);
    if( kennbyte != 4)
    {
        qDebug() << "Unerwartetes Kennbyte:" << kennbyte << "in" << pipname;
    }
    if( colordata.size() > 1)
    {
        kennbyte = int( colordata[ 0]);
        if( kennbyte != 5)
        {
            qDebug() << "Unerwartetes Kennbyte:" << kennbyte << "in" << pifname;
        }
    }


    this->clear_screen( 0x78); // weiß auf blau

    // pixel ram
    for( int index = 0; index < data.size(); index++)
    {
        if( index < 0x2800)
        {
            QPoint pix = get_pixel_address_85_4( index + 0x8000);
            uint8_t byte = data[ index];
            for( int bitpos = 0; bitpos < 8; bitpos++)
            {
                int bit = ( byte >> bitpos) & 0x01;
                if( bit == 1)
                {
                    m_pixelram[ pix.x() * 8 + 7 - bitpos][ pix.y()] = 1;
                }
            }
        }
    }

    // color ram
    for( int index = 0; index < colordata.size(); index++)
    {
        if( index < 0x2800)
        {
            // pixel ram
            QPoint pix = get_color_address_85_4( index + 0x8000);
            uint8_t colorbyte = colordata[ index];
            for( int ccol = 0; ccol < 8; ccol++)
            {
                m_colorram[ pix.x() * 8 + ccol][ pix.y()] = colorbyte;
            }
        }
    }

    return this->get_bws();
}


QPixmap KC85Color::get_bws()
{
    QImage result( 320, 256, QImage::Format_RGB666);

    for( int y = 0; y < 256 ; y++)
    {
        for( int x = 0; x < 320; x++)
        {
            uint8_t color = m_colorram[x][y];
            if( m_pixelram[x][y] == 1)
            {
                result.setPixel( x, y, foreground( color));
            }
            else
            {
                result.setPixel( x, y, background( color));
            }
        }
    }
    return QPixmap::fromImage( result);
}


QPoint KC85Color::get_pixel_address_85_3( const uint16_t addr)
{
    QPoint result( -1, -1);

    if(( addr >= 0x8000) && ( addr < 0xA800))
    {
        if( addr < 0xA000)
        {
            result.setX( addr & 0x001F);
            result.setY((( addr & 0x1E00) >> 5) + (( addr & 0x0180) >> 7) + (( addr & 0x0060) >> 3));
        }
        else
        {
            result.setX(( addr & 0x0007) + 0x20);
            result.setY((( addr & 0x0600) >> 3) + (( addr & 0x0180) >> 7) + (( addr & 0x0060) >> 3) + (( addr & 0x0018) << 1));
        }
    }
    return result;
}


QPoint KC85Color::get_color_address_85_3( const uint16_t addr)
{
    QPoint result( -1, -1);

    if(( addr >= 0xA800) && ( addr < 0xB200))
    {
        if( addr < 0xB000)
        {
            result.setX( addr & 0x001F);
            result.setY((( addr & 0x07E0) >> 3));
        }
        else
        {
            result.setX(( addr & 0x0007) + 0x20);
            result.setY((( addr & 0x0180) >> 1) + (( addr & 0x0060) >> 3) + (( addr & 0x0018) << 1));
        }
    }
    return result;
}


QPoint KC85Color::get_pixel_address_85_4( const uint16_t addr)
{
    QPoint result( -1, -1);

    if(( addr >= 0x8000) && ( addr < 0xA800))
    {
        result.setX(( addr & 0x3F00) >> 8);
        result.setY( addr & 0x00FF);
    }
    return result;
}


QPoint KC85Color::get_color_address_85_4( const uint16_t addr)
{
    return get_pixel_address_85_4( addr);
}


void KC85Color::clear_screen( const uint8_t color)
{
    for( int y = 0; y < 256 ; y++)
    {
        for( int x = 0; x < 320; x++)
        {
            m_pixelram[x][y] = 0;
            m_colorram[x][y] = color;
        }
    }
}


QByteArray  KC85Color::get_icon( int left, int top, int width, int height)
{
    QByteArray icon;
    icon.reserve( 2 * width * height * 8 + 2);

    icon.append( (char) height);
    icon.append( (char) width);

    // pixel
    for( int x = 0; x < width; x++)
    {
        for( int y = 0; y < height * 8; y++)
        {
            int byte = 0;
            for( int bit = 0; bit < 8; bit++)
            {
                if( m_pixelram[( x + left) * 8 + bit][ y + ( top * 8)] == 1)
                {
                    byte += 1 << ( 7 - bit);
                }
            }
            icon.append( byte);
        }
    }

    // color
    for( int x = 0; x < width; x++)
    {
        for( int y = 0; y < height * 8; y++)
        {
            int color = m_colorram[( x + left) * 8][ y + ( top * 8)];
            icon.append( color);
        }
    }

    return icon;
}


long int KC85Color::square( int value)
{
    return value * value;
}


long int KC85Color::color_distance( QRgb c1, QRgb c2)
{
    int r1 = qRed( c1);
    int g1 = qGreen( c1);
    int b1 = qBlue( c1);
    int r2 = qRed( c2);
    int g2 = qGreen( c2);
    int b2 = qBlue( c2);
    return square(r1 - r2) + square(g1 - g2) + square(b1 - b2);
}


int KC85Color::nearest_bg_color_index( QRgb pixel)
{
    int result = 0;
    int min_dist = color_distance( pixel, m_bgcolors[ 0]);
    for( int index = 1; index < 8; index++)
    {
        int dist = color_distance( pixel, m_bgcolors[ index]);
        if( dist < min_dist)
        {
            result = index;
            min_dist = dist;
        }
    }
    return result;
}


int KC85Color::nearest_fg_color_index( QRgb pixel)
{
    int result = 0;
    int min_dist = color_distance( pixel, m_fgcolors[ 0]);
    for( int index = 1; index < 16; index++)
    {
        int dist = color_distance( pixel, m_fgcolors[ index]);
        if( dist < min_dist)
        {
            result = index;
            min_dist = dist;
        }
    }
    return result;
}


int KC85Color::front_or_back( QRgb pixel, int fcol, int bcol)
{
    if(( color_distance( pixel, m_fgcolors[ fcol])) <
       ( color_distance( pixel, m_bgcolors[ bcol])))
    {
         return 1;
    }
    return 0;
}


int KC85Color::front_or_back( QRgb pixel)
{
    int min_fg_dist = color_distance( pixel, m_fgcolors[ 0]);
    int min_bg_dist = color_distance( pixel, m_bgcolors[ 0]);
    for( int index = 1; index < 16; index++)
    {
        int dist = color_distance( pixel, m_fgcolors[ index]);
        if( dist < min_fg_dist)
        {
            min_fg_dist = dist;
        }
    }
    for( int index = 1; index < 8; index++)
    {
        int dist = color_distance( pixel, m_bgcolors[ index]);
        if( dist < min_bg_dist)
        {
            min_bg_dist = dist;
        }
    }
    if( min_fg_dist < min_bg_dist)
    {
        return 1;
    }
    return 0;
}


int KC85Color::bg_color_index( QRgb pixel)
{
    for( int index = 0; index < 8; index++)
    {
        if( m_bgcolors[ index] == pixel)
        {
            return index;
        }
    }
    return -1;
}


int KC85Color::fg_color_index( QRgb pixel)
{
    for( int index = 0; index < 16; index++)
    {
        if( m_fgcolors[ index] == pixel)
        {
            return index;
        }
    }
    return -1;
}
