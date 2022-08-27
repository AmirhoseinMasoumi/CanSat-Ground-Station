import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15

Window {
    id: root
    width: Screen.width
    height: Screen.height
    visible: true
    title: qsTr("Alpha Ground Station")

    Material.theme: Material.Dark
    Material.accent: Material.Purple
    Material.elevation: 6

    MainPage {
        id: mainPageId
    }
}

