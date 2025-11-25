#include <QApplication>
#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QtQml/qqmlextensionplugin.h>
#include <QQmlContext>
#include <QQuickItem>
#include <QDebug>
#include "qqmlextensionplugin.h"
#include <QPushButton>
#include <QWidget>
#include <QTimer>


#ifdef BULD_QDS_COMPONENTS
// Q_IMPORT_QML_PLUGIN(QtQuick_Studio_ComponentsPlugin)
// Q_IMPORT_QML_PLUGIN(QtQuick_Studio_EffectsPlugin)
// Q_IMPORT_QML_PLUGIN(QtQuick_Studio_ApplicationPlugin)
// Q_IMPORT_QML_PLUGIN(FlowViewPlugin)
// Q_IMPORT_QML_PLUGIN(QtQuick_Studio_LogicHelperPlugin)
// Q_IMPORT_QML_PLUGIN(QtQuick_Studio_MultiTextPlugin)
// Q_IMPORT_QML_PLUGIN(QtQuick_Studio_EventSimulatorPlugin)
// Q_IMPORT_QML_PLUGIN(QtQuick_Studio_EventSystemPlugin)
#endif


#include <QGuiApplication>
#include <QEvent>
#include <QMouseEvent>
#include <QKeyEvent>
#include "back.h"


#include <hiredis/hiredis.h>
#include <QCoreApplication>


//#include <QtSql/QSqlDatabase>
//#include <QtSql/QSqlQuery>

#include "taximeterconfig.h"
#include "commonfile.h"



void set_qt_environment()
{
//    qputenv("QT_IM_MODULE", "qtvirtualkeyboard");//qtvirtualkeyboard
    qputenv("QT_VIRTUALKEYBOARD_DESKTOP_DISABLE", "1");
    qputenv("QT_AUTO_SCREEN_SCALE_FACTOR", "1");
    qputenv("QT_ENABLE_HIGHDPI_SCALING", "0");
    qputenv("QT_LOGGING_RULES", "qt.qml.connections=false");
    qputenv("QT_QUICK_CONTROLS_CONF", ":/qtquickcontrols2.conf");
    qputenv("QML_COMPAT_RESOLVE_URLS_ON_ASSIGNMENT", "1");
}
void sendnewvalue(redisContext* Redis);
long int countVal=0;
void slot1();
int main(int argc, char *argv[])
{
//    Back *back = new Back;
    QGuiApplication app(argc, argv);
    QQmlApplicationEngine engine;
     loadConfigFromJson() ;
    const QUrl url(QStringLiteral("qrc:/content/App.qml"));
    QObject::connect(
                &engine,
                &QQmlApplicationEngine::objectCreated,
                &app,
        [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
            }       ,
                Qt::QueuedConnection);
    engine.addImportPath(QCoreApplication::applicationDirPath() + "/qml");
    engine.addImportPath(":/");
    engine.addImportPath(QStringLiteral("qrc:/imports"));
    engine.addImportPath(QStringLiteral("qrc:/asset_imports"));
    engine.addImportPath(QStringLiteral("qrc:/content"));
    engine.rootContext()->setContextProperty("appUi",appUi);
    engine.addImportPath("~/Qt/5.15.2/gcc_64/qml");
    engine.load(url);



     QTimer *timer = new QTimer;   // != null   error , must give value of new QTimer
//     QObject::connect(timer, &QTimer::timeout, []() {
//         qDebug() << "Timer timeout using lambda!";
//     });



      redis = redisConnect("127.0.0.1", 6379);
        if (redis == nullptr || redis->err) {
            qDebug() << "Redis connection failed: " << (redis ? redis->errstr : "Unknown error") ;// << std::endl;
            return 1;
        }
        qDebug() << "Connected to Redis!" ;//<< std::endl;



//        redisReply *reply = static_cast<redisReply *>(redisCommand(redis, "GET Kconstant", "Kconstant"));
//    QString value = "N/A";
//    if (reply != nullptr && reply->type == REDIS_REPLY_STRING) {
//    value = QString::fromUtf8(reply->str);
//    qDebug()<<"getRedisValue   "<<value<<  "  key"<< "Kconstant";
//    }
//    freeReplyObject(reply);




//         QObject::connect(timer, &QTimer::timeout, &sendnewvalue);

         QObject::connect(timer, &QTimer::timeout, [&]() {
             sendnewvalue(redis);
         });

     timer->start(50);

    if (engine.rootObjects().isEmpty()) {
        return -1;
    }
    return app.exec();
}















//#include <QCoreApplication>
//#include <QString>
//#include <hiredis/hiredis.h>
#include <iostream>




// Helper function to fetch value from Redis
QString getRedisValue(redisContext* Redis, const QString& key) {
//    qDebug()<<"getRedisValue";
//    redisReply* reply = (redisReply*)redisCommand(redis, "GET %s", key.toUtf8().constData());



            redisReply *reply = static_cast<redisReply *>(redisCommand(redis, "GET %s", key.toUtf8().constData()));
    QString value = "N/A";
    if (reply != nullptr && reply->type == REDIS_REPLY_STRING) {
        value = QString::fromUtf8(reply->str);
//        qDebug()<<"getRedisValue   "<<value<<  "  key"<< key;
    }
    freeReplyObject(reply);

    return value;
}



#include <QTime>
#include "taxiemeterlogs.h"

#include <QJsonDocument>
#include <QJsonObject>



QDateTime durationTRip;


QJsonValue get_Data_from_Json(const QJsonObject& _obj, const char* objectName) {
    if (!_obj.contains(objectName)) {
        qWarning() << "Key not found in JSON:" << objectName;
        return "N/A";
    }

    QJsonValue val = _obj[objectName];
//    if (!val.isString()) {
//        qWarning() << "Key exists but is not a string:" << objectName << ", actual type:" << val.type();
////        return "N/A";
//    }

    return val;//.toString();
}


void sendnewvalue(redisContext* redis) {



//display live data (from redis)
//    appUi->system_crossoverspeed(getRedisValue(redis, "crossoverspeed"));//xxxxxxxxxxxx .h
//    appUi->system_carSpeed(getRedisValue(redis, "carSpeed"));//xxxxxxxxxxxxxx .h

QString redis_data = getRedisValue(redis, "usb_data");

QJsonParseError parseError;
    QJsonDocument jsonDoc = QJsonDocument::fromJson(redis_data.toUtf8(), &parseError);

    if (parseError.error != QJsonParseError::NoError || !jsonDoc.isObject()) {
        qWarning() << "Failed to parse JSON from usb_data:" << parseError.errorString();
        return;
    }

    QJsonObject obj = jsonDoc.object();



//      qDebug()<<"duration "<<durationINT <<  "   " << durationTRip.toString("hh:mm:ss");
if(hireDoneFlage==true){
    hireDoneFlage = false;
        totalDistanceHired = totalDistanceHired + get_Data_from_Json(obj, "tripDistance").toDouble();
        saveTotalizerData();
    }

 currentDateTime = QDateTime::fromString(get_Data_from_Json(obj, "rtc_date").toString() + " "+get_Data_from_Json(obj, "rtc_time").toString(),"yyyy-MM-dd hh:mm:ss ap");//  currentDateTime();
    appUi->system_applicationTIME(  currentDateTime.toString("yyyy-MM-dd hh:mm:ss")  );//rtc_time

    //getRedisValue(redis, "applicationTIME")


//if(uiAuditTrailsOpenned==true){
//    uiAuditTrailsOpenned=false;

//}


    if(hireState==true){

        newFare = get_Data_from_Json(obj, "fare").toString(); // <<<<<
        appUi->system_fareCounter( newFare); //  current journy fare


        // to be tested
//        totalDistanceHired = totalDistanceHired + (getRedisValue(redis, "tripDistance").toDouble()-last_totalDistanceHired);
//        last_totalDistanceHired = totalDistanceHired;


QString tripDistanceHolder = get_Data_from_Json(obj, "trip_distance").toString();
        appUi->system_tripDistance(tripDistanceHolder);
        //==================



//        appUi->system_journyEndTime(getRedisValue(redis, "journyEndTime"));
//        appUi->system_journystartTime(getRedisValue(redis, "journystartTime"));
//        appUi->system_totalFare(get_Data_from_Json(obj, "fare").toString());//<<<<
//        appUi->system_journystartDateTime(journystartDateTime.toString("hh:mm:ss"));

        durationINT = get_Data_from_Json(obj, "trip_time").toDouble();// currentDateTime.toMSecsSinceEpoch() -journystartDateTime.toMSecsSinceEpoch();

//       durationTRip = QDateTime::fromMSecsSinceEpoch(durationINT);




    }else{
//        last_totalDistanceHired = 0;// totalDistanceHired + getRedisValue(redis, "tripDistance");
    }


//    QStringList logmsgArray={currentDateTime.toString("yyyy-MM-dd  hh:mm:ss"),"val2"};
//    appUi->system_LogRowMsg(logmsgArray);


    // to be tested

//    totalDistance=stored_totalDistance+(get_Data_from_Json(obj, "totalDistanceTraveledbyTheTaxi").toDouble()); // <<<,,


    appUi->system_taximeterLocalTime(get_Data_from_Json(obj, "taximeterLocalTime").toString());

//    appUi->system_odometerTotal(getRedisValue(redis, "odometerTotal"));

//    appUi->system_powerOffCountup(getRedisValue(redis, "powerOffCountup"));
    QString hireFlage ="";
   if(get_Data_from_Json(obj, "trip_status").toString()=="Stopped"){
       hireFlage = "0";
   }else if(get_Data_from_Json(obj, "trip_status").toString()==""){
       hireFlage = "";
   }

    appUi->system_hireState(hireFlage);

//    appUi->system_warningMsg(get_Data_from_Json(obj, "powerOffCountup").toString());  <<<




    appUi->system_totalDistanceTraveledWhenHired(QString::number(totalDistanceHired/1000.0, 'f', 3) );

    appUi->system_totalDistanceTraveledbyTheTaxi(QString::number(totalDistance/1000.0, 'f', 3));

    appUi->system_NumberofJourneys(QString::number(numberofJourneys));//getRedisValue(redis, "NumberofJourneys")

//    appUi->system_TotalIdleDistance(getRedisValue(redis, "TotalIdleDistance")); // remove from header and ui  xxxxxxxxx

config_nightStartTime = get_Data_from_Json(obj, "start_night_time").toString();
config_nightEndTime = get_Data_from_Json(obj, "end_night_time").toString();
config_tariffPerK_night = get_Data_from_Json(obj, "night_tariff_per_km").toString();
config_tariffPerH_night = get_Data_from_Json(obj, "night_tariff_per_hour").toString();
config_initialTime_night = QString::number(get_Data_from_Json(obj, "night_initial_time").toInt(), 'f', 3);
config_initialDistance_night = get_Data_from_Json(obj, "night_initial_distance").toString();
config_initialHireFee_night = get_Data_from_Json(obj, "night_initial_fee").toString();


config_initTime = QString::number(get_Data_from_Json(obj, "day_initial_time").toInt(), 'f', 3);
config_InitialDistance = get_Data_from_Json(obj, "day_initial_distance").toString();
config_money_initHireFee = get_Data_from_Json(obj, "day_initial_fee").toString();
config_tariffPerHour = get_Data_from_Json(obj, "day_tariff_per_hour").toString();
config_tariffPerDistance = get_Data_from_Json(obj, "day_tariff_per_km").toString();



totalfare = get_Data_from_Json(obj, "fare").toString();

if(get_Data_from_Json(obj, "mode").toString()=="Single"){
   config_farecountmode = "SINGLE";
}else if(get_Data_from_Json(obj, "mode").toString()=="Double"){
   config_farecountmode = "DOUBLE";
}
appUi->system_farecountmode(config_farecountmode);

config_Kconstant  = QString::number(get_Data_from_Json(obj, "k_constant").toInt(), 'f', 3);






//display configuraion (from json)

//    appUi->system_fareCalculationMethod(config_control_fareCalculationMethod);
    appUi->system_currencyUnit(config_currencyUnit);
    appUi->system_nightStartTime(QDateTime::fromString(config_nightStartTime, "hh:mm:ss ap").toString("yyyy-MM-dd hh:mm:ss"));//config_nightStartTime//currentDateTime.toString("yyyy-MM-dd hh:mm:ss")
    appUi->system_nightEndTime(QDateTime::fromString(config_nightEndTime, "hh:mm:ss ap").toString("yyyy-MM-dd hh:mm:ss"));//config_nightEndTime

    appUi->system_distanceUnit("km");//config_distance_distanceUnit

    appUi->system_DatabaseOverwriteFlag(config_DatabaseOverwriteFlag);

    // nonQString values
    char charValues[30] = "";
//    sprintf(charValues, "%d", config_Kconstant);
    appUi->system_Kconstant(config_Kconstant);
//    memset(charValues, 0, sizeof(charValues));


    // if configuration button clicked
//    sprintf(charValues, "%.02f", config_money_initHireFee);
    appUi->system_initHireFee(config_money_initHireFee);
//    memset(charValues, 0, sizeof(charValues));

//    sprintf(charValues, "%d", config_powerOffDelay);
//    appUi->system_powerOffDelay(charValues);
//    memset(charValues, 0, sizeof(charValues));

//    sprintf(charValues, "%.02f", config_money_Extras);
//    appUi->system_Extras(charValues);
//    memset(charValues, 0, sizeof(charValues));

//    sprintf(charValues, "%d", config_initTime);
    appUi->system_initTime(config_initTime);
//    memset(charValues, 0, sizeof(charValues));

//    sprintf(charValues, "%.02f", config_tariffPerHour);
    appUi->system_tariffPerHour(config_tariffPerHour);
//    memset(charValues, 0, sizeof(charValues));

//    sprintf(charValues, "%.02f", config_tariffPerDistance);
    appUi->system_tariffPerDistance(config_tariffPerDistance);
//    memset(charValues, 0, sizeof(charValues));

//    sprintf(charValues, "%.02f", config_fareIncrement);
//    appUi->system_fareIncrement(charValues);
//    memset(charValues, 0, sizeof(charValues));

//    sprintf(charValues, "%.03f", config_InitialDistance*1000.0);
    appUi->system_InitialDistance(config_InitialDistance);
//    memset(charValues, 0, sizeof(charValues));

//    sprintf(charValues, "%.02f", config_MoneyChargedSupplements);
//    appUi->system_MoneyChargedSupplements(charValues);
//    memset(charValues, 0, sizeof(charValues));

//    sprintf(charValues, "%.02f", totalfare);
    appUi->system_MoneyChargedFare(totalfare);
//    memset(charValues, 0, sizeof(charValues));




//    sprintf(charValues, "%.02f", config_initialHireFee_night);
    appUi->system_initialhirefee_nigh(config_initialHireFee_night);
//    memset(charValues, 0, sizeof(charValues));


//    sprintf(charValues, "%d", config_initialTime_night);
    appUi->system_initialTime_night(config_initialTime_night);
//    memset(charValues, 0, sizeof(charValues));


//    sprintf(charValues, "%.02f", config_tariffPerK_night);
    appUi->system_tariffPerK_night(config_tariffPerK_night);
//    memset(charValues, 0, sizeof(charValues));


//    sprintf(charValues, "%.02f",config_tariffPerH_night);
    appUi->system_tariffPerH_night(config_tariffPerH_night);
//    memset(charValues, 0, sizeof(charValues));


//    sprintf(charValues, "%.03f",config_initialDistance_night*1000.0);
    appUi->system_initialDistance_night(config_initialDistance_night);
//    memset(charValues, 0, sizeof(charValues));




    sprintf(charValues, "%02d:%02d:%02d",(int)(durationINT/ 3600),(int)((durationINT % 3600) / 60), (int)(durationINT % 60));
    appUi->system_tripTime(QString(charValues));
    memset(charValues, 0, sizeof(charValues));






    if(saveNewConfigurationFlage==true){
    saveConfigToJson(saveNewConfigurationFlage);
    saveNewConfigurationFlage = false;
    }


}


void slot1(){
//    [=](bool checked) {
//                if (checked) {
//                    qDebug() << "Button was checked, switching to the 'clicked' state.";
//                } else {
//                    qDebug() << "Button was unchecked.";
//                }
//            }
}









