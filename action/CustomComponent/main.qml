import QtQuick 2.9
import QtQuick.Window 2.2

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Custom Component")

    Rectangle {
        anchors.fill: parent
        color : "#EEEEEE"

        Text {
            id: coloredText
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.top
            anchors.topMargin: 10
            text: qsTr("Here is the text")
            font.pixelSize: 30
            font.family: "microsoft yahei"
        }

        function setTextColor(clr) {
            coloredText.color = clr
        }

        ColorPicker {
            id : redColor
            color : "red"
            focus : true
            anchors.left: parent.left
            anchors.leftMargin: 20
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 20

            KeyNavigation.right: blueColor
            KeyNavigation.tab: blueColor
            onColorPicked: {
                coloredText.color = clr
            }
        }

        ColorPicker {
            id : blueColor
            color : "blue"
            focus : false
            anchors.left: redColor.right
            anchors.leftMargin: 20
            anchors.bottom: redColor.bottom

            KeyNavigation.left: redColor
            KeyNavigation.right: pinkColor
            KeyNavigation.tab: pinkColor
            onColorPicked: {
                coloredText.color = clr
            }
        }

        ColorPicker {
            id : pinkColor
            color : "pink"
            focus : false
            anchors.left: blueColor.right
            anchors.leftMargin: 20
            anchors.bottom: blueColor.bottom

            KeyNavigation.left: blueColor
            KeyNavigation.tab: redColor
            onColorPicked: {
                coloredText.color = clr
            }
        }

    }

}
