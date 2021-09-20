/*
 * (c) 2020 Bert Lange
 *
 * EPROM-Generator für M037-Module (M045/M046/M047)
 *
 * Datenmodell für die große Tabelle
 */
#ifndef DATAMODEL_H
#define DATAMODEL_H

#include <string>
#include <QAbstractItemModel>
#include "kcc.h"
#include "modul.h"


class Datamodel : public QAbstractTableModel
{
    Q_OBJECT

public:
    Datamodel( QObject *parent = 0);
    int                     size();
    int                     rowCount(const QModelIndex &parent = QModelIndex()) const;
    int                     columnCount(const QModelIndex &parent = QModelIndex()) const;
    QVariant                data(const QModelIndex &index, int role) const;
    QVariant                headerData(int section, Qt::Orientation /* orientation */, int role) const;
    QModelIndex             index(int row, int column, const QModelIndex &parent = QModelIndex()) const;
    QModelIndex             parent(const QModelIndex &index) const;
    bool                    setData(const QModelIndex &index, const QVariant &value, int role = Qt::EditRole);
    Qt::ItemFlags           flags(const QModelIndex &index) const;
    void                    add_file( std::string filename);
    int                     calc_programblocks( const Modul m) const;
    int                     active_entrys( void) const;
    std::vector<uint8_t>    build_EPROM( Modul m);
    QPixmap                 get_preview( const int index);
    void                    update_preview(const int index, QByteArray content);
    QPixmap                 get_empty_preview();
    QString                 get_icon_filename( const int row) const;
    QString                 get_name( const int row) const;


public slots:
    void                    remove_file( int pos);
    void                    move_up( unsigned int pos);
    void                    move_down( unsigned int pos);


signals:
    void                update();

private:
    std::vector<Kcc>    m_kcclist;

    enum                Columns
    {
        eIndex = 0,
        eName,
        eExtension,
        eLength,
        eLengthCompressed,
        eRatio,
        ePreview, // eArguments,
        eLoadAddress,
        eEndAddress,
        eStartAddress,
        eBlocks,
        eDelete,
        eLast
    };
};

#endif // DATAMODEL_H
