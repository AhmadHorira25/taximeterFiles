#include "back.h"
#include <QDebug>
#include <QString>
#include "commonfile.h"
#include <QTime>
#include <QDateTime>

bool saveNewConfigurationFlage=false;






#include <hiredis/hiredis.h>


// Helper function to set a value in Redis
bool setRedisValue(redisContext* redis, const QString& key, const QString& value) {
    if (!redis || key.isEmpty())
        return false;

    redisReply* reply = static_cast<redisReply*>(
        redisCommand(redis, "SET %s %s", key.toUtf8().constData(), value.toUtf8().constData())
    );

    bool success = false;
    if (reply != nullptr && reply->type == REDIS_REPLY_STATUS && QString(reply->str) == "OK") {
        success = true;
//        qDebug() << "setRedisValue: OK  key=" << key << " value=" << value;
    }

    freeReplyObject(reply);
    return success;
}






AppUi::AppUi(QObject *parent):QObject(parent){

}
AppUi *appUi = new AppUi;
void AppUi::changeValue(QString a){
//    //qDebug()<<"a = "<<a<<"from ui ";
    valueChanged(a + " from c++");
//    systemKconstant(a);
saveNewConfigurationFlage = true;
}

void AppUi::uiSetNewKconstant(QString Kconst){
//    //qDebug()<<"uiNewKconstant = "<<Kconst<<"from ui ";
//    config_Kconstant = Kconst;
//    systemKconstant(a + " from c++");
    databaseContentBuf =databaseContentBuf+ "| Kconstant: "+Kconst;
saveNewConfigurationFlage = true;
}

void AppUi::uiSetNewcurrency(QString Newcurrency){
//    //qDebug()<<"uiSetNewcurrency = "<<Newcurrency<<"from ui ";
//    systemKconstant(a + " from c++");
      config_currencyUnit = Newcurrency;
       databaseContentBuf =databaseContentBuf+ "| currency: "+Newcurrency;
saveNewConfigurationFlage = true;
}



//void AppUi::uiSetNewCalculationMethod(QString newCalculationMethodBuf){
//    //qDebug()<<"uiSetNewCalculationMethod = "<<newCalculationMethodBuf<<"from ui ";
////    systemKconstant(a + " from c++");
//config_control_fareCalculationMethod = newCalculationMethodBuf;

//saveNewConfigurationFlage = true;
//}

void AppUi::uiSetNewDatabaseOverwriteFlag(QString newDatabaseOverwriteFlagBuf){
    //qDebug()<<"uiSetNewDatabaseOverwriteFlag = "<<newDatabaseOverwriteFlagBuf<<"from ui ";
//    systemKconstant(a + " from c++");
    config_DatabaseOverwriteFlag = newDatabaseOverwriteFlagBuf;
// newDatabaseOverwriteFlagBuf;config_farecountmode
 databaseContentBuf =databaseContentBuf+ "| DatabaseOverwriteFlag: "+newDatabaseOverwriteFlagBuf;
saveNewConfigurationFlage = true;
}

void AppUi::uiSetNewDistanceUnit(QString uiSetNewDistanceUnitBuf){
    //qDebug()<<"uiSetNewDistanceUnit = "<<uiSetNewDistanceUnitBuf<<"from ui ";
//    systemKconstant(a + " from c++");
config_distance_distanceUnit = uiSetNewDistanceUnitBuf;
 databaseContentBuf =databaseContentBuf+ "| DistanceUnit: "+uiSetNewDistanceUnitBuf;
saveNewConfigurationFlage = true;
}


void AppUi::uiSetNewFarecountmode(QString uiSetNewFarecountmodeBuf){
    //qDebug()<<"uiSetNewFarecountmode = "<<uiSetNewFarecountmodeBuf<<"from ui ";
//    systemKconstant(a + " from c++");
config_farecountmode = uiSetNewFarecountmodeBuf;
 databaseContentBuf =databaseContentBuf+ "| Farecountmode: "+uiSetNewFarecountmodeBuf;
saveNewConfigurationFlage = true;
}



void AppUi::uiSetNewPowerOffDelay(QString newPowerOffDelayBuf){
    //qDebug()<<"uiSetNewPowerOffDelay = "<<newPowerOffDelayBuf<<"from ui ";
//    systemKconstant(a + " from c++");
config_powerOffDelay = newPowerOffDelayBuf.toInt();
 databaseContentBuf =databaseContentBuf+ "| PowerOffDelay: "+newPowerOffDelayBuf;
saveNewConfigurationFlage = true;
}

void AppUi::uiSetNewApplicationTIMEyear (QString newApplicationTIMEBufyear){
    //qDebug()<<"uiSetNewApplicationTIMEyear = "<<newApplicationTIMEBufyear<<"from ui ";
//    systemKconstant(a + " from c++");
// databaseContentBuf =databaseContentBuf+
saveNewConfigurationFlage = true;
}

void AppUi::uiSetNewApplicationTIMEmon(QString newApplicationTIMEmonBuf ){
    //qDebug()<<"newApplicationTIMEmonBuf = "<<newApplicationTIMEmonBuf<<"from ui ";
//    systemKconstant(a + " from c++");
//     databaseContentBuf =databaseContentBuf+
saveNewConfigurationFlage = true;
}
void AppUi::uiSetNewApplicationTIMEday(QString newApplicationTIMEdayBuf ){
    //qDebug()<<"newApplicationTIMEdayBuf = "<<newApplicationTIMEdayBuf<<"from ui ";
//    systemKconstant(a + " from c++");
//     databaseContentBuf =databaseContentBuf+
saveNewConfigurationFlage = true;
}
void AppUi::uiSetNewApplicationTIMEhour(QString newApplicationTIMEhourBuf){// used for newApplicationTIME  for time
    qDebug()<<"newApplicationTIMEhourBuf : "<<newApplicationTIMEhourBuf<<"from ui ";
//    systemKconstant(a + " from c++");
//     databaseContentBuf =databaseContentBuf+
            config_SetNewTime.setTime(QTime(newApplicationTIMEhourBuf.toInt(),config_SetNewTime.time().minute(),config_SetNewTime.time().second()));
saveNewConfigurationFlage = true;
}
void AppUi::uiSetNewApplicationTIMEmin(QString newApplicationTIMEminBuf ){
    //qDebug()<<"newApplicationTIMEminBuf = "<<newApplicationTIMEminBuf<<"from ui ";

        config_SetNewTime.setTime(QTime(config_SetNewTime.time().hour(),newApplicationTIMEminBuf.toInt(),config_SetNewTime.time().second()));
saveNewConfigurationFlage = true;
}
void AppUi::uiSetNewApplicationTIMEsec(QString newApplicationTIMEsecBuf ){
    //qDebug()<<"newApplicationTIMEsecBuf = "<<newApplicationTIMEsecBuf<<"from ui ";



    config_SetNewTime.setTime(QTime(config_SetNewTime.time().hour(),config_SetNewTime.time().minute(),newApplicationTIMEsecBuf.toInt()));
    //qDebug()<<"time tst = "<<config_SetNewTime.toString("hh:mm:ss");

  databaseContentBuf =databaseContentBuf+"|new Time:"+  config_SetNewTime.toString("hh:mm:ss");
saveNewConfigurationFlage = true;
}









void  AppUi::uiSetNewInitialTime(QString newInitialTimeBuf )
{
//qDebug()<<"newInitialTimeBuf = "<<newInitialTimeBuf<<"from ui ";
//    systemKconstant(a + " from c++");
// config_initTime = newInitialTimeBuf.toInt();
  databaseContentBuf =databaseContentBuf+ "| InitialTime: "+newInitialTimeBuf;
saveNewConfigurationFlage = true;
}

void  AppUi::uiSetNewInitialhirefee(QString newInitialhirefeeBuf )
{
//qDebug()<<"newInitialhirefeeBuf = "<<newInitialhirefeeBuf<<"from ui ";
//    systemKconstant(a + " from c++");
//   config_money_initHireFee= newInitialhirefeeBuf.toFloat();
    databaseContentBuf =databaseContentBuf+ "| Initialhirefee: "+newInitialhirefeeBuf;
saveNewConfigurationFlage = true;
}

void  AppUi::uiSetNewTariffPerK(QString newTariffPerKBuf )
{
//qDebug()<<"newTariffPerKBuf = "<<newTariffPerKBuf<<"from ui ";
//    systemKconstant(a + " from c++");
//   config_tariffPerDistance=newTariffPerKBuf.toFloat();
    databaseContentBuf =databaseContentBuf+ "| TariffPerK: "+newTariffPerKBuf;
saveNewConfigurationFlage = true;
}

void  AppUi::uiSetNewTariffPer(QString newTariffPerHBuf )
{
//qDebug()<<"newTariffPerHBuf = "<<newTariffPerHBuf<<"from ui ";
//    systemKconstant(a + " from c++");
//     config_tariffPerHour = newTariffPerHBuf.toFloat();
      databaseContentBuf =databaseContentBuf+ "| TariffPerH: "+newTariffPerHBuf;
saveNewConfigurationFlage = true;
}

void  AppUi::uiSetNewInitialDistance(QString newInitialDistanceBuf )
{
//qDebug()<<"newInitialDistanceBuf = "<<newInitialDistanceBuf<<"from ui ";
//    systemKconstant(a + " from c++");
//   config_InitialDistance = newInitialDistanceBuf.toFloat()/1000.0;//ui set per m, device by km
    databaseContentBuf =databaseContentBuf+ "| InitialDistance: "+newInitialDistanceBuf;
saveNewConfigurationFlage = true;
}

void  AppUi::uiSetNewFareIncrement(QString newFareIncrementBuf )
{
////qDebug()<<"newFareIncrementBuf = "<<newFareIncrementBuf<<"from ui ";
//    systemKconstant(a + " from c++");
//config_fareIncrement = newFareIncrementBuf.toFloat();
// databaseContentBuf =databaseContentBuf+ "| FareIncrement: "+newFareIncrementBuf;
//saveNewConfigurationFlage = true;
}






void  AppUi::uiSetNewMoneyExtras(QString uiSetNewMoneyExtrasBuf )
{
//qDebug()<<"uiSetNewMoneyExtras = "<<uiSetNewMoneyExtrasBuf<<"from ui "<<"old config_money_Extras = "<<config_money_Extras;
//    systemKconstant(a + " from c++");
//config_money_Extras = uiSetNewMoneyExtrasBuf.toFloat();
 databaseContentBuf =databaseContentBuf+ "| NewMoneyExtras: "+uiSetNewMoneyExtrasBuf;
saveNewConfigurationFlage = true;
}





void  AppUi::uiHireState(QString uiHireStateBuf )
{
//qDebug()<<"uiHireStateBuf = "<<uiHireStateBuf<<"from ui ";
//    systemKconstant(a + " from c++");
if(uiHireStateBuf=="HIRED"){
    journystartDateTime = QDateTime::currentDateTime();
    hireState = true;

setRedisValue( redis, "usb_command", "{\"command\": \"START\"}");
}else if(uiHireStateBuf=="STOPED"){
    hireState = false;
    numberofJourneys = numberofJourneys + 1;
    totalfare = totalfare + newFare;
    hireDoneFlage=true; // to save data
    setRedisValue( redis, "usb_command", "{\"command\": \"STOP\"}");
//        totalDistanceHired = totalDistanceHired + getRedisValue(redis, "tripDistance").toDouble();
        //bool save to db flage =true

}else if(uiHireStateBuf=="DONE"){
hireState = false;
//hireDoneFlage=true; // to save data
//numberofJourneys = numberofJourneys + 1;
//totalfare = totalfare + newFare;
}

//saveNewConfigurationFlage = true;
}


#include "taxiemeterlogs.h"
void  AppUi::uiAuditTrailsWindow(QString uiAuditTrailsWindowBuf )
{
//qDebug()<<"uiAuditTrailsWindowBuf = "<<uiAuditTrailsWindowBuf<<"from ui ";
//    systemKconstant(a + " from c++");
if(uiAuditTrailsWindowBuf=="opened"){


//    for (int rowNum = 0; rowNum < 200; rowNum++) {
//        QStringList logmsgArray={QDateTime::currentDateTime().toString("yyyy-MM-dd  hh:mm:ss"),databaseContentBuf};// QString::number(rowNum)
//       appUi->system_LogRowMsg(logmsgArray);
//    }
    fetchLast60();//appUi->system_LogRowMsg


//    databaseContentBuf="";
//uiAuditTrailsOpenned=true;
}


//else if(uiAuditTrailsWindowBuf=="closed"){
//    hireState = false;

//}
//saveNewConfigurationFlage = true;
}



void  AppUi::uiSetNewInitialTimeNight(QString newinitialTime_night )
{
//qDebug()<<"newinitialTime_night = "<<newinitialTime_night<<"from ui ";
//    systemKconstant(a + " from c++");
//config_initialTime_night = newinitialTime_night.toInt();
 databaseContentBuf =databaseContentBuf+ "| newinitialTime_night: "+newinitialTime_night;
saveNewConfigurationFlage = true;
}

void AppUi::uiSetNewInitialhirefeeNight(QString newinitialhirefee_night)
{
    //qDebug() << "newinitialhirefee_night = " << newinitialhirefee_night << "from ui ";
//    config_initialHireFee_night = newinitialhirefee_night.toFloat();
    databaseContentBuf = databaseContentBuf + "| newinitialhirefee_night: " + newinitialhirefee_night;
    saveNewConfigurationFlage = true;
}

void AppUi::uiSetNewTariffPerKNight(QString newtariffPerK_night)
{
    //qDebug() << "newtariffPerK_night = " << newtariffPerK_night << "from ui ";
//    config_tariffPerK_night = newtariffPerK_night.toFloat();
    databaseContentBuf = databaseContentBuf + "| newtariffPerK_night: " + newtariffPerK_night;
    saveNewConfigurationFlage = true;
}

void AppUi::uiSetNewTariffPerNight(QString newtariffPerH_night)
{
    //qDebug() << "newtariffPerH_night = " << newtariffPerH_night << "from ui ";
//    config_tariffPerH_night = newtariffPerH_night.toFloat();
    databaseContentBuf = databaseContentBuf + "| newtariffPerH_night: " + newtariffPerH_night;
    saveNewConfigurationFlage = true;
}

void AppUi::uiSetNewInitialDistanceNight(QString newinitialDistance_night)
{
    //qDebug() << "newinitialDistance_night = " << newinitialDistance_night << "from ui ";
//    config_initialDistance_night =newinitialDistance_night.toFloat()/1000.0;
    databaseContentBuf = databaseContentBuf + "| newinitialDistance_night: " + newinitialDistance_night;
    saveNewConfigurationFlage = true;
}


void AppUi::uiGetDatabaseByDate(QStringList timeLimitsArray){
    fetchRowsInRange(QDate::fromString(timeLimitsArray[1], "d/M/yyyy").toString("yyyy-MM-dd"),QDate::fromString(timeLimitsArray[0], "d/M/yyyy").toString("yyyy-MM-dd"));
}


void AppUi::uiconfigNightStartEndTime(QStringList dntimeArray){
//    qDebug() << "dntimeArray = " << dntimeArray << "from ui ";
    databaseContentBuf = databaseContentBuf + "| newNightStartTime: " + dntimeArray[0]+"| newNightEndTime:"+dntimeArray[1];
config_nightStartTime = dntimeArray[0];
config_nightEndTime   = dntimeArray[1];
//    QDateTime timeTransfere = QDateTime::fromString(dntimeArray[0]);
//    qDebug() <<"timeTransfere"<<timeTransfere;
    saveNewConfigurationFlage = true;
}





//appUi.uiSetNewInitialTimeNight(newinitialTime_night)
//appUi.uiSetNewInitialhirefeeNight(newinitialhirefee_night)
//appUi.uiSetNewTariffPerKNight(newtariffPerK_night)
//appUi.uiSetNewTariffPerNight(newtariffPerH_night)
//appUi.uiSetNewInitialDistanceNight(newinitialDistance_night)
//appUi.uiSetNewFareIncrementNight(newfareIncrement_night)
//appUi.uiSetNewMoneyExtrasNight(newExtraCharges_night)




//QTimer *timer;
//AppUi::MainUiLoop()
//{
//    connect(timer, &QTimer::timeout, this, &MainWindow::sendAndReceiveData);
//    timer->start(30);  // Set the timer interval to 1000 ms (1 second)
//}


