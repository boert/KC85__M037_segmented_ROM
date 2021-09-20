/*
 * (c) 2020 Bert Lange
 *
 * EPROM-Generator für M037-Module (M045/M046/M047)
 *
 * Klasse enthält Informationen zum jeweiligen Modultyp
 *
 * Typ: M045, M046, M047
 * Größe: 32k, 64k, 128k
 * Blöcke: 256, 512, 1024
 * EPROM: 2764, 27128, 27256
 */

#ifndef MODUL_H
#define MODUL_H

#include <string>
#include <vector>


enum Modultyp
{
    M045,
    M046,
    M047
};


class Modul
{
    public:
        Modul();    // Konstruktor
        ~Modul();   // Destruktor

        // Funktionen
        void                    set_type( const Modultyp);
        Modultyp                get_type();
        std::string             get_name();
        std::string             get_name( const Modultyp m) const;
        int                     get_size();
        int                     get_blocks();
        std::string             get_eprom();
        static int              size_to_blocks( const size_t size); // const am Ende: diese Methde ändert keine Klassenvariablen
        int                     calc_dirblocks( const int direntrys);
        int                     get_romstart_blocksize();
        std::vector<uint8_t>    get_romstart_binary();

    private:
        std::vector<uint8_t>    load_binary( const Modultyp);

        Modultyp        m_type;
        std::vector<uint8_t>    m_romstart_binary_m045;// = romstart_bin;
        std::vector<uint8_t>    m_romstart_binary_m046;// = romstart_bin;
        std::vector<uint8_t>    m_romstart_binary_m047;// = romstart_bin;
};

#endif // MODUL_H
