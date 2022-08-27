import QtQuick 2.15
import QtLocation 5.15
import QtPositioning 5.15


Rectangle {
    id: mapContainerPage

    property real firstxPos: 31.84480
    property real firstyPos: 54.36211

    border.color: "#999999"
    border.width: 2
    radius: 20

    Plugin {
        id: mapPlugin
        name: "osm" // "mapboxgl", "esri", ...
        PluginParameter {
            name: "osm.mapping.providersrepository.disabled"
            value: "true"
        }
        PluginParameter {
            name: "osm.mapping.providersrepository.address"
            value: "http://maps-redirect.qt.io/osm/5.6/"
        }
    }

    Map {
        width: mapContainerPage.width * 0.95
        height: mapContainerPage.height * 0.9
        anchors.centerIn: mapContainerPage

        plugin: mapPlugin
        center: QtPositioning.coordinate(parseFloat(SerialPort.gpsLatitude), parseFloat(SerialPort.gpsLongitude)) //Get CanSat first Postition from C++
        zoomLevel: 17

        MapQuickItem {
            id: mapId
            anchorPoint.x: image.width * 0.25
            anchorPoint.y: image.height

            coordinate {
                latitude: parseFloat(SerialPort.gpsLatitude)    //Get CanSat Postition from C++
                longitude: parseFloat(SerialPort.gpsLongitude)
            }

            sourceItem: Column {
                Image {
                    id: image
                    width: mapContainerPage.width * 0.07
                    height: width * 1.1
                    source: "Resources/MapMarker/planeMapMarker.png"
                }
            }
        }
    }
}

