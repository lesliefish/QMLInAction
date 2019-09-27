import QtQuick 2.0
import QtQuick.Controls.Styles 1.4
import QtQuick.Controls 1.4
import QtGraphicalEffects 1.0

Item {
    id:wrapper;

    Rectangle {
        id:itemRect;
        color:"transparent";
        border.width: 0;
        //border.color: "green";
        width: gridView.cellWidth;
        height: gridView.cellHeight;

        Rectangle {
            id:contentItem;
            color: "black";
            anchors.top:parent.top;
            anchors.topMargin: parent.height*1/20;
            border.color: "#910000";
            border.width: 0;
            width: parent.width;
            radius: 16;
            height: parent.height-2*parent.height*1/20;

            MouseArea {
                anchors.fill: parent;
                onClicked: {
                    wrapper.GridView.view.currentIndex = index;
                }
            }

            // 图片位置
            Image {
                id:imageItem;
                source: imagePath;
                width: itemRect.width;
                height: itemRect.height;
                anchors.fill: parent;
                anchors.horizontalCenter: parent.horizontalCenter;
                visible: false;

                Rectangle {
                    id:bottomRect;
                    width: imageItem.width;
                    height: imageItem.height/5;
                    color: wrapper.GridView.isCurrentItem ? contentItem.border.color : "#333333";
                    anchors.bottom: parent.bottom;
                    anchors.left: parent.left;
                    opacity: wrapper.GridView.isCurrentItem ? 1 : 0.8;
                    border.color: "transparent";

                    Text {
                        id : textItem;
                        width: parent.width;
                        height: parent.height
                        anchors.left:bottomRect.left;
                        anchors.leftMargin: 20;
                        anchors.topMargin: parent.height*1/20;
                        text: name + "_" + (index + 1);
                        color: "white";
                        font.family: "microsoft yahei";
                        font.bold: true;
                        horizontalAlignment: Text.AlignLeft;
                        verticalAlignment:  Text.AlignVCenter;
                        font.pixelSize: 18;
                    }
                }
            }

            // 图像切割圆角矩形
            Rectangle {
                id:mask;
                anchors.fill: parent;
                radius: parent.radius;
                color: parent.border.color;
                border.width: 0;
                border.color: "transparent";
            }

            // 切割
            OpacityMask {
                anchors.fill: imageItem;
                source: imageItem;
                maskSource: mask;
            }


            // 选中时的边框
            Rectangle {
                anchors.fill: parent;
                color: "transparent";
                border.color: contentItem.border.color;
                border.width: 3;
                visible: wrapper.GridView.isCurrentItem;
                radius: contentItem.radius;
            }

            // 删除按钮
            Rectangle{
                height: bottomRect.height/2;
                width: height;
                anchors.right: parent.right;
                anchors.rightMargin: 20;
                anchors.bottom:parent.bottom;
                anchors.bottomMargin: height/2;
                color: "green";
                radius: width/2;

                MouseArea {
                    anchors.fill: parent;
                    onClicked: {
                        console.log("delete ", index);
                        gridView.model.remove(index); // 删除操作
                    }
                }
            }
        }
    }

}
