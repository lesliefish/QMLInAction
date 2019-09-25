import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Controls 1.4

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("EditControlBorder");
    color: "black"

    MouseArea {
        anchors.fill: parent;
        onClicked: {
            textControl.setDisplayState();
        }
    }

    TextEdit {
        id:textControl
        scale: parent.scale;
        x: (parent.width - width) / 2;
        y: (parent.height - height) / 2;
        text: "杭州欢迎你";
        font.family: "STXingkai";
        color: "lightgreen";
        font.pointSize: 72;
        selectByMouse: true;
        selectedTextColor: "green";
        selectionColor: "lightblue";
        padding: 10;

        // 设置为选中状态
        function setSelectedState(){
            multiPointTouchArea.enabled = true; // 触摸事件可用
            pinchArea.enabled = true;// 选中时可缩放
            doubleClickDragHandleMouseArea.enabled = true;// 可拖拽
            editControlBorder.visible = true;// 边框可见
            textControl.readOnly = true;//只读
        }

        // 设置为编辑中状态
        function setEditingState(){
            multiPointTouchArea.enabled = true; // 触摸事件可用
            pinchArea.enabled = false;// 编辑时不可缩放
            doubleClickDragHandleMouseArea.enabled = false;// 不可拖拽
            editControlBorder.visible = true;// 可见
            textControl.readOnly = false;//能编辑
            textControl.forceActiveFocus();
            textControlBackground.visible = false; // 去除背景上的鼠标事件，以使文本可选择
        }


        // 设置为展示状态 不显示编辑框 不能编辑 不能拖拽
        function setDisplayState(){
            editControlBorder.visible = false;//不可见
            textControl.readOnly = true;//不能编辑
            multiPointTouchArea.enabled = false;
            pinchArea.enabled = false;// 编辑时不可缩放
            doubleClickDragHandleMouseArea.enabled = false;
            textControlBackground.visible = true; // 恢复鼠标事件的接收
        }

        Rectangle {
            id:textControlBackground
            anchors.fill: parent;
            color: "transparent";

            // 这个鼠标区域接收单击事件
            MouseArea {
                id:mouseArea;
                anchors.fill: parent;

                // 单击之后multiPointTouchArea触摸事件覆盖mouseArea鼠标区域
                MultiPointTouchArea {
                    id:multiPointTouchArea;
                    anchors.fill: parent;
                    enabled: false;
                    onPressed: {
                        console.log("touch pressed: ", touchPoints[0].x, touchPoints[0].y);
                        if(textControl.focus){
                            textControl.cursorPosition = textControl.positionAt(touchPoints[0].x, touchPoints[0].y);
                        }
                    }

                    // 缩放鼠标事件
                    PinchArea{
                        id:pinchArea;
                        anchors.fill: multiPointTouchArea;
                        enabled: false;

                        pinch.target: textControl;
                        pinch.maximumScale: 20;
                        pinch.minimumScale: 0.4;
                        pinch.minimumRotation: -180;
                        pinch.maximumRotation: 180;

                        onPinchFinished: {
                            console.log("scale:",textControl.scale);
                            console.log("x:",textControl.x);
                            console.log("y:",textControl.y);
                            console.log("width:",textControl.width);
                            console.log("height:",textControl.height);
                        }


                        // 拖拽 以及双击进入文本编辑事件处理
                        MouseArea {
                            id : doubleClickDragHandleMouseArea;
                            enabled: false;
                            anchors.fill: parent;
                            drag.target: textControl;
                            drag.axis: Drag.XAndYAxis;

                            // 双击进入编辑模式，以及拖拽功能
                            onDoubleClicked: {
                                textControl.setEditingState();
                                console.log("double clicked: ", mouseX, mouseY);
                                textControl.cursorPosition = textControl.positionAt(mouseX, mouseY);
                            }
                        }
                    }
                }


                // 单击后选中Item
                onClicked: {
                    console.log("clicked: ", mouseX, mouseY);
                    textControl.setSelectedState();
                }
            }
            z:0;
        }


        EditControlBorder{
            id:editControlBorder;
            anchors.fill: textControl;
            visible: false;
            z:1
        }

        Connections {
            target: editControlBorder;
            onSignalRightDownDraged:{
                //console.log("draged: ", x, y);
                //textControl.width+=x;
                //textControl.height+=y;
            }
        }
    }
}
