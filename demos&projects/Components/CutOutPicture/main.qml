import QtQuick 2.9
import QtQuick.Window 2.3
import QtQuick.Controls 1.2
import QtQuick.Controls.Styles 1.2
import QtQuick.Dialogs 1.1

Window {
    id:mainWindow
    visible: true ;
    width: 800;
    height: 600;
    minimumHeight: 320;
    minimumWidth: 480;
    color: "black";
    onWidthChanged: mask.requestPaint();
    onHeightChanged: mask.requestPaint();

    Image {
        id: imageItem;
        anchors.fill: parent;
        fillMode: Image.PreserveAspectFit;
        visible: false;
        asynchronous: true;
        source:"file:///C:/Users/Public/Pictures/Sample Pictures/Chrysanthemum.jpg";

        onStatusChanged: {
            if(imageItem.status === Image.Ready){
                mask.requestPaint();
            }
        }
    }

    // 打开文件对话框
    FileDialog {
        id: fileDialog;
        title: "Please choose an Image File";
        nameFilters: ["Image Files (*.jpg *.png *.gif)"];
        onAccepted: {
            imageItem.source = fileDialog.fileUrl;
            forSaveCanvas.setImageData(mask.getImageData());
            console.log(fileDialog.fileUrl);
            mask.requestPaint();
        }
    }

    // 截图区域图像绘制，将要截取的图片传到这里，由其生成图片
    Canvas {
        id: forSaveCanvas;
        width: controlBorder.width;
        height: controlBorder.height;
        visible: false;
        anchors.top: parent.top;
        anchors.right: parent.right;
        property var imageData: null;
        onPaint: {
            if(imageData == null){
                return;
            }
            var ctx = getContext("2d");
            ctx.clearRect(0, 0, width, height); // 清空
            ctx.drawImage(imageData, 0, 0);
        }

        function setImageData(data) {
            imageData = data;
            forSaveCanvas.requestPaint();
        }
    }

    // 图片底层铺衬
    Canvas {
        id: mask;
        anchors.centerIn: parent;
        width: mainWindow.width;
        height: mainWindow.height;
        z: 1;

        function getImageData(){
            return context.getImageData(controlBorder.x, controlBorder.y, controlBorder.width, controlBorder.height);
        }

        onPaint: {
            if(imageItem.source == null){
                return;
            }

            var ctx = getContext("2d");
            ctx.clearRect(0, 0, width, height); // 清空
            ctx.drawImage(imageItem, 0, 0, width, height);
            ctx.save();
        }

        // 蒙版做出Cover覆盖效果，半透明黑框
        Component {
            id:coverRectMask;
            Rectangle {
                color: "black";
                opacity: 0.7;
            }
        }

        // 左蒙版
        Loader{
            id:leftMasking;
            sourceComponent: coverRectMask;
            onLoaded: {
                anchors.left=parent.left;
                anchors.right=controlBorder.left;
                anchors.top=parent.top;
                anchors.bottom= parent.bottom;
            }
        }

        // 右蒙版
        Loader{
            id:rightMasking;
            sourceComponent: coverRectMask;
            onLoaded: {
                anchors.left=controlBorder.right;
                anchors.right=parent.right;
                anchors.top=parent.top;
                anchors.bottom=parent.bottom;
            }
        }

        // 上蒙版
        Loader{
            id:topMasking;
            sourceComponent: coverRectMask;
            onLoaded: {
                anchors.left=controlBorder.left;
                anchors.right=controlBorder.right;
                anchors.top=parent.top;
                anchors.bottom=controlBorder.top;
            }
        }

        // 下蒙版
        Loader{
            id:bottomMasking;
            sourceComponent: coverRectMask;
            onLoaded: {
                anchors.left=controlBorder.left;
                anchors.right=controlBorder.right;
                anchors.top=controlBorder.bottom;
                anchors.bottom=parent.bottom;
            }
        }

        // 截图区域虚线框
        ControlBorder {
            id:controlBorder;
            width: 300;
            height: 120;
            opacity: 1;

            // 位置更改需要重绘forSaveCanvas
            onXChanged: {
                console.log("XChanged");
                forSaveCanvas.setImageData(mask.getImageData());
                mask.requestPaint();
            }


            // 保存按钮
            Text {
                id: saveText;
                text: qsTr("Save The Area");
                color: "white";
                font.family: "microsoft yahei";
                font.pointSize: 16;

                anchors.top: controlBorder.bottom;
                anchors.topMargin: 20;
                anchors.right: controlBorder.right;

                MouseArea {
                    anchors.fill: parent;
                    onClicked: {
                        forSaveCanvas.save("myPic.png"); // 保存位置
                    }
                    onPressed: {
                        saveText.color = "green";
                    }
                    onReleased: {
                        saveText.color = "white";
                    }
                }
            }

            // 拖拽事件
            MouseArea {
                anchors.fill: parent;
                anchors.margins: 10;
                drag.target:controlBorder;
                drag.minimumX: 0;
                drag.maximumX: mask.width - controlBorder.width;
                drag.minimumY: 0;
                drag.maximumY: mask.height - controlBorder.height;

                // 双击选择一张图片
                onDoubleClicked: {
                    fileDialog.open();
                }
            }
        }

        // 启动时将截图区域加载到中间位置
        Component.onCompleted: {
            controlBorder.x = (mask.width-controlBorder.width)/2;
            controlBorder.y = (mask.height-controlBorder.height)/2;
        }
    }

    Connections {
        target: controlBorder;
        onSignalItemDraged:{
            console.log("onItemDraged", x, y);
            console.log("forSaveCanvas size:", forSaveCanvas.width, forSaveCanvas.height);
            forSaveCanvas.setImageData(mask.getImageData());
            mask.requestPaint();
        }
    }
}
