#include "backend.h"
#include "hdd_manager.h"
#include <QDebug>

void Backend::_onSearchHddResponse()
{
    qDebug() << "[Backend] On search connected response...";
    _hdds = _hddManager->getHdds();
    qDebug() << _hdds;
    emit qmlHddsChanged();
}

Backend::Backend(QObject *parent) : QObject(parent)
{
    qDebug() << "[Backend] Constructor";
    _hddManager = new HddManager();

    connect(this, &Backend::searchHddRequest, _hddManager, &HddManager::searchHddHandler);
    connect(_hddManager, &HddManager::searchFinished, this, &Backend::_onSearchHddResponse);

    _hddManager->moveToThread(&_hddThread);
    _hddThread.start();

    while (!_hddThread.isRunning()){};
}

Backend::~Backend()
{
    qDebug() << "[Backend] Desctructor";
    _hddThread.quit();
    _hddThread.wait();

    delete _hddManager;
}

void Backend::searchConnectedDevises()
{
    qDebug() << "[Backend] Send search hdd request ";
    emit searchHddRequest();
}
