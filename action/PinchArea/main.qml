import QtQuick 2.9
import QtQuick.Window 2.2

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("PinchArea")

    Rectangle {
        anchors.fill: parent
        color: "black"

        Rectangle {
            id : rectItem
            width: 100
            height: 100
            anchors.centerIn: parent
            color: "red"

            Text {
                text : "here is the text"
                anchors.centerIn : parent
            }
        }

        PinchArea {
            anchors.fill: parent
            pinch.target: rectItem
            pinch.maximumScale: 20
            pinch.minimumScale: 0.2
            pinch.minimumRotation: -180
            pinch.maximumRotation: 180

        }
    }
}
