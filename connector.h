#ifndef CONNECTOR_H
#define CONNECTOR_H

#include <QQuickView>
#include <QObject>
#include "calculator.h"

class Connector : public QObject
{
    Q_OBJECT
private:
    QObject* root;
    Calculator *cal;
    void setConnect();

public:
    Connector(QObject* obj);
    ~Connector();

signals:
    void sg_display(QVariant str);
    void sg_send_history(QVariant str);

private slots:
    void slot_history();
    void slot_calculate(QString calLine);

};

#endif // CONNECTOR_H
