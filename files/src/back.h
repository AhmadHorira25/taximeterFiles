#ifndef BACK_H
#define BACK_H

#include <QObject>
#include <QString>

class AppUi : public QObject{
    Q_OBJECT
public :
     explicit AppUi(QObject *parent = nullptr);
signals:


    void valueChanged                           (QString s);
    void system_Kconstant                       (QString Kconst);
    void system_fareCalculationMethod           (QString fareCalculationMethodValue);
    void system_crossoverspeed                  (QString crossoverspeedValue);
    void system_carSpeed                        (QString carSpeedValue);
    void system_tripTime                        (QString tripTimeValue);
    void system_applicationTIME                 (QString applicationTIMEValue);
    void system_taximeterLocalTime              (QString taximeterLocalTimeValue);
    void system_fareCounter                     (QString fareCounterValue);
    void system_currencyUnit                    (QString currencyUnitvalue);
    void system_odometerTotal                   (QString odometerTotaldistance);
    void system_nightStartTime                  (QString nightStartTimeValue);
    void system_nightEndTime                    (QString nightEndTimeValue);

    void system_tripDistance                    (QString tripDistanceValue);
    void system_powerOffDelay                   (QString powerOffDelayValue);
    void system_powerOffCountup                 (QString powerOffCountupValue);
    void system_hireState                       (QString hireStateVAlue); // if 1 start running, if 0 stop state (hire state feed back)


    void system_Extras                          (QString extrasValue);
//    void system_journyEndTime                   (QString journyEndTimeValue);
//    void system_journystartTime                 (QString journystartTimeValue);
    void system_totalFare                       (QString totalFareValue);
    void system_initHireFee                     (QString initHireFeeValue);
    void system_initTime                        (QString initTimeValue);
    void system_tariffPerHour                   (QString tariffPerHourValue);
    void system_tariffPerDistance               (QString tariffPerDistanceValue);
    void system_fareIncrement                   (QString fareIncrementValue);
    void system_InitialDistance                 (QString InitialDistanceValue);
    void system_totalDistanceTraveledWhenHired  (QString totalDistanceTraveledWhenHiredValue);
    void system_totalDistanceTraveledbyTheTaxi  (QString totalDistanceTraveledbyTheTaxiValue);
    void system_MoneyChargedSupplements         (QString MoneyChargedSupplementsValue);
    void system_MoneyChargedFare                (QString MoneyChargedFareValue);
//    void system_totalDistanceTraveledWhenHired  (QString totalDistanceTraveledWhenHiredValue);
    void system_NumberofJourneys                (QString NumberofJourneysValue);
    void system_TotalIdleDistance               (QString TotalIdleDistanceValue);
//    void system_NumberofJourneys                (QString NumberofJourneysValue);
    void system_distanceUnit                    (QString system_distanceUnitValue);

    void system_farecountmode                    (QString system_farecountmodeValue);
    void system_DatabaseOverwriteFlag            (QString DatabaseOverwriteFlagValue);
//    void system_journystartDateTime           (QString journystartDateTimeValue);
    void system_warningMsg                       (QString warningMsg);

    void system_LogRowMsg                       (QStringList logMsgArray);

//        void system_journyDuration           (QString journyDurationValue);



//    void system_PowerOffDelay            (QString powerOffDelayValue);

   void system_initialhirefee_nigh(QString initialhirefee_nightValue);
   void system_initialTime_night(QString initialTime_nightValue);
   void system_tariffPerK_night(QString tariffPerK_nightValue);
   void system_tariffPerH_night(QString tariffPerH_nightValue);
   void system_initialDistance_night(QString initialDistance_nightValue);




public slots:
     void  changeValue(QString a);
     void uiSetNewKconstant(QString a);
     void uiSetNewcurrency(QString Newcurrency);

     void uiSetNewDistanceUnit(QString uiSetNewDistanceUnitBuf);
     void uiSetNewDatabaseOverwriteFlag(QString newDatabaseOverwriteFlagBuf);
//     void uiSetNewCalculationMethod(QString newCalculationMethodBuf);
     void uiSetNewApplicationTIMEyear (QString newApplicationTIMEBuf);
     void uiSetNewPowerOffDelay(QString newPowerOffDelayBuf);


     void uiSetNewApplicationTIMEmon(QString newApplicationTIMEmonBuf );
     void uiSetNewApplicationTIMEday(QString newApplicationTIMEdayBuf );
     void uiSetNewApplicationTIMEhour(QString newApplicationTIMEhourBuf);
     void uiSetNewApplicationTIMEmin(QString newApplicationTIMEminBuf );
     void uiSetNewApplicationTIMEsec(QString newApplicationTIMEsecBuf );



     void uiSetNewInitialTime(QString newInitialTimeBuf );
     void uiSetNewInitialhirefee(QString newInitialhirefeeBuf );
     void uiSetNewTariffPerK(QString newTariffPerKBuf );
     void uiSetNewTariffPer(QString newTariffPerHBuf );
     void uiSetNewInitialDistance(QString newInitialDistanceBuf );
     void uiSetNewFareIncrement(QString newFareIncrementBuf );
     void uiSetNewFarecountmode(QString uiSetNewFarecountmodeBuf);
     void uiSetNewMoneyExtras(QString uiSetNewMoneyExtrasBuf);

     void  uiHireState(QString uiHireStateBuf );

     void  uiAuditTrailsWindow(QString uiAuditTrailsWindowBuf );



     void uiSetNewInitialTimeNight(QString newinitialTime_night);
     void uiSetNewInitialhirefeeNight(QString newinitialhirefee_night);
     void uiSetNewTariffPerKNight(QString newtariffPerK_night);
     void uiSetNewTariffPerNight(QString newtariffPerH_night);
     void uiSetNewInitialDistanceNight(QString newinitialDistance_night);

     void uiGetDatabaseByDate(QStringList timeLimitsArray);
     void uiconfigNightStartEndTime(QStringList dntimeArray);


};
extern AppUi *appUi ;//= new AppUi;
extern bool saveNewConfigurationFlage;
#endif // BACK_H
