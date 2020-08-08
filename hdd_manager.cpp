#include "hdd_manager.h"
#include "storage_validator.h"
#include <QDebug>

#include <QThread>

HddManager::HddManager(QObject *parent) : QObject(parent)
{
    qDebug() << "[HddManager] Constructor";
}

HddManager::~HddManager()
{
    qDebug() << "[HddManager] Desctructor";
}

QString HddManager::getHddId(const QString &path)
{
    QStorageInfo info(path);
    return _validator.readId(info);
}

void HddManager::searchHddHandler()
{
    qDebug() << "[HddManager] On search connected hdd handler";

    QThread::sleep(3);
    _hdds.clear();
    auto storages = QStorageInfo::mountedVolumes();
    foreach (const QStorageInfo &storage, storages) {
        if(_validator.validateStorage(storage)){
            _hdds.append(storage.rootPath());
        }
    }
    emit searchFinished();
}

