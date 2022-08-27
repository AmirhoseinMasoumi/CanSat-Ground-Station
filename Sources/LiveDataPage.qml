import QtQuick 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls 2.15

Rectangle {
    id: liveDataContainerPage
    border.color: "#999999"
    border.width: 2
    radius: 20

    Text {
        id: liveData
        x: 20
        y: 10
        text: "Live Data"
        font.pointSize: 20
        color: textColor
    }


    Rectangle {
        id: rectangle
        x: 8
        width: 330
        height: 467
        color: "#262626"
        anchors.top: parent.top
        anchors.topMargin: 50

        GroupBox {
            id: gpsData
            x: 7
            width: 153
            height: 84
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.topMargin: 15
            anchors.leftMargin: 5
            label: Text {
                color: "#f7f7f7"
                text: "GPS Data"
            }

            Row {
                id: row
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                anchors.topMargin: -6
                anchors.bottomMargin: -1
                anchors.rightMargin: -5
                anchors.leftMargin: 5

                Column {
                    id: column
                    width: 70
                    height: 62
                    spacing: 3

                    Text {
                        id: text1
                        color: "#f7f7f7"
                        text: qsTr("Altitude:")
                        font.pixelSize: 12
                    }

                    Text {
                        id: text2
                        color: "#f7f7f7"
                        text: qsTr("Latitude:")
                        font.pixelSize: 12
                    }

                    Text {
                        id: text3
                        color: "#f7f7f7"
                        text: qsTr("Longitude:")
                        font.pixelSize: 12
                    }
                }

                Column {
                    id: column1
                    height: 62
                    spacing: 3

                    Text {
                        id: gpsAltitudeIdId
                        color: "#f7f7f7"
                        text: SerialPort.gpsAltitude  // Get GPS Altitude from C++
                        font.pixelSize: 12
                    }

                    Text {
                        id: gpsLatitudeIdId
                        color: "#f7f7f7"
                        text: SerialPort.gpsLatitude  // Get GPS Latitude from C++
                        font.pixelSize: 12
                    }

                    Text {
                        id: gpsLongitudeId
                        color: "#f7f7f7"
                        text: SerialPort.gpsLongitude  // Get GPS Longitude from C++
                        font.pixelSize: 12
                    }
                }
            }
        }

        GroupBox {
            id: sensorReading
            x: 172
            width: 153
            height: 135
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.topMargin: 15
            anchors.rightMargin: 5
            label: Text {
                color: "#f7f7f7"
                text: "Sensor Reading"
            }

            Row {
                id: row1
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                anchors.leftMargin: 5
                anchors.bottomMargin: -1
                anchors.topMargin: -6
                anchors.rightMargin: -5
                spacing: 10
                Column {
                    id: column2
                    width: 70
                    height: 128
                    spacing: 3
                    Text {
                        id: text4
                        color: "#f7f7f7"
                        text: qsTr("Altitude:")
                        font.pixelSize: 12
                    }

                    Text {
                        id: text5
                        color: "#f7f7f7"
                        text: qsTr("Pressure:")
                        font.pixelSize: 12
                    }

                    Text {
                        id: text6
                        color: "#f7f7f7"
                        text: qsTr("Temperature:")
                        font.pixelSize: 12
                    }

                    Text {
                        id: text7
                        color: "#f7f7f7"
                        text: qsTr("Air Quality:")
                        font.pixelSize: 12
                    }

                    Text {
                        id: text8
                        color: "#f7f7f7"
                        text: qsTr("Humidity:")
                        font.pixelSize: 12
                    }

                    Text {
                        id: text9
                        color: "#f7f7f7"
                        text: qsTr("UV Index:")
                        font.pixelSize: 12
                    }
                }

                Column {
                    id: column3
                    height: 128
                    spacing: 3
                    Text {
                        id: sensorAltitudeIdId
                        color: "#f7f7f7"
                        text: SerialPort.sensorAltitude     // Get Sensor Alttitude from C++
                        font.pixelSize: 12
                    }

                    Text {
                        id: sensorPressureId
                        color: "#f7f7f7"
                        text: SerialPort.sensorPressure      // Get Sensor Pressure from C++
                        font.pixelSize: 12
                    }

                    Text {
                        id: sensoTemperatureId
                        color: "#f7f7f7"
                        text: SerialPort.sensorTemperature      // Get Sensor Temperature from C++
                        font.pixelSize: 12
                    }

                    Text {
                        id: sensoAirQualityId
                        color: "#f7f7f7"
                        text: SerialPort.sensorAirQuality      // Get Sensor Air Quality from C++
                        font.pixelSize: 12
                    }

                    Text {
                        id: sensoHumidityId
                        color: "#f7f7f7"
                        text: SerialPort.sensorHumadity     // Get Sensor Humidity from C++
                        font.pixelSize: 12
                    }

                    Text {
                        id: sensoUVIndexId
                        color: "#f7f7f7"
                        text: SerialPort.sensorUvIndex      // Get Sensor UV Index from C++
                        font.pixelSize: 12
                    }
                }
            }
        }

        GroupBox {
            id: accelerometer
            x: 7
            width: 153
            height: 85
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.topMargin: 160
            label: Text {
                color: "#f7f7f7"
                text: "Accelerometer"
            }
            anchors.leftMargin: 5

            Row {
                id: row2
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                anchors.leftMargin: 5
                anchors.bottomMargin: -1
                anchors.topMargin: -6
                anchors.rightMargin: -5
                Column {
                    id: column4
                    width: 70
                    height: 62
                    spacing: 3
                    Text {
                        id: text10
                        color: "#f7f7f7"
                        text: qsTr("X:")
                        font.pixelSize: 12
                    }

                    Text {
                        id: text11
                        color: "#f7f7f7"
                        text: qsTr("Y:")
                        font.pixelSize: 12
                    }

                    Text {
                        id: text12
                        color: "#f7f7f7"
                        text: qsTr("Z:")
                        font.pixelSize: 12
                    }
                }

                Column {
                    id: column5
                    height: 62
                    spacing: 3
                    Text {
                        id: accelerometerXId
                        color: "#f7f7f7"
                        text: SerialPort.accelerometerX  // Get Accelerometer X from C++
                        font.pixelSize: 12
                    }

                    Text {
                        id: accelerometerYId
                        color: "#f7f7f7"
                        text: SerialPort.accelerometerY    // Get Accelerometer Y from C++
                        font.pixelSize: 12
                    }

                    Text {
                        id: accelerometerZId
                        color: "#f7f7f7"
                        text: SerialPort.accelerometerZ   // Get Accelerometer Z from C++
                        font.pixelSize: 12
                    }
                }
            }
        }

        GroupBox {
            id: magnetometer
            x: 172
            width: 153
            height: 85
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.topMargin: 160
            anchors.rightMargin: 5
            label: Text {
                color: "#f7f7f7"
                text: "Magnetometer"
            }

            Row {
                id: row3
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                anchors.leftMargin: 5
                anchors.rightMargin: -5
                spacing: -10
                Column {
                    id: column6
                    width: 70
                    height: 62
                    spacing: 3
                    Text {
                        id: text13
                        color: "#f7f7f7"
                        text: qsTr("X:")
                        font.pixelSize: 12
                    }

                    Text {
                        id: text14
                        color: "#f7f7f7"
                        text: qsTr("Y:")
                        font.pixelSize: 12
                    }

                    Text {
                        id: text15
                        color: "#f7f7f7"
                        text: qsTr("Z:")
                        font.pixelSize: 12
                    }
                }

                Column {
                    id: column7
                    height: 62
                    spacing: 3
                    Text {
                        id: magnetometerXId
                        color: "#f7f7f7"
                        text: SerialPort.magnetometerX  // Get Magnetometer X from C++
                        font.pixelSize: 12
                    }

                    Text {
                        id: magnetometerYId
                        color: "#f7f7f7"
                        text: SerialPort.magnetometerY   // Get Magnetometer Y from C++
                        font.pixelSize: 12
                    }

                    Text {
                        id: magnetometerZId
                        color: "#f7f7f7"
                        text: SerialPort.magnetometerZ   // Get Magnetometer Z from C++
                        font.pixelSize: 12
                    }
                }
                anchors.topMargin: -6
                anchors.bottomMargin: -1
            }
        }

        GroupBox {
            id: speed
            x: 7
            width: 153
            height: 45
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 5
            label: Text {
                color: "#f7f7f7"
                text: "Speed"
            }
            anchors.topMargin: 105
            Row {
                id: row4
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                anchors.leftMargin: 5
                anchors.rightMargin: -5
                anchors.topMargin: -9
                anchors.bottomMargin: 2
                Column {
                    id: column8
                    width: 70
                    height: 62
                    spacing: 3
                    Text {
                        id: text16
                        color: "#f7f7f7"
                        text: qsTr("Speed:")
                        font.pixelSize: 12
                    }
                }

                Column {
                    id: column9
                    height: 62
                    anchors.leftMargin: 75
                    spacing: 3
                    Text {
                        id: speedId
                        color: "#f7f7f7"
                        text: SerialPort.sensorSpeed     // Get Speed from C++
                        font.pixelSize: 12
                    }
                }
            }
        }


        ScrollView {
            id: scrollView
            height: 230
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.topMargin: 261
            anchors.leftMargin: 5
            anchors.rightMargin: 5
            ScrollBar.horizontal.policy: ScrollBar.AlwaysOff
            ScrollBar.vertical.policy: ScrollBar.AlwaysOn

            TextArea {
                id: consoleDataId
                enabled: false
                font.pointSize: 10
                background: Rectangle {
                    color: "black"
                }
                color: "white"
                wrapMode: TextArea.Wrap
                text: SerialPort.consoleMessage   // Get Console Data from C++
            }
        }
    }
}
