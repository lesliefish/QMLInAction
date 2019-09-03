import QtQuick 2.9
import QtQuick.Window 2.2

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("TextInput")

    Rectangle {
        anchors.fill: parent
        color : "black"

        TextInput {
            id : myTextInput
            text: "我的天哪"
            anchors.centerIn: parent
            color: "white"
            font.family: "microsoft yahei"
            font.pointSize: 24
            horizontalAlignment: TextEdit.AlignRight
            verticalAlignment: TextEdit.BottomRight
            wrapMode: TextEdit.WrapAtWordBoundaryOrAnywhere

            cursorDelegate: customComponent

            Keys.enabled: true
            Keys.onEscapePressed : {
                console.log(myTextInput.x + " " + myTextInput.y)
                console.log(myTextInput.width + " " + myTextInput.height)
                console.log(myTextInput.text)
                myTextInput.insert(myTextInput.cursorPosition, "\n")
            }


            Rectangle {
                id : topRect
                color: "white"
                radius:1
                x: 0
                y: -1
                width: myTextInput.width+1
                height: 1
            }

            Rectangle {
                id : bottomRect
                color: "white"
                radius: 1
                x: 0
                y: myTextInput.height + 1
                width: myTextInput.width+1
                height: 1
            }

            Rectangle {
                id : leftRect
                color: "white"
                x: -1
                y: 0
                radius: 1
                width: 1
                height: myTextInput.height + 1
            }

            Rectangle {
                id : rightRect
                x: myTextInput.width + 1
                y: 0
                radius: 1
                width: 1
                height: myTextInput.height+1
                color:"white"
            }

            PinchArea {
                anchors.fill: myTextInput
                pinch.target: myTextInput
                pinch.minimumScale : 0.4
                pinch.maximumScale : 40
                pinch.minimumRotation : -180
                pinch.maximumRotation : 180
            }

            Component {
                id : customComponent
                Rectangle {
                    id:customComponentInnerRect
                    width: 2
                    radius:12
                    gradient: Gradient {
                              GradientStop { position: 0.0; color: "lightsteelblue" }
                              GradientStop { position: 1.0; color: "blue" }
                    }

                    // 光标闪烁计时器
                    Timer {
                        interval: 600
                        repeat: true
                        running: true
                        onTriggered: {
                            customComponentInnerRect.visible = !customComponentInnerRect.visible
                        }
                    }
                }
            }
        }
    }
}
