import QtQuick 2.15
import QtQuick.Layouts 1.15

Rectangle {
    id: imageContainerPage
    border.color: "#999999"
    border.width: 2
    radius: 20

    Image {
        id: cameraImageId
        width: imageContainerPage.width * 0.95
        height: imageContainerPage.height * 0.9
        anchors.centerIn: imageContainerPage

        source: "Resources/Etc/TestCamera.jpg"  //Get Camera Image from C++
    }
}
