/*
 * (c) 2020,2024 Bert Lange
 *
 * EPROM-Generator für M037-Module (M045/M046/M047)
 * und M062 (32k/64k)
 *
 * Klasse enthält Informationen zum jeweiligen Modultyp
 *
 * Typ:   M045,  M046,  M047,   M062,  M062
 * Größe:  32k,   64k,  128k,    32k,   64k
 * Blöcke: 256,   512,  1024,    256,   512
 * EPROM: 2764, 27128, 27256, M48Z35, 27512
 */

#ifndef MODUL_H
#define MODUL_H

#include <string>
#include <vector>


enum Modultyp
{
    M045,
    M046,
    M047,
    M062_32k,
    M062_64k
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
        std::string             get_eprom_name();
        int                     get_eprom_count();
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
        std::vector<uint8_t>    m_romstart_binary_m062_32k;// = romstart_bin;
        std::vector<uint8_t>    m_romstart_binary_m062_64k;// = romstart_bin;
};

#endif // MODUL_H
