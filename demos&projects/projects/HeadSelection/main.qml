import QtQuick 2.9
import QtQuick.Window 2.2

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Head Selection")

    Rectangle {
        id:backgroudRect;
        anchors.fill: parent;
        Image {
            anchors.fill: parent;
            source: "qrc:/Penguins.jpg";
        }
    }

    Rectangle { // 头像选择区域
        id:cutPartRect;
        width: 200;
        height: 200;

        Image {
            width:backgroudRect.width;
            height:backgroudRect.height;
            x:-parent.x;
            y:-parent.y;
            clip: true;
            source: "qrc:/Penguins.jpg";
        }

        MouseArea {
            anchors.fill: parent;
            drag.target: parent;

            onDoubleClicked: { // 双击生成选定头像
                cutPartRect.grabToImage(function(result) {
                    result.saveToFile("head.png");
                });
            }
        }
    }

    Rectangle { // 头像选择区域左区域
        id:leftPartRect;
        width: 200;
        height: 200;
        anchors.left: parent.left;
        anchors.right: cutPartRect.left;
        anchors.top:cutPartRect.top;
        anchors.bottom: cutPartRect.bottom;
        opacity: 0.8;
        color: "black";
    }

    Rectangle { // 头像选择区域右区域
        id:rightPartRect;
        anchors.left: cutPartRect.right;
        anchors.right: parent.right;
        anchors.top:cutPartRect.top;
        anchors.bottom: cutPartRect.bottom;
        opacity: 0.8;
        color: "black";
    }

    Rectangle { // 头像选择区域上区域
        id:topPartRect;
        anchors.left: parent.left;
        anchors.right: parent.right;
        anchors.top:parent.top;
        anchors.bottom: cutPartRect.top;
        opacity: 0.8;
        color: "black";
    }

    Rectangle { // 头像选择区域下区域
        id:bottomPartRect;
        anchors.left: parent.left;
        anchors.right: parent.right;
        anchors.top:cutPartRect.bottom;
        anchors.bottom: parent.bottom;
        opacity: 0.8;
        color: "black";
    }

    Component.onCompleted: { // 初始化选头像区域在主窗口中间
        cutPartRect.x = (width - cutPartRect.width)/2;
        cutPartRect.y = (height - cutPartRect.height)/2;
    }
}
