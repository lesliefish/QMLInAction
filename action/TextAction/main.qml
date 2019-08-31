import QtQuick 2.9
import QtQuick.Window 2.2

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Text Action")

    Rectangle {
        anchors.fill: parent

        Text {
            id: normal
            text: qsTr("Normal text")

            anchors.left: parent.left
            anchors.leftMargin: 20
            anchors.top:parent.top
            anchors.topMargin: 20
            font.pointSize: 24
            font.family: "microsoft yahei ui"
        }

        Text {
            id: raised
            text: qsTr("Raised text")

            anchors.left: normal.left
            anchors.top:normal.bottom
            anchors.topMargin: 20
            font.pointSize: 24
            font.family: "microsoft yahei ui"

            style: Text.Raised
            styleColor: "red"
        }


        Text {
            id: outline
            text: qsTr("Outline text")

            anchors.left: normal.left
            anchors.top:raised.bottom
            anchors.topMargin: 20
            font.pointSize: 24
            font.family: "microsoft yahei ui"

            style: Text.Outline
            styleColor: "yellow"
        }

        Text {
            id: sunken
            text: qsTr("Sunken text")

            anchors.left: normal.left
            anchors.top: outline.bottom
            anchors.topMargin: 20
            font.pointSize: 24
            font.family: "microsoft yahei ui"

            style: Text.Sunken
            styleColor: "yellow"
        }
    }
}
