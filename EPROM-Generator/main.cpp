/*
 * (c) 2020 Bert Lange
 *
 * EPROM-Generator für M037-Module (M045/M046/M047)
 *
 * Applikation
 */
#include "romstart.h"
#include <QApplication>

int main( int argc, char* argv[])
{
    QApplication app( argc, argv);
    Romstart window;
    window.show();
    return app.exec();
}
