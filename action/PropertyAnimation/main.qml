import QtQuick 2.9
import QtQuick.Window 2.2

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Property Anomation")

    Rectangle {
        id : rootItem
        anchors.fill: parent

        Rectangle {
            id : rect
            width: 50
            height: 120
            anchors.centerIn: parent
            color: "blue"
            property var animation;

            PropertyAnimation {
                id : toRect
                target: rect
                properties : "width"
                to:50
                duration: 1000
                onStarted: {
                    rect.animation=toRect
                    rect.color="red"
                }

                onStopped: {
                    rect.color="blue"
                }
            }

            PropertyAnimation {
                id : toSquare
                target: rect
                properties : "width"
                to:150
                duration: 1000
                onStarted: {
                    rect.animation=toSquare
                    rect.color="red"
                }

                onStopped: {
                    rect.color="blue"
                }
            }

            MouseArea {
                anchors.fill: rect
                onClicked : {
                    if(rect.animation === toRect || rect.animation === undefined){
                        toSquare.start()
                    }
                    else {
                        toRect.start()
                    }
                }
            }
        }
    }
}
