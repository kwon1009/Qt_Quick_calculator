#include "connector.h"

Connector::Connector(QObject* obj) {
    root = obj;
    cal = new Calculator();
    setConnect();
}

void Connector::setConnect()
{
    QObject::connect(root, SIGNAL(sg_history()), this, SLOT(slot_history()));
    QObject::connect(root, SIGNAL(sg_calculate(QString)), this, SLOT(slot_calculate(QString)));

    QObject::connect(this, SIGNAL(sg_send_history(QVariant)), root, SLOT(slot_get_history(QVariant)));
    QObject::connect(this, SIGNAL(sg_display(QVariant)), root, SLOT(slot_display(QVariant)));
}

void Connector::slot_history()
{
    QString history = cal->getLastCal();
    emit sg_send_history(history);
}

void Connector::slot_calculate(QString calLine)
{
    try {
        double result = cal->calculate(calLine);
        emit sg_display(QString("%1").arg(result));

    }  catch (errors err) {
        QString errLog = cal->getErrorMessage(err);
        emit sg_display(errLog);
    }
}


Connector::~Connector() {}
