/*
 * (c) 2020 Bert Lange
 *
 * EPROM-Generator für M037-Module (M045/M046/M047)
 *
 * Spezielle Interaktionen die große Tabelle
 */
#include "delegate.h"

//#include <iostream>
#include <QtGui>
#include <QApplication>
#include <QSpinBox>
#include <QDebug>


Delegate::Delegate( QObject *parent) : QItemDelegate( parent)
{    
}


QSize Delegate::sizeHint( const QStyleOptionViewItem &option, const QModelIndex &index) const
{
    QSize sz = QItemDelegate::sizeHint(option, index);
    int w = sz.width();
    if( index.column() == 0)    // Frage: wie Zugriff auf enum von datamodel
    {
        //cout << "width: " << w << endl;
        if( w > 20)
        {
            w -= 20;
        }
        else
        {
            w = 1;
        }
    }
    if( index.column() == 11)
    {
        w = 65;
    }
    sz.setWidth( w);
    return sz;
}


void Delegate::paint(QPainter *painter, const QStyleOptionViewItem &option, const QModelIndex &index) const
{
    QStyleOptionSpinBox spin;
    QStyleOptionButton remove_button;
    QRect r = option.rect;
    int x, y, w, h;

    // erstmal normal malen
    QItemDelegate::paint( painter, option, index);

    switch( index.column())
    {
        case 0:
            // dann die Buttons
            w = 30;
            h = 30;
            x = r.left() + r.width() - w;
            y = r.top();
            spin.rect = QRect( x, y, w, h);

            if( index.row() > 0)
            {
                spin.stepEnabled |= QAbstractSpinBox::StepUpEnabled;
            }
            if( index.row() < ( index.model()->rowCount() - 1))
            {
                spin.stepEnabled |= QAbstractSpinBox::StepDownEnabled;
            }
            QApplication::style()->drawComplexControl( QStyle::CC_SpinBox, &spin, painter, NULL);
            break;

        case 11:
            w = 65;
            h = 30;
            x = r.left();// + r.width() - w;
            y = r.top() - 1;
            remove_button.rect = QRect( x, y, w, h);
            remove_button.text = "Entfernen";
            remove_button.state = QStyle::State_Enabled;
            QApplication::style()->drawControl( QStyle::CE_PushButton, &remove_button, painter);
            break;
    }
}


bool Delegate::editorEvent(QEvent *event, QAbstractItemModel *model, const QStyleOptionViewItem &option, const QModelIndex &index)
{
    if( event->type() == QEvent::MouseButtonRelease)
    {
        // for preview
        //emit activated(( unsigned int) index.row());

        // check column
        switch( index.column())
        {
            case 0:
            {
                 QMouseEvent * e = (QMouseEvent *)event;
                 QRect r_up = option.rect;

                 int ypos_in_field = e->position().y() - r_up.y();
                 //cout << "Clicked! (" << e->position().y() << ")" << endl;
                 if( r_up.contains( e->pos()))
                 {
                     if( ypos_in_field < 15)
                     {
                        emit moveButtonUpPressed(( unsigned int) index.row());
                     }
                     else
                     {
                        emit moveButtonDownPressed(( unsigned int) index.row());
                     }
                     return true;
                 }
                 break;
            }

            case 11:
            {
                 QMouseEvent * e = (QMouseEvent *)event;
                 int clickX = e->position().x();
                 int clickY = e->position().y();

                 QRect r = option.rect;
                 int x, y, w, h;
                 x = r.left() + r.width() - 65;
                 y = r.top();
                 w = 65;
                 h = 30;

                 if( clickX > x && clickX < x + w )
                 if( clickY > y && clickY < y + h )
                 {
                     emit removeButtonPressed( index.row());
                     return true;
                 }
            break;
            }
        }
    }
    else if( event->type() == QEvent::KeyPress)
    {
        //cout << "KeyPress on row: " << index.row() << endl;
        //emit activated(( unsigned int) index.row());
    }
    else
    {
        //cout << "Event: " << event->type() << endl;
        // 2 = MouseButtonPress
        // 6 = KeyPress
    }
    return QItemDelegate::editorEvent( event, model, option, index);
}
