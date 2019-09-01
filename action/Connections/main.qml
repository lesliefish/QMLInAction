import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Controls 1.4

Window {
    visible: true
    title: qsTr("Connections")
    width: 300
    height: 130

    Rectangle {
        id :rect
        anchors.fill: parent
        color : "lightgrey"

        Text {
            id:text1
            anchors.horizontalCenter : parent.horizontalCenter
            anchors.top:parent.top
            text: "Text One"
            color: "blue"
            font.pixelSize: 28
            font.family: "microsoft yahei"
        }

        Text {
            id:text2
            anchors.horizontalCenter : rect.horizontalCenter
            anchors.top: text1.bottom
            anchors.topMargin: 10
            text: "Text Two"
            color: "blue"
            font.pixelSize: 28
            font.family: "microsoft yahei"
        }

        Button {
            id : changButton
            anchors.top:text2.bottom
            anchors.horizontalCenter: rect.horizontalCenter
            anchors.topMargin: 10
            text: "Change"
        }

        Connections {
            target: changButton
            onClicked : {
                text1.color = Qt.rgba(Math.random(),Math.random(),Math.random(),1)
                text2.color = Qt.rgba(Math.random(),Math.random(),Math.random(),1)
            }
        }
    }
}
