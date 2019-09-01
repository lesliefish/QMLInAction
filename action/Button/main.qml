import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4

Window {
    visible: true
    width: 300
    height: 200
    title: qsTr("Button Action")

    Rectangle {
        anchors.fill: parent
        color: "lightyellow"

        Button {
            id:button
            anchors.centerIn: parent
            checkable: true

            Text {
                text: qsTr("Close App")
                anchors.centerIn : parent
                color: "white"
                font.family: "microsoft yahei"
                font.pixelSize: 16
                font.bold: true
            }

            onClicked: {
                Qt.quit()
            }

            style: ButtonStyle {
                   background: Rectangle {
                       implicitWidth: 180
                       implicitHeight: 36
                       border.width: 1
                       border.color: "black"
                       radius: 5

                       gradient: Gradient {
                           GradientStop { position: 0 ; color: control.pressed ? "#cccccc" : "#334488" }
                           GradientStop { position: 1 ; color: control.pressed ? "#aaa" : "#ccc" }
                       }
                   }
               }
        }
    }
}
