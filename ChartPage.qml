import QtQuick 2.15
import QtCharts 2.15
import QtQuick.Controls 2.15

Rectangle {
    id: chartPage

    border.color: "#999999"
    border.width: 2
    radius: 20

    Grid {
        rows: 2
        anchors.fill: parent

        ChartView {
            id: cordinatesChart
            width: parent.width / 5
            height: parent.height / 2
            antialiasing: true
            theme: ChartView.ChartThemeDark

            Connections {
                target: SerialPort

                function onDataCounterChanged(){
                    latitude.append(SerialPort.dataCounter, parseInt(SerialPort.gpsLatitude))
                    longitude.append(SerialPort.dataCounter, parseInt(SerialPort.gpsLongitude))
                }
            }

            ValueAxis {
                id: cordinateRange
                min: -180
                max: 180
                tickCount: 1
            }
            ValueAxis {
                id: time1
                min: 0
                max: 300
                tickCount: 1
            }

            SplineSeries {
                id: latitude
                name: "Latitude"
                color: "red"
                width: 3
                axisX: time1
                axisY: cordinateRange
            }
            SplineSeries {
                id: longitude
                name: "Longitude"
                color: "orange"
                width: 3
                axisX: time1
                axisY: cordinateRange
            }

            MouseArea {
                anchors.fill: parent
                property bool clicked: false
                onClicked: {
                    if(clicked === false){
                        chartPage.state = "cordinatesState"
                        clicked = true
                    }
                    else{
                        chartPage.state = "normalBase"
                        clicked = false
                    }
                }
            }
        }
        ChartView {
            id: altitudeChart
            width: parent.width / 5
            height: parent.height / 2
            antialiasing: true
            theme: ChartView.ChartThemeDark

            Connections {
                target: SerialPort

                function onDataCounterChanged(){
                    gpsAltitude.append(SerialPort.dataCounter, parseInt(SerialPort.gpsAltitude))
                    sensorAltitude.append(SerialPort.dataCounter, parseInt(SerialPort.sensorAltitude))
                }
            }

            ValueAxis {
                id: altitudeRange
                min: 0
                max: 10000
                tickCount: 1
            }
            ValueAxis {
                id: time2
                min: 0
                max: 300
                tickCount: 1
            }

            SplineSeries {
                id: gpsAltitude
                name: "GPS Altitude"
                color: "red"
                width: 3
                axisX: time2
                axisY: altitudeRange
            }
            SplineSeries {
                id: sensorAltitude
                name: "Sensor Altitude"
                color: "orange"
                width: 3
                axisX: time2
                axisY: altitudeRange
            }

            MouseArea {
                anchors.fill: parent
                property bool clicked: false
                onClicked: {
                    if(clicked === false){
                        chartPage.state = "altitudeState"
                        clicked = true
                    }
                    else{
                        chartPage.state = "normalBase"
                        clicked = false
                    }
                }
            }
        }
        ChartView {
            id: accelerometerChart
            width: parent.width / 5
            height: parent.height / 2
            antialiasing: true
            theme: ChartView.ChartThemeDark

            Connections {
                target: SerialPort

                function onDataCounterChanged(){
                    accelerometerX.append(SerialPort.dataCounter, parseInt(SerialPort.accelerometerX))
                    accelerometerY.append(SerialPort.dataCounter, parseInt(SerialPort.accelerometerY))
                    accelerometerZ.append(SerialPort.dataCounter, parseInt(SerialPort.accelerometerZ))
                }
            }

            ValueAxis {
                id: accelerometerRange
                min: -180
                max: 180
                tickCount: 1
            }
            ValueAxis {
                id: time3
                min: 0
                max: 300
                tickCount: 1
            }

            SplineSeries {
                id: accelerometerX
                name: "Accelerometer X"
                color: "red"
                width: 3
                axisX: time3
                axisY: accelerometerRange
            }
            SplineSeries {
                id: accelerometerY
                name: "Accelerometer Y"
                color: "green"
                width: 3
                axisX: time3
                axisY: accelerometerRange
            }
            SplineSeries {
                id: accelerometerZ
                name: "Accelerometer Z"
                color: "orange"
                width: 3
                axisX: time3
                axisY: accelerometerRange
            }

            MouseArea {
                anchors.fill: parent
                property bool clicked: false
                onClicked: {
                    if(clicked === false){
                        chartPage.state = "accelerometerState"
                        clicked = true
                    }
                    else{
                        chartPage.state = "normalBase"
                        clicked = false
                    }
                }
            }
        }
        ChartView {
            id: magnetometerChart
            width: parent.width / 5
            height: parent.height / 2
            antialiasing: true
            theme: ChartView.ChartThemeDark

            Connections {
                target: SerialPort

                function onDataCounterChanged(){
                    magnetometerX.append(SerialPort.dataCounter, parseInt(SerialPort.magnetometerX))
                    magnetometerY.append(SerialPort.dataCounter, parseInt(SerialPort.magnetometerY))
                    magnetometerZ.append(SerialPort.dataCounter, parseInt(SerialPort.magnetometerZ))
                }
            }

            ValueAxis {
                id: magnetometerRange
                min: -16
                max: 16
                tickCount: 1
            }
            ValueAxis {
                id: time4
                min: 0
                max: 300
                tickCount: 1
            }

            SplineSeries {
                id: magnetometerX
                name: "Magnetometer X"
                color: "red"
                width: 3
                axisX: time4
                axisY: magnetometerRange
            }
            SplineSeries {
                id: magnetometerY
                name: "Magnetometer Y"
                color: "green"
                width: 3
                axisX: time4
                axisY: magnetometerRange
            }
            SplineSeries {
                id: magnetometerZ
                name: "Magnetometer Z"
                color: "orange"
                width: 3
                axisX: time4
                axisY: magnetometerRange
            }

            MouseArea {
                anchors.fill: parent
                property bool clicked: false
                onClicked: {
                    if(clicked === false){
                        chartPage.state = "magnetometerState"
                        clicked = true
                    }
                    else{
                        chartPage.state = "normalBase"
                        clicked = false
                    }
                }
            }
        }
        ChartView {
            id: temperatureChart
            width: parent.width / 5
            height: parent.height / 2
            antialiasing: true
            theme: ChartView.ChartThemeDark

            Connections {
                target: SerialPort

                function onDataCounterChanged(){
                    temperature.append(SerialPort.dataCounter, parseInt(SerialPort.sensorTemperature))
                }
            }

            ValueAxis {
                id: temperatureRange
                min: -20
                max: 80
                tickCount: 1
            }
            ValueAxis {
                id: time5
                min: 0
                max: 300
                tickCount: 1
            }

            SplineSeries {
                id: temperature
                name: "Temperature"
                color: "red"
                width: 3
                axisX: time5
                axisY: temperatureRange
            }

            MouseArea {
                anchors.fill: parent
                property bool clicked: false
                onClicked: {
                    if(clicked === false){
                        chartPage.state = "temperatureState"
                        clicked = true
                    }
                    else{
                        chartPage.state = "normalBase"
                        clicked = false
                    }
                }
            }
        }
        ChartView {
            id: pressureChart
            width: parent.width / 5
            height: parent.height / 2
            antialiasing: true
            theme: ChartView.ChartThemeDark

            Connections {
                target: SerialPort

                function onDataCounterChanged(){
                    pressure.append(SerialPort.dataCounter, parseInt(SerialPort.sensorPressure))
                }
            }

            ValueAxis {
                id: pressureRange
                min: 0
                max: 100
                tickCount: 1
            }
            ValueAxis {
                id: time6
                min: 0
                max: 300
                tickCount: 1
            }

            SplineSeries {
                id: pressure
                name: "Pressure"
                color: "red"
                width: 3
                axisX: time6
                axisY: pressureRange
            }

            MouseArea {
                anchors.fill: parent
                property bool clicked: false
                onClicked: {
                    if(clicked === false){
                        chartPage.state = "pressureState"
                        clicked = true
                    }
                    else{
                        chartPage.state = "normalBase"
                        clicked = false
                    }
                }
            }
        }
        ChartView {
            id: airQualityChart
            width: parent.width / 5
            height: parent.height / 2
            antialiasing: true
            theme: ChartView.ChartThemeDark

            Connections {
                target: SerialPort

                function onDataCounterChanged(){
                    airQuality.append(SerialPort.dataCounter, parseInt(SerialPort.sensorAirQuality))
                }
            }

            ValueAxis {
                id: airQualityRange
                min: 0
                max: 200
                tickCount: 1
            }
            ValueAxis {
                id: time7
                min: 0
                max: 300
                tickCount: 1
            }

            SplineSeries {
                id: airQuality
                name: "Air Quality"
                color: "red"
                width: 3
                axisX: time7
                axisY: airQualityRange
            }

            MouseArea {
                anchors.fill: parent
                property bool clicked: false
                onClicked: {
                    if(clicked === false){
                        chartPage.state = "airQualityState"
                        clicked = true
                    }
                    else{
                        chartPage.state = "normalBase"
                        clicked = false
                    }
                }
            }
        }
        ChartView {
            id: humidityChart
            width: parent.width / 5
            height: parent.height / 2
            antialiasing: true
            theme: ChartView.ChartThemeDark

            Connections {
                target: SerialPort

                function onDataCounterChanged(){
                    humidity.append(SerialPort.dataCounter, parseInt(SerialPort.sensorHumadity))
                }
            }

            ValueAxis {
                id: humidityRange
                min: 0
                max: 100
                tickCount: 1
            }
            ValueAxis {
                id: time8
                min: 0
                max: 300
                tickCount: 1
            }

            SplineSeries {
                id: humidity
                name: "Humidity"
                color: "red"
                width: 3
                axisX: time8
                axisY: humidityRange
            }

            MouseArea {
                anchors.fill: parent
                property bool clicked: false
                onClicked: {
                    if(clicked === false){
                        chartPage.state = "humidityState"
                        clicked = true
                    }
                    else{
                        chartPage.state = "normalBase"
                        clicked = false
                    }
                }
            }
        }
        ChartView {
            id: uvIndexChart
            width: parent.width / 5
            height: parent.height / 2
            antialiasing: true
            theme: ChartView.ChartThemeDark

            Connections {
                target: SerialPort

                function onDataCounterChanged(){
                    uvIndex.append(SerialPort.dataCounter, parseInt(SerialPort.sensorUvIndex))
                }
            }

            ValueAxis {
                id: uvIndexRange
                min: 0
                max: 10
                tickCount: 1
            }
            ValueAxis {
                id: time9
                min: 0
                max: 300
                tickCount: 1
            }

            SplineSeries {
                id: uvIndex
                name: "UV Index"
                color: "red"
                width: 3
                axisX: time9
                axisY: uvIndexRange
            }

            MouseArea {
                anchors.fill: parent
                property bool clicked: false
                onClicked: {
                    if(clicked === false){
                        chartPage.state = "uvIndexState"
                        clicked = true
                    }
                    else{
                        chartPage.state = "normalBase"
                        clicked = false
                    }
                }
            }
        }
        ChartView {
            id: speedChart
            width: parent.width / 5
            height: parent.height / 2
            antialiasing: true
            theme: ChartView.ChartThemeDark

            Connections {
                target: SerialPort

                function onDataCounterChanged(){
                    speed.append(SerialPort.dataCounter, parseInt(SerialPort.sensorSpeed))
                }
            }

            ValueAxis {
                id: speedRange
                min: 0
                max: 100
                tickCount: 1
            }
            ValueAxis {
                id: time10
                min: 0
                max: 300
                tickCount: 1
            }

            SplineSeries {
                id: speed
                name: "Speed"
                color: "red"
                width: 3
                axisX: time10
                axisY: speedRange
            }

            MouseArea {
                anchors.fill: parent
                property bool clicked: false
                onClicked: {
                    if(clicked === false){
                        chartPage.state = "speedState"
                        clicked = true
                    }
                    else{
                        chartPage.state = "normalBase"
                        clicked = false
                    }
                }
            }
        }
    }

    states: [
        State {
            name: "normalBase"
            PropertyChanges {
                target: cordinatesChart
                visible: true
                x: 0
                y: 0
                width: chartPage.width / 5
                height: chartPage.height / 2
            }
            PropertyChanges {
                target: altitudeChart
                visible: true
                x: 309
                y: 0
                width: chartPage.width / 5
                height: chartPage.height / 2
            }
            PropertyChanges {
                target: accelerometerChart
                visible: true
                x: 618
                y: 0
                width: chartPage.width / 5
                height: chartPage.height / 2
            }
            PropertyChanges {
                target: magnetometerChart
                visible: true
                x: 924
                y: 0
                width: chartPage.width / 5
                height: chartPage.height / 2
            }
            PropertyChanges {
                target: temperatureChart
                visible: true
                x: 1236
                y: 0
                width: chartPage.width / 5
                height: chartPage.height / 2
            }
            PropertyChanges {
                target: pressureChart
                visible: true
                x: 0
                y: 309
                width: chartPage.width / 5
                height: chartPage.height / 2
            }
            PropertyChanges {
                target: airQualityChart
                visible: true
                x: 309
                y: 309
                width: chartPage.width / 5
                height: chartPage.height / 2
            }
            PropertyChanges {
                target: humidityChart
                visible: true
                x: 618
                y: 309
                width: chartPage.width / 5
                height: chartPage.height / 2
            }
            PropertyChanges {
                target: uvIndexChart
                visible: true
                x: 927
                y: 309
                width: chartPage.width / 5
                height: chartPage.height / 2
            }
            PropertyChanges {
                target: speedChart
                visible: true
                x: 1236
                y: 309
                width: chartPage.width / 5
                height: chartPage.height / 2
            }
        },
        State {
            name: "cordinatesState"
            PropertyChanges {
                target: cordinatesChart
                visible: true
            }
            PropertyChanges {
                target: altitudeChart
                visible: false
            }
            PropertyChanges {
                target: accelerometerChart
                visible: false
            }
            PropertyChanges {
                target: magnetometerChart
                visible: false
            }
            PropertyChanges {
                target: temperatureChart
                visible: false
            }
            PropertyChanges {
                target: pressureChart
                visible: false
            }
            PropertyChanges {
                target: airQualityChart
                visible: false
            }
            PropertyChanges {
                target: humidityChart
                visible: false
            }
            PropertyChanges {
                target: uvIndexChart
                visible: false
            }
            PropertyChanges {
                target: speedChart
                visible: false
            }
            PropertyChanges {
                target: cordinatesChart
                x: 0
                y: 0
                width: chartPage.width
                height: chartPage.height
            }
        },
        State {
            name: "altitudeState"
            PropertyChanges {
                target: cordinatesChart
                visible: false
            }
            PropertyChanges {
                target: altitudeChart
                visible: true
            }
            PropertyChanges {
                target: accelerometerChart
                visible: false
            }
            PropertyChanges {
                target: magnetometerChart
                visible: false
            }
            PropertyChanges {
                target: temperatureChart
                visible: false
            }
            PropertyChanges {
                target: pressureChart
                visible: false
            }
            PropertyChanges {
                target: airQualityChart
                visible: false
            }
            PropertyChanges {
                target: humidityChart
                visible: false
            }
            PropertyChanges {
                target: uvIndexChart
                visible: false
            }
            PropertyChanges {
                target: speedChart
                visible: false
            }
            PropertyChanges {
                target: altitudeChart
                x: 0
                y: 0
                width: chartPage.width
                height: chartPage.height
            }
        },
        State {
            name: "accelerometerState"
            PropertyChanges {
                target: cordinatesChart
                visible: false
            }
            PropertyChanges {
                target: altitudeChart
                visible: false
            }
            PropertyChanges {
                target: accelerometerChart
                visible: true
            }
            PropertyChanges {
                target: magnetometerChart
                visible: false
            }
            PropertyChanges {
                target: temperatureChart
                visible: false
            }
            PropertyChanges {
                target: pressureChart
                visible: false
            }
            PropertyChanges {
                target: airQualityChart
                visible: false
            }
            PropertyChanges {
                target: humidityChart
                visible: false
            }
            PropertyChanges {
                target: uvIndexChart
                visible: false
            }
            PropertyChanges {
                target: speedChart
                visible: false
            }
            PropertyChanges {
                target: accelerometerChart
                x: 0
                y: 0
                width: chartPage.width
                height: chartPage.height
            }
        },
        State {
            name: "magnetometerState"
            PropertyChanges {
                target: cordinatesChart
                visible: false
            }
            PropertyChanges {
                target: altitudeChart
                visible: false
            }
            PropertyChanges {
                target: accelerometerChart
                visible: false
            }
            PropertyChanges {
                target: magnetometerChart
                visible: true
            }
            PropertyChanges {
                target: temperatureChart
                visible: false
            }
            PropertyChanges {
                target: pressureChart
                visible: false
            }
            PropertyChanges {
                target: airQualityChart
                visible: false
            }
            PropertyChanges {
                target: humidityChart
                visible: false
            }
            PropertyChanges {
                target: uvIndexChart
                visible: false
            }
            PropertyChanges {
                target: speedChart
                visible: false
            }
            PropertyChanges {
                target: magnetometerChart
                x: 0
                y: 0
                width: chartPage.width
                height: chartPage.height
            }
        },
        State {
            name: "temperatureState"
            PropertyChanges {
                target: cordinatesChart
                visible: false
            }
            PropertyChanges {
                target: altitudeChart
                visible: false
            }
            PropertyChanges {
                target: accelerometerChart
                visible: false
            }
            PropertyChanges {
                target: magnetometerChart
                visible: false
            }
            PropertyChanges {
                target: temperatureChart
                visible: true
            }
            PropertyChanges {
                target: pressureChart
                visible: false
            }
            PropertyChanges {
                target: airQualityChart
                visible: false
            }
            PropertyChanges {
                target: humidityChart
                visible: false
            }
            PropertyChanges {
                target: uvIndexChart
                visible: false
            }
            PropertyChanges {
                target: speedChart
                visible: false
            }
            PropertyChanges {
                target: temperatureChart
                x: 0
                y: 0
                width: chartPage.width
                height: chartPage.height
            }
        },
        State {
            name: "pressureState"
            PropertyChanges {
                target: cordinatesChart
                visible: false
            }
            PropertyChanges {
                target: altitudeChart
                visible: false
            }
            PropertyChanges {
                target: accelerometerChart
                visible: false
            }
            PropertyChanges {
                target: magnetometerChart
                visible: false
            }
            PropertyChanges {
                target: temperatureChart
                visible: false
            }
            PropertyChanges {
                target: pressureChart
                visible: true
            }
            PropertyChanges {
                target: airQualityChart
                visible: false
            }
            PropertyChanges {
                target: humidityChart
                visible: false
            }
            PropertyChanges {
                target: uvIndexChart
                visible: false
            }
            PropertyChanges {
                target: speedChart
                visible: false
            }
            PropertyChanges {
                target: pressureChart
                x: 0
                y: 0
                width: chartPage.width
                height: chartPage.height
            }
        },
        State {
            name: "airQualityState"
            PropertyChanges {
                target: cordinatesChart
                visible: false
            }
            PropertyChanges {
                target: altitudeChart
                visible: false
            }
            PropertyChanges {
                target: accelerometerChart
                visible: false
            }
            PropertyChanges {
                target: magnetometerChart
                visible: false
            }
            PropertyChanges {
                target: temperatureChart
                visible: false
            }
            PropertyChanges {
                target: pressureChart
                visible: false
            }
            PropertyChanges {
                target: airQualityChart
                visible: true
            }
            PropertyChanges {
                target: humidityChart
                visible: false
            }
            PropertyChanges {
                target: uvIndexChart
                visible: false
            }
            PropertyChanges {
                target: speedChart
                visible: false
            }
            PropertyChanges {
                target: airQualityChart
                x: 0
                y: 0
                width: chartPage.width
                height: chartPage.height
            }
        },
        State {
            name: "humidityState"
            PropertyChanges {
                target: cordinatesChart
                visible: false
            }
            PropertyChanges {
                target: altitudeChart
                visible: false
            }
            PropertyChanges {
                target: accelerometerChart
                visible: false
            }
            PropertyChanges {
                target: magnetometerChart
                visible: false
            }
            PropertyChanges {
                target: temperatureChart
                visible: false
            }
            PropertyChanges {
                target: pressureChart
                visible: false
            }
            PropertyChanges {
                target: airQualityChart
                visible: false
            }
            PropertyChanges {
                target: humidityChart
                visible: true
            }
            PropertyChanges {
                target: uvIndexChart
                visible: false
            }
            PropertyChanges {
                target: speedChart
                visible: false
            }
            PropertyChanges {
                target: humidityChart
                x: 0
                y: 0
                width: chartPage.width
                height: chartPage.height
            }
        },
        State {
            name: "uvIndexState"
            PropertyChanges {
                target: cordinatesChart
                visible: false
            }
            PropertyChanges {
                target: altitudeChart
                visible: false
            }
            PropertyChanges {
                target: accelerometerChart
                visible: false
            }
            PropertyChanges {
                target: magnetometerChart
                visible: false
            }
            PropertyChanges {
                target: temperatureChart
                visible: false
            }
            PropertyChanges {
                target: pressureChart
                visible: false
            }
            PropertyChanges {
                target: airQualityChart
                visible: false
            }
            PropertyChanges {
                target: humidityChart
                visible: false
            }
            PropertyChanges {
                target: uvIndexChart
                visible: true
            }
            PropertyChanges {
                target: speedChart
                visible: false
            }
            PropertyChanges {
                target: uvIndexChart
                x: 0
                y: 0
                width: chartPage.width
                height: chartPage.height
            }
        },
        State {
            name: "speedState"
            PropertyChanges {
                target: cordinatesChart
                visible: false
            }
            PropertyChanges {
                target: altitudeChart
                visible: false
            }
            PropertyChanges {
                target: accelerometerChart
                visible: false
            }
            PropertyChanges {
                target: magnetometerChart
                visible: false
            }
            PropertyChanges {
                target: temperatureChart
                visible: false
            }
            PropertyChanges {
                target: pressureChart
                visible: false
            }
            PropertyChanges {
                target: airQualityChart
                visible: false
            }
            PropertyChanges {
                target: humidityChart
                visible: false
            }
            PropertyChanges {
                target: uvIndexChart
                visible: false
            }
            PropertyChanges {
                target: speedChart
                visible: true
            }
            PropertyChanges {
                target: speedChart
                x: 0
                y: 0
                width: chartPage.width
                height: chartPage.height
            }
        }
    ]

    transitions: Transition {
        from: "*"
        to: "*"
        NumberAnimation {
            properties: "visible"
            duration: 1
        }
        NumberAnimation {
            properties: "width"
            duration: 1
        }
        NumberAnimation {
            properties: "height"
            duration: 1
        }
    }
}
