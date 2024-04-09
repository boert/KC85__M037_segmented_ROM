/*
 * (c) 2020, 2024 Bert Lange
 *
 * EPROM-Generator für M037-Module (M045/M046/M047)
 * und M062 (32k/64k)
 *
 * Klasse für das eigentliche Hauptfenster
 */

#include <QFileDialog>
#include <QPen>
#include <QPointF>

#include "romstart.h"
#include "datamodel.h"


Romstart::Romstart( QMainWindow *parent) : QMainWindow( parent)
{
    setupUi( this);

    // status Bar
    this->setStatusBar( &m_status);
    m_copy_message.setText( "V1.2, © Bert Lange 2020-2024, ZX7 by Einar Saukas 2012");
    m_status.addPermanentWidget( &m_copy_message);

    // hide toolbar
    this->toolBar->close();

    // add some icons on buttons

    setWindowIcon( QIcon(":/icons/Symbol.jpg"));

    pb_addfile->setIcon( QIcon( ":/icons/add_file.png"));
    pb_preview->setIcon( QIcon( ":/icons/preview.png"));
    pb_eprom->setIcon( QIcon( ":/icons/EPROM.png"));
    pb_quit->setIcon( QIcon( ":/icons/OFF.png"));

    // fill combo-box
    for( int index = 0; index < m_modul_list.size(); index++)
    {
        cb_modul->addItem( m_modul_list.at( index));
    }
    
    connect( cb_modul, QOverload<int>::of( &QComboBox::currentIndexChanged), this, &Romstart::select_modul);
    connect( pb_addfile, SIGNAL( clicked()), this, SLOT( add_files()));
    //connect( pb_addfile, &QPushButton::clicked, this, &Romstart::add_files); // geht nicht
    connect( &m_delegate, &Delegate::removeButtonPressed, this, &Romstart::remove_file);
    connect( &m_delegate, &Delegate::moveButtonUpPressed, &m_model, &Datamodel::move_up);
    connect( &m_delegate, &Delegate::moveButtonDownPressed, &m_model, &Datamodel::move_down);
    connect( &m_model, &Datamodel::update, this, &Romstart::recalcBlocks);
    connect( pb_preview, &QPushButton::clicked, this, &Romstart::exchange_preview);
    connect( pb_eprom, &QPushButton::clicked, this, &Romstart::generate_EPROM);
    connect( pb_quit, &QPushButton::clicked, this, &Romstart::close);

    // disable generate button
    pb_eprom->setEnabled( false);
    pb_preview->setEnabled( false);


    // save palette
    m_palette_normal = pr_auslastung->palette();

    m_palette_full = pr_auslastung->palette();
    m_palette_full.setColor( QPalette::Highlight, Qt::red);


    tv_kcclist->setModel( &m_model);
    tv_kcclist->setItemDelegate( &m_delegate);
    tv_kcclist->setSelectionMode( QAbstractItemView::SingleSelection);
    tv_kcclist->setSelectionBehavior( QAbstractItemView::SelectRows);
    tv_kcclist->resizeColumnsToContents();
    connect( tv_kcclist->selectionModel(), &QItemSelectionModel::selectionChanged, this, &Romstart::update_preview);

    // Kommandozeile auswerten und ggf. Dateien laden
    QStringList fileNames = QCoreApplication::arguments();
    if( !fileNames.isEmpty())
    {
        fileNames.removeFirst(); // oder .removeAt(0)
        add_files( fileNames);
    }
    recalcBlocks();
    tv_kcclist->selectRow( 0);

    // initial ROM size
    //rb_M045->click();
    update_modul_labels();
}


Romstart::~Romstart()
{
}


void Romstart::select_modul( int index)
{
    //qDebug() << "Index: " << index;
    //qDebug() << cb_modul->currentText();
    switch( index)
    {
        case 0: m_modul.set_type( M045);     break;
        case 1: m_modul.set_type( M046);     break;
        case 2: m_modul.set_type( M047);     break;
        case 3: m_modul.set_type( M062_32k); break;
        case 4: m_modul.set_type( M062_64k); break;
    }
    update_modul_labels();
}


void Romstart::update_modul_labels()
{
    QString capa;
    capa = QString( "Kapazität: %1 kByte").arg( m_modul.get_size() / 1024, 3);
    lbl_capa->setText( capa);
    lbl_epromtyp->setText( QString::fromStdString( m_modul.get_eprom_name()));
        
    int epromblocksize;
    epromblocksize =  m_modul.get_blocks();
    lc_blocks->display( epromblocksize);

    int count;
    count = m_modul.get_eprom_count();
    epromblocksize /= count;

    if( count == 4)
    {
        pr_eprom_1->setMaximum( epromblocksize);
        pr_eprom_2->setMaximum( epromblocksize);
        pr_eprom_3->setMaximum( epromblocksize);
        pr_eprom_4->setMaximum( epromblocksize);
        // alle einblenden
        lbl_eprom_1->setVisible( 1); pr_eprom_1->setFixedWidth( 25);
        lbl_eprom_2->setVisible( 1); pr_eprom_2->setVisible( 1);
        lbl_eprom_3->setVisible( 1); pr_eprom_3->setVisible( 1);
        lbl_eprom_4->setVisible( 1); pr_eprom_4->setVisible( 1);
    }
    if( count == 1)
    {
        pr_eprom_1->setMaximum( epromblocksize);
        lbl_eprom_1->setVisible( 0); pr_eprom_1->setFixedWidth( 118);
        // 2-4 ausblenden
        lbl_eprom_2->setVisible( 0); pr_eprom_2->setVisible( 0);
        lbl_eprom_3->setVisible( 0); pr_eprom_3->setVisible( 0);
        lbl_eprom_4->setVisible( 0); pr_eprom_4->setVisible( 0);
    }
    recalcBlocks();
}


void Romstart::add_files( QStringList fileNames)
{
    QString message = "Datei geladen: ";

    for ( const auto& fileName : fileNames  )
    {
        m_model.add_file( fileName.toStdString());
        tv_kcclist->resizeColumnsToContents();
        pb_preview->setEnabled( true);
        message += QFileInfo( fileName).fileName() + ", ";
    }
    int last_komma = message.lastIndexOf( ",");
    if( last_komma > 0) message = message.left( last_komma);
    m_status.showMessage( message, 10000);
}


void Romstart::add_files()
{
    QStringList fileNames;
    QFileDialog dialog( this);
    QString message = "Datei geladen: ";

    dialog.setWindowTitle( "KCC-Datei(en) öffnen");
    dialog.setFileMode( QFileDialog::ExistingFiles);
    dialog.setNameFilter( "KCC-Dateien (*.KCC)");
    dialog.setViewMode( QFileDialog::Detail);
    if( dialog.exec())
    {
        fileNames = dialog.selectedFiles();
        for ( const auto& fileName : fileNames  )
        {
            m_model.add_file( fileName.toStdString());
            message += QFileInfo( fileName).fileName() + ", ";
        }

        tv_kcclist->selectRow( m_model.rowCount() - 1);
        tv_kcclist->resizeColumnsToContents();
        pb_preview->setEnabled( true);
    }

    int last_komma = message.lastIndexOf( ",");
    if( last_komma > 0) message = message.left( last_komma);
    m_status.showMessage( message, 10000);
}


void Romstart::remove_file( int index)
{
    QString message = m_model.get_name( index) + " enfernt.";

    m_model.remove_file( index);
    if( m_model.size() < 1)
    {
        pb_preview->setEnabled( false);
    }
    m_status.showMessage( message, 10000);
}


void Romstart::recalcBlocks()
{
    int romstart_blocks = m_modul.get_romstart_blocksize();
    int entrys;
    int dirblocks;
    int programblocks;
    int totalblocks;
    int free;

    lc_romstart->display( romstart_blocks);

    entrys = m_model.active_entrys();
    dirblocks = m_modul.calc_dirblocks( entrys);
    lc_directory->display( dirblocks);

    programblocks = m_model.calc_programblocks( m_modul);
    lc_programs->display( programblocks);

    totalblocks = romstart_blocks + dirblocks + programblocks;
    lc_sum->display( totalblocks);
    free = m_modul.get_blocks() - totalblocks;
    if( free < 0)
    {
        free = 0;
        pb_eprom->setEnabled( false);
    }
    else
    {
        pb_eprom->setEnabled( true);
    }
    if( entrys == 0)
    {
        pb_eprom->setEnabled( false);
    }
    lc_free->display( free);

    float percent = 100.0 * totalblocks / m_modul.get_blocks();

    if( percent > 100.0)
    {
        pr_auslastung->setPalette( m_palette_full);
        pr_auslastung->setValue( 100);
    }
    else
    {
        pr_auslastung->setPalette( m_palette_normal);
        pr_auslastung->setValue( int( percent));
    }

    int epromsum = totalblocks;
    int epromcount = m_modul.get_eprom_count();
    
    int epromsize;
    epromsize = m_modul.get_blocks() / epromcount;

    if( epromsum > epromsize)
    {
        pr_eprom_1->setValue( epromsize);
        epromsum -= epromsize;
    }
    else
    {
        pr_eprom_1->setValue( epromsum);
        epromsum = 0;
    }

    if( epromsum > epromsize)
    {
        pr_eprom_2->setValue( epromsize);
        epromsum -= epromsize;
    }
    else
    {
        pr_eprom_2->setValue( epromsum);
        epromsum = 0;
    }

    if( epromsum > epromsize)
    {
        pr_eprom_3->setValue( epromsize);
        epromsum -= epromsize;
    }
    else
    {
        pr_eprom_3->setValue( epromsum);
        epromsum = 0;
    }

    if( epromsum > epromsize)
    {
        pr_eprom_4->setValue( epromsize);
        epromsum -= epromsize;
    }
    else
    {
        pr_eprom_4->setValue( epromsum);
        epromsum = 0;
    }
}


void Romstart::generate_EPROM()
{
    std::vector<uint8_t> eprom_vec = m_model.build_EPROM( m_modul);
#if 0
    QByteArray eprom = QByteArray( reinterpret_cast<const char*>( eprom_vec.data(), eprom_vec.size()));
#else
    QByteArray eprom;
    eprom.reserve( eprom_vec.size());
    for( size_t index = 0; index < eprom_vec.size(); index++)
    {
        eprom.append( eprom_vec[ index]);
    }
#endif

    // write single file
    QString name_advice = QString::fromStdString( "EPROM_" + m_modul.get_name() + ".bin");
    QString filename = QFileDialog::getSaveFileName( this, "EPROM-Datei speichern", name_advice);

    if( filename.size() > 0)
    {
        QSaveFile file( filename);
        file.open( QIODevice::WriteOnly);
        file.write( eprom);
        file.commit();

        QString message = QFileInfo( filename).fileName() + " erfolgreich geschrieben.";
        m_status.showMessage( message, 10000);
    }

    // Einzeldateien erstellen
    if(( filename.size() > 0) && ( m_modul.get_eprom_count() > 1))
    {
        int single_size = m_modul.get_size() / 4;
        QByteArray part0 = eprom.mid( 0 * single_size, single_size);
        QByteArray part1 = eprom.mid( 1 * single_size, single_size);
        QByteArray part2 = eprom.mid( 2 * single_size, single_size);
        QByteArray part3 = eprom.mid( 3 * single_size, single_size);
        if( part0.size() > 0 )
        {
            QSaveFile file0( filename + "_ROM0");
            file0.open( QIODevice::WriteOnly);
            file0.write( part0);
            file0.commit();
        }
        if( part1.size() > 0 )
        {
            QSaveFile file1( filename + "_ROM1");
            file1.open( QIODevice::WriteOnly);
            file1.write( part1);
            file1.commit();
        }
        if( part2.size() > 0 )
        {
            QSaveFile file2( filename + "_ROM2");
            file2.open( QIODevice::WriteOnly);
            file2.write( part2);
            file2.commit();
        }
        if( part3.size() > 0 )
        {
            QSaveFile file3( filename + "_ROM3");
            file3.open( QIODevice::WriteOnly);
            file3.write( part3);
            file3.commit();
        }
    }
}


void Romstart::exchange_preview()
{
    int rows = m_model.rowCount();
    int row = tv_kcclist->selectionModel()->currentIndex().row();
    //qDebug() << "modify preview on table row:" << row;

    // Bereich prüfen (index invalid)
    if( rows < 1) return;
    if( row < 0) return;
    if( row - 1 > rows) return;

    QPixmap pm = m_model.get_preview( row).scaledToWidth( 224, Qt::FastTransformation);

    PreviewSelect* ps = new PreviewSelect( pm, this);
    if( ps->exec() == QDialog::Accepted)
    {
        QByteArray icon = ps->get_icon();
        QString filename = QFileDialog::getSaveFileName( this, "ICN-Datei speichern", m_model.get_icon_filename( row));

        if( filename.size() > 0)
        {
            QSaveFile file( filename);
            file.open( QIODevice::WriteOnly);
            file.write( icon);
            file.commit();

            QString message = QFileInfo( filename).fileName() + " erfolgreich geschrieben.";
            m_status.showMessage( message, 10000);
        }
        m_model.update_preview( row, icon);
        tv_kcclist->clearSelection();
        tv_kcclist->selectRow( row);
    }
    ps->deleteLater(); // immer aufräumen!!
}


void Romstart::update_preview( QItemSelection a, QItemSelection b)
{
    Q_UNUSED( b);
    if( a.indexes().size() > 0) // blöder Hack, weil rowCount() noch nicht aktuell ist
    {
        //qDebug() << "indexsize" << a.indexes().size();
        QModelIndex index = a.indexes()[ 0];
        lbl_preview->setPixmap( m_model.get_preview( index.row()).scaledToWidth( 224, Qt::FastTransformation));
    }
    else
    {
        //qDebug() << "a:" << a << " b:" << b;
        lbl_preview->setPixmap( m_model.get_empty_preview().scaledToWidth( 224, Qt::FastTransformation));
    }
}
