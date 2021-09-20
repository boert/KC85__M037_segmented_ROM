/*
 * (c) 2020 Bert Lange
 *
 * EPROM-Generator für M037-Module (M045/M046/M047)
 *
 * Handling der Farben und des Bildwiederholspeichers (BWS)
 */
#ifndef KC85COLOR_H
#define KC85COLOR_H

#include <string>

#include <QColor>
#include <QRgb>
#include <QPixmap>
#include <QPoint>

class KC85Color
{
    public:
        KC85Color();

        QRgb        foreground( uint8_t color_byte) const;
        QRgb        background( uint8_t color_byte) const;
        uint8_t     colorbyte( const int fg_index, const int bg_index) const;
        QPixmap     load_PNG( QString filename);
        void        pixmap_to_bws( const QPixmap pixmap);
        QPixmap     load_PIC( QString filename);
        QPixmap     load_PIP( QString filename);
        QPixmap     get_bws();
        QPoint      get_pixel_address_85_3( const uint16_t addr);
        QPoint      get_color_address_85_3( const uint16_t addr);
        QPoint      get_pixel_address_85_4( const uint16_t addr);
        QPoint      get_color_address_85_4( const uint16_t addr);
        void        clear_screen( const uint8_t color);
        QByteArray  get_icon( int x, int y, int width, int height);

    private:
        uint8_t m_pixelram[320][256];   // könnte bool sein
        uint8_t m_colorram[320][256];   // könnte 1/8 sein

        long int    square( int value);
        long int    color_distance( QRgb c1, QRgb c2);
        int         nearest_bg_color_index( QRgb pixel);
        int         nearest_fg_color_index( QRgb pixel);
        int         front_or_back( QRgb pixel, int fcol, int bcol);
        int         front_or_back( QRgb pixel);
        int         bg_color_index( QRgb pixel);
        int         fg_color_index( QRgb pixel);

        const QRgb m_fgcolors[ 16] =
        {
            qRgb(   0,   0,   0), // schwarz
            qRgb(   0,   0, 255), // blau
            qRgb( 255,   0,   0), // rot
            qRgb( 255,   0, 255), // purpur
            qRgb(   0, 255,   0), // gruen
            qRgb(   0, 255, 255), // tuerkis
            qRgb( 255, 255,   0), // gelb
            qRgb( 255, 255, 255), // weiss

            // Vordergrundfarben mit gemischten Primaerfarben
            qRgb(   0,   0,   0), // schwarz
            qRgb( 160,   0, 255), // violett
            qRgb( 255, 160,   0), // orange
            qRgb( 255,   0, 160), // purpurrot
            qRgb(   0, 255, 160), // gruenblau
            qRgb(   0, 160, 255), // blaugruen
            qRgb( 160, 255,   0), // gelbgruen
            qRgb( 255, 255, 255), // weiss
        };
        const QRgb m_bgcolors[ 8] =
        {
            qRgb(   0,   0,   0), // schwarz
            qRgb(   0,   0, 160), // blau
            qRgb( 160,   0,   0), // rot
            qRgb( 160,   0, 160), // purpur
            qRgb(   0, 160,   0), // gruen
            qRgb(   0, 160, 160), // tuerkis
            qRgb( 160, 160,   0), // gelb
            qRgb( 160, 160, 160), // weiss
        };
};
#endif // KC85COLOR_H
