import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import QtQuick.Dialogs 1.3
import QtGraphicalEffects 1.15

Rectangle {
    id: containerId
    anchors.fill: parent
    color: "#262626"

    property string textColor: "#F7F7F7"
    property string teamName: "Alpha"

    MapPage {
        id: mapContainerId
        width: containerId.width * 0.4
        height: containerId.height * 0.4

        anchors.top: containerId.top
        anchors.topMargin: containerId.width * 0.005
        anchors.left: containerId.left
        anchors.leftMargin: containerId.width * 0.005

        color: containerId.color
    }
    DropShadow {
        x: mapContainerId.x
        y: mapContainerId.y
        width: mapContainerId.width
        height: mapContainerId.height
        horizontalOffset: 5
        verticalOffset: 15
        radius: 8.0
        samples: 17
        color: "#80000000"
        source: mapContainerId
    }

    CameraPage{
        id: imageContainerId
        width: containerId.width * 0.4
        height: containerId.height * 0.4

        anchors.top: containerId.top
        anchors.topMargin: containerId.width * 0.005
        anchors.left: mapContainerId.right
        anchors.leftMargin: containerId.width * 0.005

        color: containerId.color
    }
    DropShadow {
        x: imageContainerId.x
        y: imageContainerId.y
        width: imageContainerId.width
        height: imageContainerId.height
        horizontalOffset: 5
        verticalOffset: 15
        radius: 8.0
        samples: 17
        color: "#80000000"
        source: imageContainerId
    }

    MissionPage{
        id: missionStatusContainerId
        height: containerId.height * 0.4

        anchors.top: containerId.top
        anchors.topMargin: containerId.width * 0.005
        anchors.left: imageContainerId.right
        anchors.leftMargin: containerId.width * 0.005
        anchors.right: containerId.right
        anchors.rightMargin: containerId.width * 0.005

        color: containerId.color
    }
    DropShadow {
        x: missionStatusContainerId.x
        y: missionStatusContainerId.y
        width: missionStatusContainerId.width
        height: missionStatusContainerId.height
        horizontalOffset: 5
        verticalOffset: 15
        radius: 8.0
        samples: 17
        color: "#80000000"
        source: missionStatusContainerId
    }

    LiveDataPage{
        id: liveDataContainerId
        width: missionStatusContainerId.width
        height: parent.height - missionStatusContainerId.height - 40

        anchors.top: missionStatusContainerId.bottom
        anchors.topMargin: containerId.width * 0.01
        anchors.right: parent.right
        anchors.rightMargin: containerId.width * 0.005

        color: containerId.color
    }
    DropShadow {
        x: liveDataContainerId.x
        y: liveDataContainerId.y
        width: liveDataContainerId.width
        height: liveDataContainerId.height
        horizontalOffset: 5
        verticalOffset: 15
        radius: 8.0
        samples: 17
        color: "#80000000"
        source: liveDataContainerId
    }

    ChartPage{
        id: chartsId
        height: liveDataContainerId.height
        anchors.left: parent.left
        anchors.leftMargin: 10
        anchors.right: liveDataContainerId.left
        anchors.rightMargin: 10
        anchors.top: missionStatusContainerId.bottom
        anchors.topMargin: containerId.width * 0.01

        color: containerId.color


    }
    DropShadow {
        x: chartsId.x
        y: chartsId.y
        width: chartsId.width
        height: chartsId.height
        horizontalOffset: 5
        verticalOffset: 15
        radius: 8.0
        samples: 17
        color: "#80000000"
        source: chartsId
    }


}
