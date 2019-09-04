import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Controls 1.4

Window {
    objectName: "mainWindow"
    visible: true
    width: 640
    height: 480
    title: qsTr("C++ Call QML")

    Text {
        objectName: "textLabel"
        text: "c++ call qml"
        anchors.centerIn: parent
        font.pixelSize: 30
    }

    Button {
        anchors.right: parent.right
        anchors.rightMargin: 4
        anchors.bottom : parent.bottom
        anchors.bottomMargin: 4
        objectName: "quitButton"
    }
}
