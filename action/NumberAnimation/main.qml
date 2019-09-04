import QtQuick 2.9
import QtQuick.Window 2.2

Window {
    visible: true
    width: 360
    height: 240
    title: qsTr("Number Animation")

    Rectangle {
        anchors.fill: parent
        id : rootItem

        Rectangle {
            id : rect
            color: "blue"
            width: 50
            height: 50
            x:0
            y:rootItem.height/2-rect.height/2


            MouseArea {
                id:mouseArea
                anchors.fill: rect
                onClicked: {
                    animationX.start()
                    animationRotation.start()
                    animationRadius.start()
                    colorAnimation.start()
                }
            }


            NumberAnimation {
                id:animationX
                target: rect
                property: "x"
                to : rootItem.width - rect.width
                duration: 3000
                easing.type: Easing.InOutQuad
            }

            NumberAnimation {
                id:animationRotation
                target: rect
                property: "rotation"
                to : 1000
                duration: 3000
                running: false
                easing.type: Easing.InOutQuad
            }


            NumberAnimation {
                id: animationRadius
                target: rect
                property: "radius"
                to : 25
                duration: 3000
                running: false
                easing.type: Easing.InOutQuad
            }


            ColorAnimation {
                id:colorAnimation
                target: rect
                property: "color"
                from: "blue"
                to: "green"
                duration: 3000
            }
        }
    }
}
