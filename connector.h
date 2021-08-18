#ifndef CONNECTOR_H
#define CONNECTOR_H

#include <QQuickWindow>
#include <QObject>
#include <QQmlApplicationEngine>
#include "calculator.h"

class Connector : public QObject
{
    Q_OBJECT
private:
    QQmlApplicationEngine* mEngine;
    QObject* mRoot;
    QQuickWindow* mMainView;

    Calculator *cal;
    void setConnect();
    void setWindow(QQuickWindow* window);

public:
    Connector(QQmlApplicationEngine* engine);
    ~Connector();

signals:
    void sg_display(QVariant str);
    void sg_send_history(QVariant str);

private slots:
    void slot_history();
    void slot_calculate(QString calLine);

};

#endif // CONNECTOR_H
