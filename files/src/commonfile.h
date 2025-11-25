#ifndef COMMONFILE_H
#define COMMONFILE_H

#include <string>
#include <iostream>
#include <QString>
#include <QTime>

extern float    config_money_Extras;
extern QString    config_money_initHireFee;
extern QString    config_tariffPerHour;
extern QString    config_tariffPerDistance;
extern float    config_fareIncrement;
extern QString  config_currencyUnit;
extern float    config_MoneyChargedSupplements;
extern float    config_MoneyChargedFare;
extern QString      config_initTime;
extern QString  config_nightStartTime;
extern QString  config_nightEndTime;
extern int      config_powerOffDelay;
extern QString      config_InitialDistance;
extern QString  config_distance_distanceUnit;
extern QString config_DatabaseOverwriteFlag;
extern QString      config_Kconstant;
extern QString      config_control_fareCalculationMethod;
extern QString  config_farecountmode;
extern  QDateTime currentDateTime;
extern  QDateTime journystartDateTime;
//extern bool uiAuditTrailsOpenned;
extern QString databaseContentBuf;
extern QDateTime config_SetNewTime;
extern bool hireState;





extern QString config_initialHireFee_night;
extern QString config_tariffPerK_night;
extern QString config_tariffPerH_night;
extern QString config_initialDistance_night;
extern QString config_initialTime_night;

extern QString newFare;


extern long int numberofJourneys;
extern double totalDistance;
extern double totalDistanceHired;
extern QString totalfare;


//extern double last_totalDistanceHired;
extern double stored_totalDistance;
extern bool hireDoneFlage;
extern long long int durationINT ;


#include <hiredis/hiredis.h>

extern redisContext* redis;


extern void keyboardEvent();
#endif // COMMONFILE_H
