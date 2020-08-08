#ifndef HDDMANAGER_H
#define HDDMANAGER_H

#include <QObject>
#include <QList>
#include "storage_validator.h"


class HddManager : public QObject
{
    Q_OBJECT
private:
    StorageValidator _validator;
    QStringList _hdds;

public:
    explicit HddManager(QObject *parent = nullptr);
    ~HddManager();

    QStringList getHdds() {return _hdds;}
    QString getHddId(const QString& path);

public slots:
    void searchHddHandler();

signals:
    void searchFinished();

};

#endif // HDDMANAGER_H
