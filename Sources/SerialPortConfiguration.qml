import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15
import QtQuick.Layouts 1.3

Item {
    id : rootId
    function openDialog(){
        inputDialog.open()
    }

    property string textColor: "#E8E8E8"

    Dialog {
        id: inputDialog

        anchors.centerIn: parent

        width: parent.width / 5 //Breaks the binding loop introduced in Qt 5.12.
        height: parent.height / 2
        parent: Overlay.overlay

        focus: true
        modal: true
        title: "Serial Port Cofiguration"
        standardButtons: Dialog.Close

        Column {
            anchors.fill: parent
            spacing: 20
            RowLayout {
                id: settingId
                //anchors.fill: parent
                width: parent.width
                height: parent.height - connectionBtn.height
                spacing: 70

                ColumnLayout {
                    spacing: 25
                    Text {
                        text: "Serial Port"
                        color: textColor
                        font.pointSize: 15
                    }
                    Text {
                        text: "BuadRate"
                        color: textColor
                        font.pointSize: 15
                    }
                    Text {
                        text: "Data bits"
                        color: textColor
                        font.pointSize: 15
                    }
                    Text {
                        text: "Parity"
                        color: textColor
                        font.pointSize: 15
                    }
                    Text {
                        text: "Stop bits"
                        color: textColor
                        font.pointSize: 15
                    }
                    Text {
                        text: "Flow control"
                        color: textColor
                        font.pointSize: 15
                    }
                }

                ColumnLayout {
                    ComboBox {
                        id: selectedPortId
                        model: SerialPort.portList  // Get Ports from C++
                    }
                    ComboBox {
                        id: selectedBuadRateId
                        model: ListModel {
                            id: buadRatesModel
                            ListElement { text: "9600"}
                            ListElement { text: "19200"}
                            ListElement { text: "38400"}
                            ListElement { text: "115200"}
                            ListElement { text: "230400"}
                            ListElement { text: "460800"}
                            ListElement { text: "921600"}
                        }
                    }
                    ComboBox {
                        id: selectedDatabitId
                        model: ListModel {
                            id: databitsModel
                            ListElement { text: "5" }
                            ListElement { text: "6" }
                            ListElement { text: "7"}
                            ListElement { text: "8"}
                        }
                        currentIndex: 3
                    }
                    ComboBox {
                        id: selectedParityId
                        model: ListModel {
                            id: parityModel
                            ListElement { text: "None" }
                            ListElement { text: "Even" }
                            ListElement { text: "Odd"}
                            ListElement { text: "Mark"}
                            ListElement { text: "Space"}
                        }
                    }
                    ComboBox {
                        id: selectedStopbitId
                        model: ListModel {
                            id: stopbitsModel
                            ListElement { text: "1" }
                            ListElement { text: "1.5" }
                            ListElement { text: "2"}
                        }
                    }
                    ComboBox {
                        id: selectedFlowcontrolId
                        model: ListModel {
                            id: flowcontrolModel
                            ListElement { text: "None" }
                            ListElement { text: "RTS/CTS" }
                            ListElement { text: "XON/XOF"}
                        }
                    }
                }
            }
            Button {
                id: connectionBtn
                width: parent.width
                height: 50
                text: SerialPort.connection ? "Disconnect":"Connect"

                onClicked: {
                    if(!SerialPort.connection){
                        SerialPort.setPortConfig(selectedPortId.currentText, parseInt(selectedBuadRateId.currentText), selectedDatabitId.currentIndex, selectedParityId.currentIndex, selectedStopbitId.currentIndex, selectedFlowcontrolId.currentIndex)
                    }else{
                        SerialPort.disconnect()
                    }
                }
            }
        }

        onRejected: {
            console.log("Closed Configuration")
        }
    }
}
