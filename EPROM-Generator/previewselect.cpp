/*
 * (c) 2020 Bert Lange
 *
 * EPROM-Generator für M037-Module (M045/M046/M047)
 *
 * Dialog für Laden und Auswahl der Vorschau
 */
#include "previewselect.h"

#include <iostream>

#include <QLabel>
#include <QPushButton>
#include <QGraphicsView>
#include <QVBoxLayout>
#include <QFileDialog>
#include <QDebug>
#include <QGraphicsRectItem>



PreviewSelect::PreviewSelect( const QPixmap &pm, QWidget *parent) : QDialog( parent)
{
    setWindowTitle( "Vorschaubild ändern");
    setWindowFlags( Qt::Dialog);
    setWindowModality( Qt::WindowModal);

    m_graphicsview = new QGraphicsView( this);
    m_graphicsview->setMinimumSize( QSize( 640 + 16, 512 + 16));
    m_graphicsview->setDragMode( QGraphicsView::NoDrag); // hilft nicht (avoid scrollbars
    m_scene = new QGraphicsScene( this);

    m_pixmap = pm;

    m_scene->addPixmap( m_pixmap);
    //m_scene->addItem( m_item);

    m_graphicsview->setScene( m_scene);
    m_graphicsview->show();

    m_pb_load_png = new QPushButton( "PNG/JPEG", this);
    m_pb_load_pic = new QPushButton( "PIC", this);
    m_pb_load_pip = new QPushButton( "PIP/PIF", this);

    m_buttonbox = new QDialogButtonBox( this);
    m_buttonbox->addButton( m_pb_load_png, QDialogButtonBox::ActionRole);
    m_buttonbox->addButton( m_pb_load_pic, QDialogButtonBox::ActionRole);
    m_buttonbox->addButton( m_pb_load_pip, QDialogButtonBox::ActionRole);
    m_buttonbox->addButton( QDialogButtonBox::Cancel);
    m_buttonbox->addButton( QDialogButtonBox::Save);

    QVBoxLayout* layout = new QVBoxLayout( this);
    layout->addWidget( m_graphicsview);
    layout->addWidget( m_buttonbox);

    setLayout( layout);
    // clicked, pressed or released
    connect( m_pb_load_png, &QPushButton::clicked, this, &PreviewSelect::load_PNG);
    connect( m_pb_load_pic, &QPushButton::clicked, this, &PreviewSelect::load_PIC);
    connect( m_pb_load_pip, &QPushButton::clicked, this, &PreviewSelect::load_PIP);
    connect( m_buttonbox->button( QDialogButtonBox::Cancel), &QPushButton::clicked, this, &PreviewSelect::reject);
    connect( m_buttonbox->button( QDialogButtonBox::Save), &QPushButton::clicked, this, &PreviewSelect::accept);
    connect( m_scene, &QGraphicsScene::changed, this, &PreviewSelect::graphicscene_update);

    m_buttonbox->button( QDialogButtonBox::Save)->setEnabled( false);
}


PreviewSelect::~PreviewSelect()
{
}


void PreviewSelect::load_PNG( void)
{
    QStringList fileNames;
    QFileDialog dialog( this);

    dialog.setWindowTitle( "PNG/JPG Datei für Vorschau öffnen");
    dialog.setFileMode( QFileDialog::ExistingFile);
    dialog.setNameFilters( QStringList() << "Bild-Dateien (*.png *.jpg *.jpeg)" << "Alle Dateien (*)");
    dialog.setViewMode( QFileDialog::Detail);
    if( dialog.exec())
    {
        fileNames = dialog.selectedFiles();
        m_pixmap = m_kc.load_PNG( fileNames[ 0]);
        m_pixmap = m_pixmap.scaledToWidth( m_pixmap.width() * 2, Qt::FastTransformation);
        update_preview();
        m_buttonbox->button( QDialogButtonBox::Save)->setEnabled( true);
    }
}


void PreviewSelect::load_PIC( void)
{
    QStringList fileNames;
    QFileDialog dialog( this);

    dialog.setWindowTitle( "PIC Datei für Vorschau öffnen (KC85/3-Screenshot)");
    dialog.setFileMode( QFileDialog::ExistingFile);
    dialog.setNameFilters( QStringList() << "PIC-Dateien (*.pic *.PIC)" << "Alle Dateien (*)");
    dialog.setViewMode( QFileDialog::Detail);
    if( dialog.exec())
    {
        fileNames = dialog.selectedFiles();
        m_pixmap = m_kc.load_PIC( fileNames[ 0]);
        m_pixmap = m_pixmap.scaledToWidth( m_pixmap.width() * 2, Qt::FastTransformation);
        update_preview();
        m_buttonbox->button( QDialogButtonBox::Save)->setEnabled( true);
    }
}


void PreviewSelect::load_PIP( void)
{
    QStringList fileNames;
    QFileDialog dialog( this);

    dialog.setWindowTitle( "PIP/PIF Datei für Vorschau öffnen (KC85/4-Screenshot)");
    dialog.setFileMode( QFileDialog::ExistingFile);
    dialog.setNameFilters( QStringList() << "PIP/PIF-Dateien (*.pip *.pif)" << "Alle Dateien (*)");
    dialog.setViewMode( QFileDialog::Detail);
    if( dialog.exec())
    {
        fileNames = dialog.selectedFiles();
        m_pixmap = m_kc.load_PIP( fileNames[ 0]);
        m_pixmap = m_pixmap.scaledToWidth( m_pixmap.width() * 2, Qt::FastTransformation);
        update_preview();
        m_buttonbox->button( QDialogButtonBox::Save)->setEnabled( true);
    }
}


void PreviewSelect::setup_selection()
{
#if 0
    //m_rectitem = new QGraphicsRectItem();

    //QPolygon border;
    //border.append(QPoint(0,0));
    //border.append(QPoint(0,25));
    //border.append(QPoint(50,25));
    //border.append(QPoint(50,0));
    //border.append(QPoint(0,0));
    //QGraphicsPathItem border;
    QPainterPath border;
    border.lineTo( QPoint( 0, 25));
    border.lineTo( QPoint( 50, 25));
    border.lineTo( QPoint( 50, 0));
    border.lineTo( QPoint( 0, 0));

    QPen pen;
    QBrush brush;
    pen.setColor(Qt::black);
    //brush.setColor(Qt::black);
    brush.setStyle(Qt::SolidPattern);

    //m_rectitem->setRect( QRect(0,0,width*8,8*8));
    //m_rectitem->setBrush(QBrush(Qt::blue));

    //QGraphicsPathItem pi( border);
    //pi.setFlags( QGraphicsItem::ItemIsMovable | QGraphicsItem::ItemIsSelectable);

    //m_scene->addPolygon( border, pen, brush);
    //m_scene->addPath( border);
    //m_scene->addItem( pi);
#endif
    int width = 2 * 8 * m_width;
    int height = 2 * 8 * m_height;
    m_item = new QGraphicsPathItem();
    QPainterPath* path = new QPainterPath();
    path->setFillRule( Qt::WindingFill);
#if 0
    path->lineTo( QPoint( 0, height));
    path->lineTo( QPoint( width, height));
    path->lineTo( QPoint( width, 0));
    path->lineTo( QPoint( 0, 0));
    path->lineTo( QPoint( 1, 1));
    path->lineTo( QPoint( 1, height-1));
    path->lineTo( QPoint( width-1, height-1));
    path->lineTo( QPoint( width-1, 1));
    path->lineTo( QPoint( 1, 1));
#endif
    path->addRect( 0, 0, width, height);
    path->addRect( 1, 1, width - 2, height - 2);
    path->addRect( 2, 2, width - 4, height - 4);
    m_item->setPath( *path);
    //m_item->setBrush( QColor(255, 100, 100)); // mal Rechteck, nicht den Rand :-(
    m_item->setFlag( QGraphicsItem::ItemIsMovable);
    m_item->setFlag( QGraphicsItem::ItemIsSelectable);
    //item->setFlag( QGraphicsItem::ItemSendsGeometryChanges);
    m_item->setFlag( QGraphicsItem::ItemSendsScenePositionChanges);
}


void PreviewSelect::update_preview()
{
    m_scene->clear();

    setup_selection();
    m_scene->addPixmap( m_pixmap);
    m_scene->addItem( m_item);

    m_scene->items()[0]->setSelected( true);

    m_scene->update();
}


void PreviewSelect::graphicscene_update()
{
    QList<QGraphicsItem *> items = m_scene->items();

    int x = items[0]->pos().x();
    int y = items[0]->pos().y();

    // quanzisize
    x = x - x % 16;
    y = y - y % 16;

    const int maxx = 2 * 8 * (40 - m_width);
    const int maxy = 2 * 8 * (32 - m_height);

    // limit coordinates
    if( x < 0) x = 0;
    if( y < 0) y = 0;
    if( x > maxx) x = maxx;
    if( y > maxy) y = maxy;

    //qDebug() << "update: " << items[0]->pos() << ", "<< x;

    m_scene->items()[0]->setPos( QPointF( x, y));

    // Scrollbalken verhindern
    // unschön wg. fixen Zahlen
    if(( x > 0) || (y > 0))
    {
        const QRectF rect = QRectF( -4, -4, 640+8, 512+8);
        m_graphicsview->setSceneRect( rect);
    }
}


QByteArray PreviewSelect::get_icon()
{
    int x = m_scene->items()[0]->pos().x() / 16;
    int y = m_scene->items()[0]->pos().y() / 16;

    return m_kc.get_icon( x, y, m_width, m_height);
}
