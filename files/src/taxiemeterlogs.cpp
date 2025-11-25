#include <stdio.h>
#include <stdlib.h>
#include <cjson/cJSON.h>
#include "commonfile.h"
#include <QString>
#include <string>
#include <iostream>
#include <QDebug>

#include <QtSql/QSqlDatabase>
#include <QtSql/QSqlQuery>



#include <QSqlDatabase>
#include <QSqlQuery>
#include <QSqlError>
#include <QDebug>


#include "back.h"
void initializeTotalizerDbLoop();
QSqlDatabase db;
void initializeDatabase() {

    initializeTotalizerDbLoop();

    db = QSqlDatabase::addDatabase("QSQLITE","DB2Connection");
    db.setDatabaseName("messages.db");

    if (!db.open()) {
        qDebug() << "Database connection failed:" << db.lastError().text();
        return;
    }

    QSqlQuery query(db);
    QString createTable = R"(
        CREATE TABLE IF NOT EXISTS messages (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            username TEXT NOT NULL,
            datetime TEXT NOT NULL,
            content TEXT NOT NULL
        );
    )";
    if (!query.exec(createTable)) {
        qDebug() << "46 - Failed to create table:" << query.lastError().text();
    }
}

bool writeData(const QString &username, const QString &content) {
    QSqlQuery query(db);
    QString insertQuery = R"(
        INSERT INTO messages (username, datetime, content)
        VALUES (:username, datetime('now', 'localtime'), :content);
    )";

    query.prepare(insertQuery);
    query.bindValue(":username", username);
    query.bindValue(":content", content);

    if (!query.exec()) {
        qDebug() << "Failed to insert data:" << query.lastError().text();
        return false;
    }
    return true;
}



void fetchLast60() {
    QList<QVariantList> resultList;
    QSqlQuery query(db);

    query.exec("SELECT * FROM messages ORDER BY datetime DESC LIMIT 60");

    while (query.next()) {
//        QVariantList row;
//        row << query.value("id")
//            << query.value("username")
//            << query.value("datetime")
//            << query.value("content");


        QStringList logmsgArray={query.value("id").toString(),query.value("username").toString(), query.value("datetime").toString(), query.value("content").toString()};
        appUi->system_LogRowMsg(logmsgArray);
//        qDebug()<<"logmsgArray "<<logmsgArray;
//        actionFunction(logmsgArray);


//        resultList.append(row);
    }

//    return resultList;
}

void fetchRowsInRange( QString startTime,  QString endTime) {
//    QList<QVariantList> resultList;

    qDebug()<<"recived time :"<<startTime<<" , "<<endTime;

    QSqlQuery query(db);
    query.prepare(R"(
        SELECT * FROM messages
        WHERE datetime BETWEEN :start_time AND :end_time
        ORDER BY datetime ASC;
    )");
    query.bindValue(":start_time", startTime);
    query.bindValue(":end_time", endTime);

    if (!query.exec()) {
        qDebug() << "Failed to fetch rows:" << query.lastError().text();
//        return resultList;
    }

    while (query.next()) {
//        QVariantList row;
//        row << query.value("id")
//            << query.value("username")
//            << query.value("datetime")
//            << query.value("content");

        QStringList logmsgArray={query.value("id").toString(),query.value("username").toString(), query.value("datetime").toString(), query.value("content").toString()};
        appUi->system_LogRowMsg(logmsgArray);
//        resultList.append(row);
//        qDebug() << logmsgArray[2];
    }

//    return resultList;
}
















#include <QTimer>



QSqlDatabase totalizerDb;
QTimer *totalizerDbtimer;
//double numberofJourneys;

void saveTotalizerData() { // add to loop with if (hireDoneFlage)
    // Convert the accumulated number to a string and save it to the database

//        numberofJourneys += 1.0;


    QString numberAsString = QString::number(numberofJourneys);

    QSqlQuery queryT(totalizerDb);
    QString insertQuery = R"(
        INSERT INTO accumulated_data (totalDistance,totalDistanceHired,totalfare, numberofJourneys)
        VALUES (:totalDistance,:totalDistanceHired,:totalfare, :numberofJourneys);
    )";



    queryT.prepare(insertQuery);
    queryT.bindValue(":totalDistance", QString::number(totalDistance) ); // save in meter
    queryT.bindValue(":totalDistanceHired", QString::number(totalDistanceHired) ); // save in meter
    queryT.bindValue(":totalfare", totalfare);
    queryT.bindValue(":numberofJourneys", numberAsString);  // Proper binding as string


    if (!queryT.exec()) {
        qDebug() << "Failed to insert data:" << queryT.lastError().text();
    } else {
        qDebug() << "Data saved:" << numberofJourneys;
    }

    // Example: Accumulate the value (can be any logic)
//    numberofJourneys += 1.0;  // Example: increment by 1
}







void loadLastTotalizerData() {
    // Retrieve the last value stored in the database

    // Make sure that the database is open before running the query
    if (!totalizerDb.isOpen()) {
        qDebug() << "Database is not open!  196 ";
        return;
    }

    // Retrieve the last value stored in the database
    QSqlQuery queryT(totalizerDb);

//    queryT.prepare("SELECT totalDistance,totalDistanceHired,totalfare,numberofJourneys FROM accumulated_data ORDER BY timestamp DESC LIMIT 1");

    if (queryT.exec("SELECT totalDistance, totalDistanceHired, totalfare, numberofJourneys FROM accumulated_data ORDER BY id DESC LIMIT 1")) {
        if (queryT.next()) {
            stored_totalDistance = queryT.value(0).toDouble();  // Convert the value back to double
            qDebug() << "Last accumulated totalDistance loaded:" << totalDistance;
            totalDistanceHired = queryT.value(1).toDouble();  // Convert the value back to double
            qDebug() << "Last accumulated totalDistanceHired loaded:" << totalDistanceHired;
            totalfare = queryT.value(2).toDouble();  // Convert the value back to double
            qDebug() << "Last accumulated totalfare loaded:" << totalfare;
            numberofJourneys = queryT.value(3).toDouble();  // Convert the value back to double
            qDebug() << "Last accumulated numberofJourneys loaded:" << numberofJourneys;
        } else {
            qDebug() << "No previous data found, starting fresh.";
            numberofJourneys = 0.0;  // Initialize with zero if no data found
        }
    } else {
        qDebug() << "Failed to execute query:" << queryT.lastError().text();
    }


}










void initializeTotalizerDb() {
    // Initialize SQLite database
    totalizerDb = QSqlDatabase::addDatabase("QSQLITE","totalizerDB1Connection"); // more than db >> name connection
    totalizerDb.setDatabaseName("totalizerDb.db");
    if (!totalizerDb.open()) {
        qDebug() << "240 - Database connection failed:" << totalizerDb.lastError().text();
        return;
    }
    QSqlQuery queryT(totalizerDb);
    QString createTable = R"(
        CREATE TABLE IF NOT EXISTS accumulated_data (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            totalDistance TEXT NOT NULL,
            totalDistanceHired TEXT NOT NULL,
            totalfare TEXT NOT NULL,
            numberofJourneys TEXT NOT NULL

        );
    )";

    if (!queryT.exec(createTable)) {
        qDebug() << "256 - Failed to create table:" << queryT.lastError().text();
    }

    // Load the last accumulated value if any
    loadLastTotalizerData();
}



void initializeTotalizerDbLoop() {
    // Initialize database and setup the timer
    initializeTotalizerDb();

    // Set up a timer to save data every minute
    totalizerDbtimer = new QTimer;
    QObject::connect(totalizerDbtimer, &QTimer::timeout, [&]() {
        saveTotalizerData();  // Call saveTotalizerData() every minute
    });

    totalizerDbtimer->start(60000); // 1 minute interval (60000 ms)
}












