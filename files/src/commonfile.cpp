
#include <QString>
#include <QTime>

float    config_money_Extras;// xxx
QString    config_money_initHireFee;
QString    config_tariffPerHour;
QString    config_tariffPerDistance;
float    config_fareIncrement;
QString  config_currencyUnit="USD";
float    config_MoneyChargedSupplements;
float    config_MoneyChargedFare;
QString      config_initTime;
QString  config_nightStartTime;
QString  config_nightEndTime;
int      config_powerOffDelay;
QString      config_InitialDistance;
QString  config_distance_distanceUnit="Km";
QString      config_Kconstant;
QString      config_control_fareCalculationMethod;
QString  config_farecountmode="Single";
//  bool flag   // newDatabaseOverwriteFlagBuf
QString config_DatabaseOverwriteFlag = "NO";
 QDateTime currentDateTime;
QDateTime journystartDateTime;
//bool uiAuditTrailsOpenned=false;
QString databaseContentBuf;
bool hireState=false;
QDateTime config_SetNewTime= QDateTime::currentDateTime();



QString config_initialHireFee_night;
QString config_tariffPerK_night;
QString config_tariffPerH_night;
QString config_initialDistance_night;
QString   config_initialTime_night;

QString newFare;

long int numberofJourneys;
double totalDistance;
double totalDistanceHired;
QString totalfare;
bool hireDoneFlage=false;
//double last_totalDistanceHired;
 double stored_totalDistance;

 long long int durationINT ;


#include <hiredis/hiredis.h>
redisContext* redis = nullptr;


//==========================  xxxxxx =========================================
#include <unistd.h>
#include <fcntl.h>
#include <linux/uinput.h>

void keyboardEvent(){
    int uinputFd = open("/dev/uinput", O_WRONLY | O_NONBLOCK);
    if (uinputFd == -1) {
        printf( "Error opening uinput device" );
//        return ;
    }

//    printf( "Error opening uinput device" );

    ioctl(uinputFd, UI_SET_EVBIT, EV_KEY);       // Set event type to key events
    ioctl(uinputFd, UI_SET_KEYBIT, KEY_A);       // Set key press for 'A'
    ioctl(uinputFd, UI_DEV_CREATE);              // Create virtual device

    struct input_event ev;
    ev.type = EV_KEY;
    ev.code = KEY_A;
    ev.value = 1;  // Key press
    gettimeofday(&ev.time, NULL);
    write(uinputFd, &ev, sizeof(struct input_event)); // Simulate key press

    ev.value = 0;  // Key release
    write(uinputFd, &ev, sizeof(struct input_event)); // Simulate key release

    ioctl(uinputFd, UI_DEV_DESTROY);  // Destroy virtual device
    close(uinputFd);                  // Close uinput device



}
