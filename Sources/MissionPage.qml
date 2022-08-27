import QtQuick 2.15
import QtQuick.Layouts 1.15

Rectangle {
    id: missionStatusContainerPage

    property string textColor: "#F7F7F7"

    border.color: "#999999"
    border.width: 2
    radius: 20

    Text {
        id: missionStatus
        x: 20
        y: 10
        text: "Mission Status"
        font.pointSize: 20
        color: textColor
    }

    Image {
        id: settingBtnId
        y: 20
        width: 25
        height: 20
        anchors.right: parent.right
        anchors.rightMargin: 20
        source: "Resources/Icon/Icon/Lines.png"

        MouseArea {
            anchors.fill: parent
            onClicked: {
                inputPannel.openDialog()
                SerialPort.getPortNames();
            }
        }
        SerialPortConfiguration{
            id : inputPannel
        }
    }

    Image {
        id: logoImageId
        y: 80
        anchors.right: parent.right
        anchors.rightMargin: 20
        width: parent.width * 0.3
        height: width
        source: "Resources/Icon/Etc/AlphaLogo.png"
    }

    Text {
        id: teamNameText
        x: 20
        y: 100
        text: "Team:"
        color: textColor
        font.pointSize: 13
    }

    Text {
        id: teamNameId
        y: teamNameText.y
        anchors.left: teamNameText.right
        anchors.leftMargin: 10
        text: teamName
        color: "#C4C4C4"
        font.pointSize: 13
    }

    Text {
        id: statusStateText
        x: 20
        anchors.top: teamNameId.bottom
        anchors.topMargin: 10
        text: "Status:"
        color: textColor
        font.pointSize: 13
    }

    Text {
        id: statusState
        y: statusStateText.y
        anchors.left: statusStateText.right
        anchors.leftMargin: 10
        text: "Active"  // Get Status from c++
        color: "#C4C4C4"
        font.pointSize: 13
    }

    RowLayout {
        width: parent.width * 0.7
        height: parent.height * 0.4
        anchors.top: logoImageId.bottom
        anchors.topMargin: 20
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.horizontalCenterOffset: -15
        spacing: 10

        ColumnLayout {
            width: parent.width
            spacing: 10
            Text {
                text: "CanSat Status: "
                color: textColor
                font.pointSize: 13
            }
            Text {
                text: "Launch Time: "
                color: textColor
                font.pointSize: 13
            }
            Text {
                text: "Mission Time: "
                color: textColor
                font.pointSize: 13
            }

        }
        ColumnLayout {
            width: parent.width
            spacing: 10
            Text {
                text: SerialPort.canSatStatus  // Get CanSat Status from c++
                color: "#C4C4C4"
                font.pointSize: 13
            }
            Text {
                text: SerialPort.startTime  // Get Launch Time from c++
                color: "#C4C4C4"
                font.pointSize: 13
            }
            Text {
                text: SerialPort.missionTime  // Get Mission Time from c++
                color: "#C4C4C4"
                font.pointSize: 13
            }

        }
    }
}
