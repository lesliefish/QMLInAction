import QtQuick 2.9
import QtQuick.Window 2.2

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello Qt Quick App")

    MouseArea{
        anchors.fill: parent
        onClicked: {
            Qt.quit()
        }
    }

    Text {
        id: text
        text: qsTr("Hello Qt Quick App")
        anchors.centerIn: parent
    }
}
