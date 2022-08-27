#ifndef SERIALPORT_H
#define SERIALPORT_H

#include <QObject>
#include <QSerialPort>
#include <QSerialPortInfo>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QDebug>
#include <QFile>
#include <QDir>
#include <QDateTime>

class SerialPort : public QObject
{
    Q_OBJECT

    Q_PROPERTY(QString gpsAltitude READ gpsAltitude WRITE setGpsAltitude NOTIFY gpsAltitudeChanged)
    Q_PROPERTY(QString gpsLatitude READ gpsLatitude WRITE setGpsLatitude NOTIFY gpsLatitudeChanged)
    Q_PROPERTY(QString gpsLongitude READ gpsLongitude WRITE setGpsLongitude NOTIFY gpsLongitudeChanged)

    Q_PROPERTY(QString sensorAltitude READ sensorAltitude WRITE setSensorAltitude NOTIFY sensorAltitudeChanged)
    Q_PROPERTY(QString sensorPressure READ sensorPressure WRITE setSensorPressure NOTIFY sensorPressureChanged)
    Q_PROPERTY(QString sensorTemperature READ sensorTemperature WRITE setSensorTemperature NOTIFY sensorTemperatureChanged)
    Q_PROPERTY(QString sensorAirQuality READ sensorAirQuality WRITE setSensorAirQuality NOTIFY sensorAirQualityChanged)
    Q_PROPERTY(QString sensorHumadity READ sensorHumadity WRITE setSensorHumadity NOTIFY sensorHumadityChanged)
    Q_PROPERTY(QString sensorUvIndex READ sensorUvIndex WRITE setSensorUvIndex NOTIFY sensorUvIndexChanged)
    Q_PROPERTY(QString sensorSpeed READ sensorSpeed WRITE setSensorSpeed NOTIFY sensorSpeedChanged)

    Q_PROPERTY(QString accelerometerX READ accelerometerX WRITE setAccelerometerX NOTIFY accelerometerXChanged)
    Q_PROPERTY(QString accelerometerY READ accelerometerY WRITE setAccelerometerY NOTIFY accelerometerYChanged)
    Q_PROPERTY(QString accelerometerZ READ accelerometerZ WRITE setAccelerometerZ NOTIFY accelerometerZChanged)

    Q_PROPERTY(QString magnetometerX READ magnetometerX WRITE setMagnetometerX NOTIFY magnetometerXChanged)
    Q_PROPERTY(QString magnetometerY READ magnetometerY WRITE setMagnetometerY NOTIFY magnetometerYChanged)
    Q_PROPERTY(QString magnetometerZ READ magnetometerZ WRITE setMagnetometerZ NOTIFY magnetometerZChanged)

    Q_PROPERTY(QString consoleMessage READ consoleMessage WRITE setConsoleMessage NOTIFY consoleMessageChanged)
    Q_PROPERTY(QStringList portList READ portList WRITE setPortList NOTIFY portListChanged)
    Q_PROPERTY(bool connection READ connection WRITE setConnection NOTIFY connectionChanged)
    Q_PROPERTY(double dataCounter READ dataCounter WRITE setDataCounter NOTIFY dataCounterChanged)

    Q_PROPERTY(QString missionTime READ missionTime WRITE setMissionTime NOTIFY missionTimeChanged)
    Q_PROPERTY(QString canSatStatus READ canSatStatus WRITE setCanSatStatus NOTIFY canSatStatusChanged)

    Q_PROPERTY(QString startTime READ startTime WRITE setStartTime NOTIFY startTimeChanged)

public:
    explicit SerialPort(QObject *parent = nullptr);
    ~SerialPort();

    const QString &gpsAltitude() const;
    void setGpsAltitude(const QString &newGpsAltitude);
    const QString &gpsLatitude() const;
    void setGpsLatitude(const QString &newGpsLatitude);
    const QString &gpsLongitude() const;
    void setGpsLongitude(const QString &newGpsLongitude);
    const QString &sensorAltitude() const;
    void setSensorAltitude(const QString &newSensorAltitude);
    const QString &sensorPressure() const;
    void setSensorPressure(const QString &newSensorPressure);
    const QString &sensorTemperature() const;
    void setSensorTemperature(const QString &newSensorTemperature);
    const QString &sensorAirQuality() const;
    void setSensorAirQuality(const QString &newSensorAirQuality);
    const QString &sensorHumadity() const;
    void setSensorHumadity(const QString &newSensorHumadity);
    const QString &sensorUvIndex() const;
    void setSensorUvIndex(const QString &newSensorUvIndex);
    const QString &sensorSpeed() const;
    void setSensorSpeed(const QString &newSensorSpeed);
    const QString &accelerometerX() const;
    void setAccelerometerX(const QString &newAccelerometerX);
    const QString &accelerometerY() const;
    void setAccelerometerY(const QString &newAccelerometerY);
    const QString &accelerometerZ() const;
    void setAccelerometerZ(const QString &newAccelerometerZ);
    const QString &magnetometerX() const;
    void setMagnetometerX(const QString &newMagnetometerX);
    const QString &magnetometerY() const;
    void setMagnetometerY(const QString &newMagnetometerY);
    const QString &magnetometerZ() const;
    void setMagnetometerZ(const QString &newMagnetometerZ);
    const QString &consoleMessage() const;
    void setConsoleMessage(const QString &newConsoleMessage);
    const QStringList &portList() const;
    void setPortList(const QStringList &newPortList);
    bool connection() const;
    void setConnection(bool newConnection);
    double dataCounter() const;
    void setDataCounter(double newDataCounter);
    const QString &missionTime() const;
    void setMissionTime(const QString &newMissionTime);
    const QString &canSatStatus() const;
    void setCanSatStatus(const QString &newCanSatStatus);
    /////////////////////////////////////
    const QString &startTime() const;
    void setStartTime(const QString &newStartTime);



private:
    QString m_gpsAltitude;
    QString m_gpsLatitude;
    QString m_gpsLongitude;
    QString m_sensorAltitude;
    QString m_sensorPressure;
    QString m_sensorTemperature;
    QString m_sensorAirQuality;
    QString m_sensorHumadity;
    QString m_sensorUvIndex;
    QString m_sensorSpeed;
    QString m_accelerometerX;
    QString m_accelerometerY;
    QString m_accelerometerZ;
    QString m_magnetometerX;
    QString m_magnetometerY;
    QString m_magnetometerZ;
    QString m_consoleMessage;
    QStringList m_portList;
    bool m_connection;
    double m_dataCounter;
    QString m_missionTime;
    QString m_canSatStatus;
    QString m_startTime;
    /////////////////////////////////////
    QSerialPort *serialPort;
    QSerialPortInfo portInfo;
    QByteArray inputData;
    int payloadSize = 72;  //set Payload size
    double counter = 0;
    QString filename;
    void writeLog();
    bool writing;
    QString time_format = "hh:mm:ss";
    QDateTime currentDateTime = QDateTime::currentDateTime();
    QDateTime missionTimer;


public slots:
    void onReadData();
    void getPortNames();
    void setPortConfig(QString portName, qint32 buadRate, qint8 dataBits, qint8 parity, qint8 stopBits, qint8 flowControl);
    void disconnect();

signals:
    void gpsAltitudeChanged();
    void gpsLatitudeChanged();
    void gpsLongitudeChanged();
    void sensorAltitudeChanged();
    void sensorPressureChanged();
    void sensorTemperatureChanged();
    void sensorAirQualityChanged();
    void sensorHumadityChanged();
    void sensorUvIndexChanged();
    void sensorSpeedChanged();
    void accelerometerXChanged();
    void accelerometerYChanged();
    void accelerometerZChanged();
    void magnetometerXChanged();
    void magnetometerYChanged();
    void magnetometerZChanged();
    void consoleMessageChanged();
    void portListChanged();
    void connectionChanged();
    void dataCounterChanged();
    void missionTimeChanged();
    void canSatStatusChanged();
    void startTimeChanged();
    /////////////////////////////////////
    QStringList availablePorts(QStringList ports);

};

#endif // SERIALPORT_H
