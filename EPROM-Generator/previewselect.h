/*
 * (c) 2020 Bert Lange
 *
 * EPROM-Generator für M037-Module (M045/M046/M047)
 *
 * Dialog für Laden und Auswahl der Vorschau
 */
#ifndef PREVIEWSELECT_H
#define PREVIEWSELECT_H

#include <QDialog>
#include <QPixmap>
#include <QGraphicsView>
#include <QDialogButtonBox>
#include <QMouseEvent>

#include "kc85color.h"

class PreviewSelect : public QDialog
{
    Q_OBJECT

    public:
        PreviewSelect( const QPixmap &, QWidget *parent = 0);
        ~PreviewSelect();

        QByteArray  get_icon();

    private slots:
        void        load_PNG();
        void        load_PIC();
        void        load_PIP();
        void        update_preview();
        void        graphicscene_update();

    private:
        void                setup_selection();

        KC85Color           m_kc;
        QPixmap             m_pixmap;
        QGraphicsScene*     m_scene;
        QGraphicsView*      m_graphicsview;
        QGraphicsRectItem*  m_rectitem;
        QPushButton*        m_pb_load_png;
        QPushButton*        m_pb_load_pic;
        QPushButton*        m_pb_load_pip;
        QDialogButtonBox*   m_buttonbox;
        QGraphicsPathItem*  m_item;

        const int           m_width = 14;
        const int           m_height = 8;
};

#endif // PREVIEWSELECT_H
