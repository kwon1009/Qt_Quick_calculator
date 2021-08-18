#include "connector.h"

Connector::Connector(QQmlApplicationEngine* engine) {
    mEngine = engine;
    mRoot = mEngine->rootObjects()[0];
    cal = new Calculator();
    setWindow(qobject_cast<QQuickWindow*>(mRoot));
    setConnect();
}

void Connector::setWindow(QQuickWindow* Window){
    mMainView = Window;
}

void Connector::setConnect()
{
    QObject::connect(mMainView, SIGNAL(sg_history()), this, SLOT(slot_history()));
    QObject::connect(mMainView, SIGNAL(sg_calculate(QString)), this, SLOT(slot_calculate(QString)));

    QObject::connect(this, SIGNAL(sg_send_history(QVariant)), mMainView, SLOT(slot_get_history(QVariant)));
    QObject::connect(this, SIGNAL(sg_display(QVariant)), mMainView, SLOT(slot_display(QVariant)));
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
