#include "storage_validator.h"

#include <QDirIterator>
#include <QException>
#include <QJsonObject>
#include <QJsonDocument>
#include <QDebug>

bool StorageValidator::_isReadyToWork(const QStorageInfo &storage)
{
    if (storage.isValid() && storage.isReady())
        return true;
    return false;
}

bool StorageValidator::_isMarkExist(const QStorageInfo &storage)
{
    QDirIterator it(storage.rootPath() , QStringList() << "VAL", QDir::Files);
    if(it.hasNext()){
        return true;
    }
    return false;
}

bool StorageValidator::_isArchiveFilesExist(const QStorageInfo &storage)
{
    QDirIterator it(storage.rootPath() , QStringList() << "bask_*", QDir::Files);
    if(it.hasNext()){
        return true;
    }
    return false;
}

StorageValidator::StorageValidator(QObject *parent) : QObject(parent)
{
    qDebug() << "[StorageValidator] Constructor";
}

StorageValidator::~StorageValidator()
{
    qDebug() << "[StorageValidator] Destructor";
}

bool StorageValidator::validateStorage(const QStorageInfo &storage)
{
    if(!_isReadyToWork(storage) ||
       !_isMarkExist(storage)   ||
       !_isArchiveFilesExist(storage)){
        return false;
    }
    return true;
}

QString StorageValidator::readId(const QStorageInfo &storage)
{
    QString result("None_ID");
    QDir directory(storage.rootPath());
    auto baskets = directory.entryInfoList(QStringList() << "VAL*", QDir::Files);

    for(auto it = baskets.constBegin(); it != baskets.constEnd(); ++it)
    {
        QFile file(it->filePath());
        file.open(QIODevice::ReadOnly);

        QByteArray wholeFile = file.readAll();
        QJsonObject const jsonDocument = QJsonDocument::fromJson(wholeFile).object();
        result = jsonDocument["ID"].toString("None");
        break;
    }
    return result;
}
