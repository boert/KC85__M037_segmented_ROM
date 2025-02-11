/*
 * (c) 2020 Bert Lange
 *
 * EPROM-Generator für M037-Module (M045/M046/M047)
 *
 * Datenmodell für die große Tabelle
 */

//#include <iostream>     // cout
#include "datamodel.h"

#include <QPainter>
#include "kc85color.h"



Datamodel::Datamodel( QObject *parent)
{
    Q_UNUSED( parent);
}


int Datamodel::size()
{
    return m_kcclist.size();
}


int Datamodel::rowCount(const QModelIndex &parent) const
{
    Q_UNUSED( parent);
    return m_kcclist.size();
}


int Datamodel::columnCount(const QModelIndex &parent) const
{
    Q_UNUSED( parent);
    return eLast;
}


QVariant Datamodel::data(const QModelIndex &index, int role) const
{
    if( !index.isValid())
    {
        return QVariant();
    }
    //cout << "data, role: " << role << endl;

    if(( role == Qt::DisplayRole) | ( role == Qt::EditRole))
    {
        QString result;
        const Kcc *element = &m_kcclist[ index.row()];
        switch( index.column())
        {
            case eIndex:
                return "";
                //result = QString::number( index.row() + 1);

            case eName:
                return QString::fromStdString( element->get_name());

            case eExtension:
                return QString::fromStdString( element->get_ext());

            case eLength:
                return QString::number( element->get_proglength());

            case eLengthCompressed:
                return QString::number( element->get_compressedsize());

            case eRatio:
                return QString::number( element->get_percent(), 'f', 1) + '%';

            case ePreview:
                return QString::number( Modul::size_to_blocks( element->get_previewsize()));

//          case eArguments:
//              return QString::number( element->get_addressargs());

            case eLoadAddress:
                return QString( "%1").arg( element->get_loadaddress(), 4, 16, QChar( '0')).toUpper() + 'h';

            case eEndAddress:
                return QString( "%1").arg( element->get_endaddress(), 4, 16, QChar( '0')).toUpper() + 'h';

            case eStartAddress:
                if( element->get_addressargs() <= 2)
                {
                    return "(" + QString( "%1").arg( element->get_startaddress(), 4, 16, QChar( '0')).toUpper() + "h)";
                }
                return QString( "%1").arg( element->get_startaddress(), 4, 16, QChar( '0')).toUpper() + 'h';

            case eBlocks:
                return QString::number( Modul::size_to_blocks(  element->get_size()));

            default:
                return "...";
        }
    }

    if( role ==  Qt::CheckStateRole)
    {
        switch( index.column())
        {
            case eName: // aktiv
                if( m_kcclist[ index.row()].get_active())
                {
                    return Qt::Checked;
                }
                else
                {
                    return Qt::Unchecked;
                }
                break;

            case eRatio: // compressed
                if( m_kcclist[ index.row()].get_compressed())
                {
                    return Qt::Checked;
                }
                else
                {
                    return Qt::Unchecked;
                }
                break;

            case ePreview:
                if( m_kcclist[ index.row()].get_use_preview())
                {
                    return Qt::Checked;
                }
                else
                {
                    return Qt::Unchecked;
                }
                break;
        }
    }

    if( role == Qt::TextAlignmentRole)
    {
        switch( index.column())
        {
            case eLength:
            case eLengthCompressed:
            case eRatio:
            case ePreview:
            case eBlocks:
                return QVariant( Qt::AlignRight | Qt::AlignVCenter);
//          case eArguments:
//              return QVariant( Qt::AlignHCenter | Qt::AlignVCenter);
        }
    }

    return QVariant();
}


QVariant Datamodel::headerData(int section, Qt::Orientation orientation, int role) const
{
    if (role == Qt::DisplayRole)
    {
        if( orientation == Qt::Horizontal)
        {
            switch( section)
            {
                case eIndex:            return "Pos.";
                case eName:             return "Name";
                case eExtension:        return "Erw.";
                case eLength:           return "Größe";
                case eLengthCompressed: return "kompr.";
                case eRatio:            return "Ratio";
//                case eArguments:        return "Arg.";
                case ePreview:          return "Vorschau";
                case eLoadAddress:      return "LOAD";
                case eEndAddress:       return "END+1";
                case eStartAddress:     return "START";
                case eBlocks:           return "Blöcke";
                case eDelete:           return "";
                default:                return "unde.";
            }
        }
        if( orientation == Qt::Vertical)
        {
            //return "";
            return QString::number( 1 + section);
        }
    }
    return QVariant();
}


QModelIndex Datamodel::index(int row, int column, const QModelIndex &parent) const
{
    Q_UNUSED( parent);
    return QAbstractItemModel::createIndex( row, column);
}


QModelIndex Datamodel::parent(const QModelIndex &index) const
{
    Q_UNUSED( index);
    return QModelIndex();
}


bool Datamodel::setData( const QModelIndex &index, const QVariant &value, int role)
{
    //cout << "setdata, role:" << role << endl;
    if( role == Qt::CheckStateRole)
    {
        switch( index.column())
        {
            case eName: // aktiv
                m_kcclist[ index.row()].set_active( value.toBool());
                emit update();
                return true;

            case eRatio: // compressed
                m_kcclist[ index.row()].set_compressed( value.toBool());
                emit update();
                return true;

            case ePreview:
                m_kcclist[ index.row()].set_use_preview( value.toBool());
                emit update();
                return true;
        }
    }
    return false;
}


Qt::ItemFlags Datamodel::flags( const QModelIndex &index) const
{
    Qt::ItemFlags flags = QAbstractItemModel::flags(index);
    flags |= Qt::ItemNeverHasChildren;
    if( index.isValid())
    {
        switch( index.column())
        {
            case eName: // aktiv
                flags |= Qt::ItemIsUserCheckable;
                break;

            case eRatio: // compressed
                flags |= Qt::ItemIsUserCheckable;
                break;

            case ePreview:
                flags |= Qt::ItemIsUserCheckable;
                break;
        }
    }
    return flags;
}


void Datamodel::add_file( std::string filename)
{
    Kcc kcc_file;
    kcc_file.load( filename );

    if( kcc_file.get_active ())
    {
        beginInsertRows( QModelIndex(), m_kcclist.size(), m_kcclist.size());
        m_kcclist.push_back( kcc_file);
        endInsertRows();
        emit update();
    }
}


void Datamodel::remove_file( int pos)
{
    beginRemoveRows( QModelIndex(), pos, pos);
    m_kcclist.erase( m_kcclist.begin() + pos);
    endRemoveRows();
    emit update();
}


void Datamodel::move_up( unsigned int pos)
{
    if( pos > 0)
    {
        //beginResetModel();
        beginMoveRows( QModelIndex(), pos, pos, QModelIndex(), pos - 1);
        std::swap( m_kcclist[ pos - 1], m_kcclist[ pos]);
        endMoveRows();
        //endResetModel();
    }
}


void Datamodel::move_down( unsigned int pos)
{
    if( pos < ( m_kcclist.size() - 1))
    {
        beginMoveRows( QModelIndex(), pos, pos, QModelIndex(), pos + 2);
        std::swap( m_kcclist[ pos + 1], m_kcclist[ pos]);
        endMoveRows();
    }
}


int Datamodel::calc_programblocks( const Modul m) const
{
    int sum = 0;
    for( const auto& e : m_kcclist)
    {
        if( e.get_active())
        {
            sum += m.size_to_blocks( e.get_size());
            if( e.get_use_preview())
            {
                sum += m.size_to_blocks( e.get_previewsize());
            }
        }
    }
    return sum;
}


int Datamodel::active_entrys( void) const
{
    int sum = 0;
    for( const auto& e : m_kcclist)
    {
        if( e.get_active())
        {
            sum++;
        }
    }
    return sum;
}


std::vector<uint8_t> Datamodel::build_EPROM( Modul modul)
{
    std::vector<uint8_t> eprom;
    std::vector<uint8_t> entry;
    int romstart_blocks;
    std::vector<uint8_t> romstart_binary;
    int dir_entrys;
    int dir_blocks;
    int picoffset;
    std::vector<uint8_t> dir;
    std::vector<uint8_t> programs;

    // romstart binary
    romstart_blocks = modul.get_romstart_blocksize();
    romstart_binary = modul.get_romstart_binary();

    // directory entrys
    dir_entrys = this->active_entrys();
    dir_blocks = modul.calc_dirblocks( dir_entrys);

    int offset = romstart_blocks + dir_blocks;
    int index = 0;
    // evtl. forall und continue
    for( int counter = 0; counter < dir_entrys; counter++)
    {
        // nächsten aktiven Eintrag suchen
        while( !m_kcclist[ index].get_active()) index++;

        // ggf. Vorschaubild einfügen
        int piclen = m_kcclist[ index].get_previewsize();
        if( m_kcclist[ index].get_use_preview())
        {
            entry = m_kcclist[ index].get_preview();
            programs.insert( programs.end(), entry.begin(), entry.end());
            picoffset = offset;
            offset += modul.size_to_blocks( piclen);
        }
        else
        {
            picoffset = 0xffff;
        }

        // Verzeichniseintrag anlegen
        bool lastentry = (counter == dir_entrys - 1);
        entry = m_kcclist[ index].get_direntry( lastentry, offset, picoffset, piclen);
        dir.insert( dir.end(), entry.begin(), entry.end());

        // Programm hinzufügen
        entry = m_kcclist[ index].get_binary();
        programs.insert( programs.end(), entry.begin(), entry.end());
        offset += modul.size_to_blocks( m_kcclist[ index].get_size());

        // nächster Eintrag
        index++;
    }

    // fill with 0xff
    while(( dir.size() % 128) > 0)
    {
        dir.push_back( 0xff);
    }

    // alles zusammenstellen
    eprom.insert( eprom.end(), romstart_binary.begin(), romstart_binary.end());
    eprom.insert( eprom.end(), dir.begin(), dir.end());
    eprom.insert( eprom.end(), programs.begin(), programs.end());

    return eprom;
}


QPixmap Datamodel::get_preview( const int index)
{
    const int width  = 14;
    const int height =  8;
    const int pixeloffset = 2;
    const int coloroffset = 2 + height * 8 * width;

    QPixmap result( width * 8,  height * 8);
    std::vector<uint8_t> data;

    if( m_kcclist[ index].get_previewsize() > 0)
    {
        QPainter *paint = new QPainter( &result);

        data = m_kcclist[ index].get_preview_raw();
        //cout << "height: " << (int) data[0] << endl;
        //cout << "width: "  << (int) data[1] << endl;

        for( int x = 0; x < width; x++)
        {
            for( int y = 0; y < ( 8 * height); y++)
            {
                uint8_t pixel = data[ pixeloffset + (x * 64) + y];
                uint8_t color = data[ coloroffset + (x * 64) + y];
                KC85Color kc85color;
                for( int index = 7; index >= 0; index--)
                {
                    if((( pixel >> index) &  0x01) == 1)
                    {
                        paint->setPen( kc85color.foreground( color));
                    }
                    else
                    {
                        paint->setPen( kc85color.background( color));
                    }
                    paint->drawPoint(( 8 * x) + 7 - index, y);
                }
            }
        }

        delete paint;
        return result;
    }
    return this->get_empty_preview();
}


void Datamodel::update_preview( const int row, QByteArray content)
{
    std::vector<uint8_t> content_vec;
    for( int index = 0; index < content.size(); index++)
    {
        content_vec.push_back( content[ index]);
    }
    m_kcclist[ row].set_icon( content_vec);
    get_preview( row);
}


QPixmap Datamodel::get_empty_preview()
{
    const int width  = 14;
    const int height =  8;

    QPixmap result( width * 8,  height * 8);
    result.fill();
    return result;
}


QString Datamodel::get_icon_filename( const int row) const
{
    return QString::fromStdString( m_kcclist[ row].get_icon_filename());
}


QString Datamodel::get_name( const int row) const
{
    return QString::fromStdString( m_kcclist[ row].get_name());
}
