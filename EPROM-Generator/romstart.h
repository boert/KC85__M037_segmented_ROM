/*
 * (c) 2020 Bert Lange
 *
 * EPROM-Generator für M037-Module (M045/M046/M047)
 *
 * Klasse für das eigentliche Hauptfenster
 */
#ifndef ROMSTART_H
#define ROMSTART_H

#include "ui_qtprogramm.h"
#include "modul.h"
#include "kcc.h"
#include "datamodel.h"
#include "delegate.h"
#include "previewselect.h"

#include <QItemSelectionModel>

class Romstart : public QMainWindow, public Ui::MainWindow
{
    Q_OBJECT

    public:
        Romstart( QMainWindow *parent = 0);
        ~Romstart();
        void add_files( QStringList);
        void update_modul_labels();

    private slots:
        void set_M045();
        void set_M046();
        void set_M047();

        void add_files();
        void remove_file( int);
        void recalcBlocks();
        void generate_EPROM();
        void exchange_preview();
        void update_preview( QItemSelection, QItemSelection);

    private:
        Delegate        m_delegate;
        Datamodel       m_model;
        Modul           m_modul;
        QPalette        m_palette_normal;
        QPalette        m_palette_full;
        QStatusBar      m_status;
        QLabel          m_copy_message;
};

#endif // ROMSTART_H
