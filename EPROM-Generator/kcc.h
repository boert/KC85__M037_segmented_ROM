/*
 * (c) 2020 Bert Lange
 *
 * EPROM-Generator für M037-Module (M045/M046/M047)
 *
 * Einlesen und Verarbeiten von KCC-Dateien, inkl. Bildvorschau
 */
#ifndef KCC_H
#define KCC_H

#include <string>
#include <vector>
#include <cstdint>      // uint16_t

class Kcc
{
    public:
        Kcc();          // Konstruktoren
        Kcc( const std::string filename);
        ~Kcc();         // Destruktor

        // Funktionen
        int                     load( const std::string filename);
        void                    load_icon();
        void                    set_icon( std::vector<uint8_t>);
        std::string             get_filename() const;
        std::string             get_name() const;
        std::string             get_ext() const;
        size_t                  get_rawsize() const;
        size_t                  get_compressedsize() const;
        size_t                  get_size() const;
        size_t                  get_previewsize() const;
        int                     get_addressargs() const;
        uint16_t                get_loadaddress() const;
        uint16_t                get_endaddress() const;
        uint16_t                get_startaddress() const;
        uint16_t                get_proglength() const;
        uint8_t                 get_controlbyte() const;
        float                   get_percent() const;
        //
        bool                    get_compressed() const;
        void                    set_compressed( bool);
        void                    set_compressed();
        void                    set_uncompressed();
        //
        bool                    get_use_preview() const;
        void                    set_use_preview( bool);
        // for export
        std::vector<uint8_t>    get_binary() const;
        std::vector<uint8_t>    get_preview() const;
        std::vector<uint8_t>    get_preview_raw() const;
        std::vector<uint8_t>    get_direntry( bool, uint16_t, uint16_t, uint16_t);
        // for GUI
        void                    set_active( bool);
        bool                    get_active() const;
        std::string             get_icon_filename() const;

    private:
        std::string             m_filename;
        size_t                  m_filesize;
        std::vector<uint8_t>    m_header;
        std::vector<uint8_t>    m_data;
        std::vector<uint8_t>    m_preview;
        std::vector<uint8_t>    m_compressed_preview;
        std::string             m_name;
        std::string             m_ext;
        size_t                  m_compressedsize;
        size_t                  m_compressedblock;
        long                    m_delta;
        std::vector<uint8_t>    m_compressed_data;
        int                     m_addressargs;
        uint16_t                m_loadaddress;
        uint16_t                m_endaddress;
        bool                    m_use_startaddress;
        uint16_t                m_startaddress;
        bool                    m_use_more16k;
        uint16_t                m_proglength;
        uint16_t                m_loadcompressed;
        float                   m_percent;
        std::string             m_icn_filename;
        // for GUI
        bool                    m_active;
        bool                    m_use_preview;
        bool                    m_use_compression;
        // special
        bool                    file_exists( const std::string& filename) const;
};

#endif // KCC_H
