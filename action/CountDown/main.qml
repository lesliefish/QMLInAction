import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Controls 1.4

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Count Down")

    Rectangle {
        anchors.fill: parent
        color: "black"
        QtObject {
            id : attrs
            property int counter;
            Component.onCompleted: {
                attrs.counter = 100
            }
        }

        Text {
            id : countShowText
            anchors.centerIn: parent
            color: "white"
            font.pixelSize: 36
        }

        Timer {
            id : counterTimer
            interval: 1000
            repeat: true
            triggeredOnStart: true
            onTriggered: {
                countShowText.text = attrs.counter
                attrs.counter-=1
                if(attrs.counter < 0) {
                    counterTimer.stop()
                    countShowText.text = "Game Over"
                }
            }
        }

        Button {
            id : startButton
            anchors.top : countShowText.bottom
            anchors.topMargin: 20
            anchors.horizontalCenter: countShowText.horizontalCenter
            text: "start"
            onClicked: {
                attrs.counter = 10
                counterTimer.start()
            }
        }
    }
}
