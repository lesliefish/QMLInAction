import QtQuick 2.9
import QtQuick.Window 2.2

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Grid Layout")

    Rectangle {
        id : rootItem
        anchors.fill: parent
        color : "white"

        Text {
            id: displayText
            text: qsTr("Grid Layout Action")
            anchors.centerIn: parent
            font.pixelSize: 36
            font.family: "microsoft yahei"
            font.bold: true
        }

        function setDisplayColor(c) {
            displayText.color = c
        }

        Grid {
            anchors.left: rootItem.left
            anchors.leftMargin: 10
            anchors.bottom: rootItem.bottom
            anchors.bottomMargin: 10
            rows : 2
            columns: 4
            rowSpacing:10
            columnSpacing: 15

            ColorPicker {
                color: Qt.rgba(Math.random(), Math.random(), Math.random(), 1)
                onSignalColorPicked: rootItem.setDisplayColor(clr)
            }

            ColorPicker {
                color: Qt.rgba(Math.random(), Math.random(), Math.random(), 1)
                onSignalColorPicked: rootItem.setDisplayColor(clr)
            }

            ColorPicker {
                color: Qt.rgba(Math.random(), Math.random(), Math.random(), 1)
                onSignalColorPicked: rootItem.setDisplayColor(clr)
            }

            ColorPicker {
                color: Qt.rgba(Math.random(), Math.random(), Math.random(), 1)
                onSignalColorPicked: rootItem.setDisplayColor(clr)
            }

            ColorPicker {
                color: Qt.rgba(Math.random(), Math.random(), Math.random(), 1)
                onSignalColorPicked: rootItem.setDisplayColor(clr)
            }

            ColorPicker {
                color: Qt.rgba(Math.random(), Math.random(), Math.random(), 1)
                onSignalColorPicked: rootItem.setDisplayColor(clr)
            }

            ColorPicker {
                color: Qt.rgba(Math.random(), Math.random(), Math.random(), 1)
                onSignalColorPicked: rootItem.setDisplayColor(clr)
            }
        }
    }
}
