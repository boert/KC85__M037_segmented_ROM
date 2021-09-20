/*
 * (c) 2020 Bert Lange
 *
 * EPROM-Generator für M037-Module (M045/M046/M047)
 *
 * Spezielle Interaktionen die große Tabelle
 */
#ifndef DELEGATE_H
#define DELEGATE_H

#include <QItemDelegate>
#include <QtGui>
#include <QPushButton>


class Delegate : public QItemDelegate
{
    Q_OBJECT

public:
    QScopedPointer<QPushButton> butt;
    Delegate( QObject *parent = 0);
    QSize sizeHint(const QStyleOptionViewItem &option, const QModelIndex &index) const;
    void paint( QPainter *painter, const QStyleOptionViewItem &option, const QModelIndex &index) const;
    bool editorEvent( QEvent *event, QAbstractItemModel *model, const QStyleOptionViewItem &option, const QModelIndex &index);

signals:
    void removeButtonPressed( int);
    void moveButtonUpPressed( unsigned int);
    void moveButtonDownPressed( unsigned int);
    void activated( unsigned int);
};

#endif // DELEGATE_H
