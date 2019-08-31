import QtQuick 2.9
import QtQuick.Window 2.2

Window {
    visible: true
    width: 260
    height: 100
    title: qsTr("Rectangles Action")


    // 颜色设置
    Rectangle {
        id:colorRectangle
        width: 100
        height: 100
        color: "red"

        MouseArea {
            anchors.fill: colorRectangle

            onClicked: { // 单击
                colorRectangle.color = "#00AA00"
                console.log(colorRectangle.color.r, colorRectangle.color.g, colorRectangle.color.b, colorRectangle.color.a)
            }

            onDoubleClicked: { // 双击
                colorRectangle.color = "#800000B0"
                console.log(colorRectangle.color.r, colorRectangle.color.g, colorRectangle.color.b, colorRectangle.color.a)
            }

            onPressed: { //按压事件
                colorRectangle.color = Qt.rgba(0.8, 0.6, 0.4, 1.0)
                console.log(colorRectangle.color.r, colorRectangle.color.g, colorRectangle.color.b, colorRectangle.color.a)
            }
        }

        Text {
            text: "Color Set Test"
            color: "white"
            anchors.centerIn: parent
        }

        Component.onCompleted: console.log(color.r, color.g, color.b, color.a) // 打印值
    }


    // 渐变色设置
    Rectangle {
        id:gradientRectangle
        x:140
        width: 100
        height: 100
        gradient: Gradient {
            GradientStop {
                position: 0.0;
                color:"#202020";
            }
            GradientStop {
                position: 0.33;
                color:"blue";
            }
            GradientStop {
                position: 1.0;
                color:"#FFFFFF";
            }
        }

        Text {
            text: "Gradient Set Action"
            color: "white"
            anchors.centerIn: parent
        }
    }
}
