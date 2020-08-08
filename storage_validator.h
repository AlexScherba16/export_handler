#ifndef STORAGEVALIDATOR_H
#define STORAGEVALIDATOR_H

#include <QObject>
#include <QStorageInfo>

class StorageValidator : public QObject
{
    Q_OBJECT

    bool _isReadyToWork(const QStorageInfo &storage);
    bool _isMarkExist(const QStorageInfo &storage);
    bool _isArchiveFilesExist(const QStorageInfo &storage);

public:
    explicit StorageValidator(QObject *parent = nullptr);
    ~StorageValidator();

    bool validateStorage(const QStorageInfo &storage);
    QString readId(const QStorageInfo &storage);

signals:

};

#endif // STORAGEVALIDATOR_H
