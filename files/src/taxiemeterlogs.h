#ifndef TAXIEMETERLOGS_H
#define TAXIEMETERLOGS_H
#include <QString>
//#include "commonfile.h"
#include <QTime>
#include <QDateTime>

extern void initializeDatabase();
extern bool writeData(const QString &username, const QString &content) ;
extern void fetchLast60();
extern void saveTotalizerData();
//extern QList<QVariantList> fetchRowsInRange(const QString &startTime, const QString &endTime);
extern void fetchRowsInRange( QString startTime,  QString endTime);
#endif // TAXIEMETERLOGS_H



