import QtQuick 2.9
import QtQuick.Window 2.2

Window {
    visible: true
    width:  500
    height: 300
    title: qsTr("Anchors Layout")

    Rectangle {
        id:rect1;
        anchors.left: parent.left;
        anchors.leftMargin: 20;
        anchors.top:parent.top;
        anchors.topMargin: 20;
        width: 200;
        height: 200;
        gradient: Gradient {
            GradientStop {position: 0.0; color: "#202020"}
            GradientStop {position: 1.0; color: "#A0A0A0"}
        }
        z:1
    }

    // 相对rect1布局
    Rectangle {
        id:rect2;
        anchors.left: rect1.right; // rect1e右边为基准
        anchors.leftMargin: 20;
        anchors.top:rect1.top;

        width: 200
        height:200
        rotation: 90
        gradient: Gradient {
            GradientStop {position: 0.0; color: "#202020"}
            GradientStop {position: 1.0; color: "#A0A0A0"}
        }
        z:1

        // anchors.centerIn 放中间
        Rectangle {
            color: "lightgreen"
            width: 50
            height: 50
            anchors.centerIn: parent
        }
    }

    // anchors.fill 填充
    Rectangle {
        color: "lightblue"
        anchors.fill: parent
        border.width: 5
        border.color: "red"
        z:0
    }
}
