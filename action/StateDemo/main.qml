import QtQuick 2.9
import QtQuick.Window 2.2

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("State")
    id:rootItem

    Text {
        id: centerText
        text: qsTr("A Single Text.")
        anchors.centerIn: parent
        font.pixelSize: 24
        font.family: "microsoft yahei"

        MouseArea {
            id : mouseArea
            anchors.fill: centerText
            onReleased: {
                centerText.state = "redText"
            }
        }

        states: [
            State {
                name: "redText"
                changes : [
                    PropertyChanges {
                        target: centerText
                        color : "red"
                    }
                ]
            },

            State {
                name: "blueText"
                when:mouseArea.pressed
                PropertyChanges {
                    target: centerText;color:"blue";font.bold: true;font.pixelSize: 36;
                }
            }
        ]

        state: "redText"

        transitions: Transition {
            from: "redText"
            to: "blueText"

            PropertyAnimation{
                target: centerText
                properties: "color,font.pixelSize"
                duration: 100
            }
        }
    }
}
