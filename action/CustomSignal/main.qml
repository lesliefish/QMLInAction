import QtQuick 2.9
import QtQuick.Window 2.2

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Custom Signal")

    Rectangle {
        anchors.fill: parent
        color: "#c0c0c0"

        Text {
            id : colorText
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top : parent.top
            anchors.topMargin: 10
            font.pixelSize: 24
            text : "custom signal"
        }

        Component {
            id : colorComponet
            Rectangle {
                id : colorPicker
                width: 200
                height: 60
                signal colorPicked(color c)

                MouseArea {
                    anchors.fill: parent
                    onPressed: colorPicker.colorPicked(colorPicker.color)
                }
            }
        }

        Loader {
            id:redLoader
            anchors.left: parent.left
            anchors.leftMargin: 8
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 8
            sourceComponent: colorComponet
            onLoaded: {
                item.color = "red"
            }
        }

        Loader {
            id:blueLoader
            anchors.left: redLoader.right
            anchors.leftMargin: 8
            anchors.bottom: redLoader.bottom
            sourceComponent: colorComponet
            onLoaded: {
                item.color = "blue"
            }
        }

        Connections {
            target: redLoader.item
            onColorPicked:{
                colorText.color = c
            }
        }

        Connections {
            target: blueLoader.item
            onColorPicked:{
                colorText.color = c
            }
        }
    }
}
