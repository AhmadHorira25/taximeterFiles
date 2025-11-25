#include <stdio.h>
#include <stdlib.h>
#include <cjson/cJSON.h>
#include "commonfile.h"
#include <QString>
#include <string>
#include <iostream>
#include <QDebug>
#include "taxiemeterlogs.h"

    const char *fileName = "taximeter.config";


void saveConfigToJson(bool saveFlag) {
    // Create a root JSON object
    if(saveFlag==true){
        saveFlag = false;

        qDebug()<<"databaseContentBuf:"<< databaseContentBuf;

        writeData("admin", databaseContentBuf);
        databaseContentBuf="";

    cJSON *root = cJSON_CreateObject();

    // Add money-related fields
//    cJSON_AddNumberToObject(root, "money_Extras", config_money_Extras);


//    cJSON_AddNumberToObject(root, "money_initHireFee", config_money_initHireFee);//<<<
//    cJSON_AddNumberToObject(root, "money_tariffPerHour", config_tariffPerHour);//<<<
//    cJSON_AddNumberToObject(root, "money_tariffPerDistance", config_tariffPerDistance);//<<<


    cJSON_AddNumberToObject(root, "money_fareIncrement", config_fareIncrement);
    cJSON_AddStringToObject(root, "money_currencyUnit", config_currencyUnit.toStdString().c_str());
//    cJSON_AddNumberToObject(root, "money_MoneyChargedSupplements", config_MoneyChargedSupplements);
//    cJSON_AddNumberToObject(root, "money_MoneyChargedFare", config_MoneyChargedFare);

    // Add time-related fields
//    cJSON_AddNumberToObject(root, "time_initTime", config_initTime);//<<<<



    cJSON_AddStringToObject(root, "time_nightStartTime", config_nightStartTime.toStdString().c_str());
    cJSON_AddStringToObject(root, "time_nightEndTime", config_nightEndTime.toStdString().c_str());
//    cJSON_AddNumberToObject(root, "time_powerOffDelay", config_powerOffDelay);

    // Add distance-related fields
//    cJSON_AddNumberToObject(root, "distance_InitialDistance", config_InitialDistance);//<<<
    cJSON_AddStringToObject(root, "distance_distanceUnit", config_distance_distanceUnit.toStdString().c_str());

    // Add Kconstant and control fields
//    cJSON_AddNumberToObject(root, "Kconstant", config_Kconstant);//<<<
//    cJSON_AddStringToObject(root, "control_fareCalculationMethod", config_control_fareCalculationMethod.toStdString().c_str());

    cJSON_AddStringToObject(root, "config_farecountmode", config_farecountmode.toStdString().c_str());

    cJSON_AddStringToObject(root, "DatabaseOverwriteFlag", config_DatabaseOverwriteFlag.toStdString().c_str());


//    cJSON_AddNumberToObject(root, "initialHireFee_night", config_initialHireFee_night);//<<<
//    cJSON_AddNumberToObject(root, "tariffPerK_night", config_tariffPerK_night);//<<<
//    cJSON_AddNumberToObject(root, "tariffPerH_night", config_tariffPerH_night);//<<<
//    cJSON_AddNumberToObject(root, "initialDistance_night", config_initialDistance_night);//<<<
//    cJSON_AddNumberToObject(root, "initialTime_night", config_initialTime_night);//<<<


//    cJSON_AddStringToObject(root, "DatabaseOverwriteFlag", config_DatabaseOverwriteFlag.toStdString().c_str());


    // Write the JSON object to a file
    FILE *fp = fopen(fileName, "w");
    if (fp == NULL) {
        fprintf(stderr, "Could not open file for writing\n");
        return;
    }
    char *jsonString = cJSON_Print(root);
    fprintf(fp, "%s\n", jsonString);
    fclose(fp);

    // Clean up
    free(jsonString);
    qDebug() <<"Configuration saved to"<< fileName;
    cJSON_Delete(root);
    }
}

void loadConfigFromJson() {
    // Read the JSON file into a string
    FILE *fp = fopen(fileName, "r");
    if (fp == NULL) {
        fprintf(stderr, "Could not open file for reading\n");
        return;
    }
    fseek(fp, 0, SEEK_END);
    long fileSize = ftell(fp);
    fseek(fp, 0, SEEK_SET);

    char *jsonData = (char *)malloc(fileSize + 1);
    fread(jsonData, 1, fileSize, fp);
    fclose(fp);
    jsonData[fileSize] = '\0';

    // Parse the JSON string
    cJSON *root = cJSON_Parse(jsonData);
    if (root == NULL) {
        fprintf(stderr, "Error parsing JSON\n");
        free(jsonData);
        return;
    }

    // Load the data from JSON
//    config_money_Extras = cJSON_GetObjectItem(root, "money_Extras")->valuedouble;
    config_money_initHireFee = cJSON_GetObjectItem(root, "money_initHireFee")->valuedouble;
    config_tariffPerHour = cJSON_GetObjectItem(root, "money_tariffPerHour")->valuedouble;
    config_tariffPerDistance = cJSON_GetObjectItem(root, "money_tariffPerDistance")->valuedouble;
    config_fareIncrement = cJSON_GetObjectItem(root, "money_fareIncrement")->valuedouble;


    config_currencyUnit = cJSON_GetObjectItem(root, "money_currencyUnit")->valuestring;

    config_farecountmode = cJSON_GetObjectItem(root, "config_farecountmode")->valuestring;



//    config_MoneyChargedSupplements = cJSON_GetObjectItem(root, "money_MoneyChargedSupplements")->valuedouble;
//    config_MoneyChargedFare = cJSON_GetObjectItem(root, "money_MoneyChargedFare")->valuedouble;

    config_initTime = cJSON_GetObjectItem(root, "time_initTime")->valueint;
    config_nightStartTime = cJSON_GetObjectItem(root, "time_nightStartTime")->valuestring;
    config_nightEndTime = cJSON_GetObjectItem(root, "time_nightEndTime")->valuestring;
//    config_powerOffDelay = cJSON_GetObjectItem(root, "time_powerOffDelay")->valueint;

    config_InitialDistance = cJSON_GetObjectItem(root, "distance_InitialDistance")->valuedouble;


    config_distance_distanceUnit = cJSON_GetObjectItem(root, "distance_distanceUnit")->valuestring;

    config_DatabaseOverwriteFlag = cJSON_GetObjectItem(root, "DatabaseOverwriteFlag")->valuestring;


    config_Kconstant = cJSON_GetObjectItem(root, "Kconstant")->valuedouble;
//    config_control_fareCalculationMethod = cJSON_GetObjectItem(root, "control_fareCalculationMethod")->valueint;


    config_initialHireFee_night = cJSON_GetObjectItem(root, "initialHireFee_night")->valuedouble;
    config_tariffPerK_night = cJSON_GetObjectItem(root, "tariffPerK_night")->valuedouble;
    config_tariffPerH_night = cJSON_GetObjectItem(root, "tariffPerH_night")->valuedouble;
    config_initialDistance_night = cJSON_GetObjectItem(root, "initialDistance_night")->valuedouble;
    config_initialTime_night = cJSON_GetObjectItem(root, "initialTime_night")->valuedouble;//initialTime_night




    // Print the loaded data
    qDebug() << "Configuration loaded from "<< fileName;
//    qDebug() << "money_Extras: "<< config_money_Extras;
    qDebug() << "money_initHireFee: "<< config_money_initHireFee;
    qDebug() << "money_tariffPerHour: "<< config_tariffPerHour;
    qDebug() << "money_tariffPerDistance: "<< config_tariffPerDistance;
    qDebug() << "money_fareIncrement: "<< config_fareIncrement;
    qDebug() << "money_currencyUnit: "<< config_currencyUnit;
//    qDebug() << "money_MoneyChargedSupplements: "<< config_MoneyChargedSupplements;
//    qDebug() << "money_MoneyChargedFare: "<< config_MoneyChargedFare;
    qDebug() << "time_initTime:  "<< config_initTime;
    qDebug() << "time_nightStartTime: "<< config_nightStartTime.toStdString().c_str();
    qDebug() << "time_nightEndTime: "<< config_nightEndTime.toStdString().c_str();
//    qDebug() << "time_powerOffDelay:  "<< config_powerOffDelay;
    qDebug() << "distance_InitialDistance: "<< config_InitialDistance;
    qDebug() << "distance_distanceUnit: "<< config_distance_distanceUnit;
    qDebug() << "Kconstant: "<< config_Kconstant;
    qDebug() << "config_farecountmode: "<< config_farecountmode;

    // Clean up
    free(jsonData);
    cJSON_Delete(root);


    initializeDatabase();
}



//int main() {


//    // Save the configuration to a JSON file
//    saveConfigToJson(fileName);

//    // Load and print the configuration from the JSON file
//    loadConfigFromJson(fileName);

//    return 0;
//}
