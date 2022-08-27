#include "serialport.h"

SerialPort::SerialPort(QObject *parent) :
    QObject{parent},
    m_gpsAltitude("0000"),
    m_gpsLatitude("00.0000"),
    m_gpsLongitude("00.0000"),
    m_sensorAltitude("0000"),
    m_sensorPressure("00.0000"),
    m_sensorTemperature("00"),
    m_sensorAirQuality("00"),
    m_sensorHumadity("00"),
    m_sensorUvIndex("0"),
    m_sensorSpeed("00"),
    m_accelerometerX("000"),
    m_accelerometerY("000"),
    m_accelerometerZ("000"),
    m_magnetometerX("0"),
    m_magnetometerY("0"),
    m_magnetometerZ("0"),
    m_consoleMessage("No message recived ..."),
    m_connection(false),
    m_dataCounter(0),
    m_missionTime("00:00"),
    m_canSatStatus("NA"),
    writing(true)
{
    serialPort = new QSerialPort(this);
    connect(serialPort, &QSerialPort::readyRead, this, &SerialPort::onReadData);
    qDebug() << QDir().absolutePath();
    filename = QDir().absolutePath() + "/Log.txt";

    setStartTime(currentDateTime.toString(time_format));
}

SerialPort::~SerialPort()
{
    delete serialPort;
    qInfo() << "Serial Port Closed";
}

const QString &SerialPort::gpsAltitude() const
{
    return m_gpsAltitude;
}

void SerialPort::setGpsAltitude(const QString &newGpsAltitude)
{
    if (m_gpsAltitude == newGpsAltitude)
        return;
    m_gpsAltitude = newGpsAltitude;
    emit gpsAltitudeChanged();
}

const QString &SerialPort::gpsLatitude() const
{
    return m_gpsLatitude;
}

void SerialPort::setGpsLatitude(const QString &newGpsLatitude)
{
    if (m_gpsLatitude == newGpsLatitude)
        return;
    m_gpsLatitude = newGpsLatitude;
    emit gpsLatitudeChanged();
}

const QString &SerialPort::gpsLongitude() const
{
    return m_gpsLongitude;
}

void SerialPort::setGpsLongitude(const QString &newGpsLongitude)
{
    if (m_gpsLongitude == newGpsLongitude)
        return;
    m_gpsLongitude = newGpsLongitude;
    emit gpsLongitudeChanged();
}

const QString &SerialPort::sensorAltitude() const
{
    return m_sensorAltitude;
}

void SerialPort::setSensorAltitude(const QString &newSensorAltitude)
{
    if (m_sensorAltitude == newSensorAltitude)
        return;
    m_sensorAltitude = newSensorAltitude;
    emit sensorAltitudeChanged();
}

const QString &SerialPort::sensorPressure() const
{
    return m_sensorPressure;
}

void SerialPort::setSensorPressure(const QString &newSensorPressure)
{
    if (m_sensorPressure == newSensorPressure)
        return;
    m_sensorPressure = newSensorPressure;
    emit sensorPressureChanged();
}

const QString &SerialPort::sensorTemperature() const
{
    return m_sensorTemperature;
}

void SerialPort::setSensorTemperature(const QString &newSensorTemperature)
{
    if (m_sensorTemperature == newSensorTemperature)
        return;
    m_sensorTemperature = newSensorTemperature;
    emit sensorTemperatureChanged();
}

const QString &SerialPort::sensorAirQuality() const
{
    return m_sensorAirQuality;
}

void SerialPort::setSensorAirQuality(const QString &newSensorAirQuality)
{
    if (m_sensorAirQuality == newSensorAirQuality)
        return;
    m_sensorAirQuality = newSensorAirQuality;
    emit sensorAirQualityChanged();
}

const QString &SerialPort::sensorHumadity() const
{
    return m_sensorHumadity;
}

void SerialPort::setSensorHumadity(const QString &newSensorHumadity)
{
    if (m_sensorHumadity == newSensorHumadity)
        return;
    m_sensorHumadity = newSensorHumadity;
    emit sensorHumadityChanged();
}

const QString &SerialPort::sensorUvIndex() const
{
    return m_sensorUvIndex;
}

void SerialPort::setSensorUvIndex(const QString &newSensorUvIndex)
{
    if (m_sensorUvIndex == newSensorUvIndex)
        return;
    m_sensorUvIndex = newSensorUvIndex;
    emit sensorUvIndexChanged();
}

const QString &SerialPort::sensorSpeed() const
{
    return m_sensorSpeed;
}

void SerialPort::setSensorSpeed(const QString &newSensorSpeed)
{
    if (m_sensorSpeed == newSensorSpeed)
        return;
    m_sensorSpeed = newSensorSpeed;
    emit sensorSpeedChanged();
}

const QString &SerialPort::accelerometerX() const
{
    return m_accelerometerX;
}

void SerialPort::setAccelerometerX(const QString &newAccelerometerX)
{
    if (m_accelerometerX == newAccelerometerX)
        return;
    m_accelerometerX = newAccelerometerX;
    emit accelerometerXChanged();
}

const QString &SerialPort::accelerometerY() const
{
    return m_accelerometerY;
}

void SerialPort::setAccelerometerY(const QString &newAccelerometerY)
{
    if (m_accelerometerY == newAccelerometerY)
        return;
    m_accelerometerY = newAccelerometerY;
    emit accelerometerYChanged();
}

const QString &SerialPort::accelerometerZ() const
{
    return m_accelerometerZ;
}

void SerialPort::setAccelerometerZ(const QString &newAccelerometerZ)
{
    if (m_accelerometerZ == newAccelerometerZ)
        return;
    m_accelerometerZ = newAccelerometerZ;
    emit accelerometerZChanged();
}

const QString &SerialPort::magnetometerX() const
{
    return m_magnetometerX;
}

void SerialPort::setMagnetometerX(const QString &newMagnetometerX)
{
    if (m_magnetometerX == newMagnetometerX)
        return;
    m_magnetometerX = newMagnetometerX;
    emit magnetometerXChanged();
}

const QString &SerialPort::magnetometerY() const
{
    return m_magnetometerY;
}

void SerialPort::setMagnetometerY(const QString &newMagnetometerY)
{
    if (m_magnetometerY == newMagnetometerY)
        return;
    m_magnetometerY = newMagnetometerY;
    emit magnetometerYChanged();
}

const QString &SerialPort::magnetometerZ() const
{
    return m_magnetometerZ;
}

void SerialPort::setMagnetometerZ(const QString &newMagnetometerZ)
{
    if (m_magnetometerZ == newMagnetometerZ)
        return;
    m_magnetometerZ = newMagnetometerZ;
    emit magnetometerZChanged();
}

const QString &SerialPort::consoleMessage() const
{
    return m_consoleMessage;
}

void SerialPort::setConsoleMessage(const QString &newConsoleMessage)
{
    if (m_consoleMessage == newConsoleMessage)
        return;
    m_consoleMessage = newConsoleMessage;
    emit consoleMessageChanged();
}

const QStringList &SerialPort::portList() const
{
    return m_portList;
}

void SerialPort::setPortList(const QStringList &newPortList)
{
    if (m_portList == newPortList)
        return;
    m_portList = newPortList;
    emit portListChanged();
}

bool SerialPort::connection() const
{
    return m_connection;
}

void SerialPort::setConnection(bool newConnection)
{
    if (m_connection == newConnection)
        return;
    m_connection = newConnection;
    emit connectionChanged();
}

double SerialPort::dataCounter() const
{
    return m_dataCounter;
}

void SerialPort::setDataCounter(double newDataCounter)
{
    if (qFuzzyCompare(m_dataCounter, newDataCounter))
        return;
    m_dataCounter = newDataCounter;
    emit dataCounterChanged();
}

const QString &SerialPort::missionTime() const
{
    return m_missionTime;
}

void SerialPort::setMissionTime(const QString &newMissionTime)
{
    if (m_missionTime == newMissionTime)
        return;
    m_missionTime = newMissionTime;
    emit missionTimeChanged();
}

const QString &SerialPort::canSatStatus() const
{
    return m_canSatStatus;
}

void SerialPort::setCanSatStatus(const QString &newCanSatStatus)
{
    if (m_canSatStatus == newCanSatStatus)
        return;
    m_canSatStatus = newCanSatStatus;
    emit canSatStatusChanged();
}

const QString &SerialPort::startTime() const
{
    return m_startTime;
}

void SerialPort::setStartTime(const QString &newStartTime)
{
    if (m_startTime == newStartTime)
        return;
    m_startTime = newStartTime;
    emit startTimeChanged();
}

/////////////////////////////////////////////////
void SerialPort::onReadData()
{
    inputData.append(serialPort->readAll());
    if(inputData.length() == payloadSize){               //Set paylaod size
        QString value = QString(inputData);
        inputData = "";
        setConsoleMessage(value);
        //qInfo()  << value;

        QStringList splitedData = value.split(QLatin1Char(','));
        if(splitedData[0] == "data"){
            qDebug()<< splitedData;

            setGpsAltitude(splitedData[1]);
            setGpsLatitude(splitedData[2]);
            setGpsLongitude(splitedData[3]);
            setSensorAltitude(splitedData[4]);
            setSensorPressure(splitedData[5]);
            setSensorTemperature(splitedData[6]);
            setSensorAirQuality(splitedData[7]);
            setSensorHumadity(splitedData[8]);
            setSensorUvIndex(splitedData[9]);
            setSensorSpeed(splitedData[10]);
            setAccelerometerX(splitedData[11]);
            setAccelerometerY(splitedData[12]);
            setAccelerometerZ(splitedData[13]);
            setMagnetometerX(splitedData[14]);
            setMagnetometerY(splitedData[15]);
            setMagnetometerZ(splitedData[16]);

            counter++;
            setDataCounter(counter);
            writeLog();
        }
    }
}

void SerialPort::setPortConfig(QString portName, qint32 buadRate, qint8 dataBits, qint8 parity, qint8 stopBits, qint8 flowControl)
{
    serialPort->setPortName(portName);
    serialPort->setBaudRate(buadRate);
    switch(dataBits) {
    case 0:
        serialPort->setDataBits(QSerialPort::Data5);
        break;
    case 1:
        serialPort->setDataBits(QSerialPort::Data6);
        break;
    case 2:
        serialPort->setDataBits(QSerialPort::Data7);
        break;
    case 3:
        serialPort->setDataBits(QSerialPort::Data8);
        break;
    }
    switch(parity) {
    case 0:
        serialPort->setParity(QSerialPort::NoParity);
        break;
    case 1:
        serialPort->setParity(QSerialPort::EvenParity);
        break;
    case 2:
        serialPort->setParity(QSerialPort::OddParity);
        break;
    case 3:
        serialPort->setParity(QSerialPort::MarkParity);
        break;
    case 4:
        serialPort->setParity(QSerialPort::SpaceParity);
        break;
    }
    switch(stopBits) {
    case 0:
        serialPort->setStopBits(QSerialPort::OneStop);
        break;
    case 1:
        serialPort->setStopBits(QSerialPort::OneAndHalfStop);
        break;
    case 2:
        serialPort->setStopBits(QSerialPort::TwoStop);
        break;
    }
    switch(flowControl) {
    case 0:
        serialPort->setFlowControl(QSerialPort::NoFlowControl);
        break;
    case 1:
        serialPort->setFlowControl(QSerialPort::HardwareControl);
        break;
    case 2:
        serialPort->setFlowControl(QSerialPort::SoftwareControl);
        break;
    }

    if(serialPort->open(QSerialPort::ReadWrite)){
        qDebug()<<"Connected to "<< portName;
        setConnection(true);
    }
    else{
        qCritical()<<"Serial Port error: " << serialPort->errorString();
        setConnection(false);
    }
}

void SerialPort::disconnect()
{
    serialPort->close();
    qDebug()<<"Disconnected";
    setConnection(false);
    writing = false;
}

void SerialPort::getPortNames()
{
    QStringList ports;
    foreach(QSerialPortInfo port, portInfo.availablePorts()){
        qInfo() << port.portName();
        ports.append(port.portName());
    }
    setPortList(ports);
}

void SerialPort::writeLog()
{
    QFile file(filename);
    if(!file.open(QFile::WriteOnly | QFile::Text | QIODevice::Append))
    {
        qDebug() << " Could not open file for writing";
        return;
    }
    qDebug() << "Writing to Log file";
    QTextStream out(&file);
    out << "Alpha" << "," << missionTime() << "," << dataCounter() << "," << gpsAltitude() << "," << gpsLongitude() << "," << sensorAltitude() << "," << sensorTemperature() << "," << sensorPressure() << "," << sensorHumadity() << "," << accelerometerY() << "," << sensorUvIndex() << "\n";
    file.flush();
    if(!writing){
        file.close();
        qDebug() << "Writing finished";
    }

}

