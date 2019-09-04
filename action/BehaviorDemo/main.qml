import QtQuick 2.9
import QtQuick.Window 2.2

Window {
    id:rootItem
    visible: true
    width: 640
    height: 480
    color : "black"
    title: qsTr("Behavior")

    Rectangle {
        width: parent.width/3
        height: parent.height/3
        anchors.centerIn: parent
        color: "pink"

        Behavior on width {
            NumberAnimation {
                duration: 500
                easing.type: Easing.InOutCirc
            }
        }

        Behavior on height {
            NumberAnimation {
                duration: 1100
                easing.type: Easing.InOutCirc
            }
        }

        Behavior on color {
            NumberAnimation {
                duration: 2000
            }
        }
    }
}
