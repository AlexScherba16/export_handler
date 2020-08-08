#ifndef BACKEND_H
#define BACKEND_H

#include <QObject>
#include <QThread>
class HddManager;

class Backend : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QStringList hdds READ getHdds NOTIFY qmlHddsChanged)

private:
    HddManager* _hddManager;
    QThread _hddThread;


    /* Properties */
    QStringList _hdds;

private slots:
    void _onSearchHddResponse();



public:
    explicit Backend(QObject *parent = nullptr);
    ~Backend();

    QStringList getHdds(){return _hdds;}


    Q_INVOKABLE void searchConnectedDevises();

signals:
    void qmlHddsChanged();


    void searchHddRequest();

};

#endif // BACKEND_H
