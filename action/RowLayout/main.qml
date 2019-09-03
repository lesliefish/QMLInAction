import QtQuick 2.9
import QtQuick.Window 2.2

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Row Layout Action")

    Rectangle{
        id : rootItem
        anchors.fill: parent
        color : "white"

        Text {
            id : displayText
            anchors.centerIn: parent
            text: "Row Layout Action"
            font.pixelSize: 36
            font.family: "microsoft yahei"
        }

        function setTextColor(c) {
            displayText.color = c
        }

        Row {
            anchors.left: parent.left
            anchors.leftMargin: 10
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 10
            spacing: 10

            ColorPicker {
                color: Qt.rgba(Math.random(), Math.random(), Math.random(), 1)
                onSignalColorPicked: rootItem.setTextColor(clr)
            }

            ColorPicker {
                color: Qt.rgba(Math.random(), Math.random(), Math.random(), 1)
                onSignalColorPicked: rootItem.setTextColor(clr)
            }

            ColorPicker {
                color: Qt.rgba(Math.random(), Math.random(), Math.random(), 1)
                onSignalColorPicked: rootItem.setTextColor(clr)
            }

            ColorPicker {
                color: Qt.rgba(Math.random(), Math.random(), Math.random(), 1)
                onSignalColorPicked: rootItem.setTextColor(clr)
            }

            ColorPicker {
                color: Qt.rgba(Math.random(), Math.random(), Math.random(), 1)
                onSignalColorPicked: rootItem.setTextColor(clr)
            }

            ColorPicker {
                color: Qt.rgba(Math.random(), Math.random(), Math.random(), 1)
                onSignalColorPicked: rootItem.setTextColor(clr)
            }
        }
    }


}
