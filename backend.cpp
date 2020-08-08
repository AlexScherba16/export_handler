#include "backend.h"
#include <QDebug>

Backend::Backend(QObject *parent) : QObject(parent)
{
    qDebug() << "[Backend] Constructor";
}

Backend::~Backend()
{
    qDebug() << "[Backend] Desctructor";
}
