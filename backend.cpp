#include "backend.h"
#include <QDebug>

Backend::Backend(QObject *parent) : QObject(parent)
{
    qDebug() << "[Backend] Constructor " << endl;
}
