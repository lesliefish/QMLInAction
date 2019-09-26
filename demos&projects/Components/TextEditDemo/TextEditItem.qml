import QtQuick 2.9

Item {
    id:textEditor
    width: textEditControl.width;
    height: textEditControl.height;
    scale: textEditControl.scale;
    property string text: "";
    property string fontFamily: "microsoft yahei";
    property string fontColor: "lightgreen";
    property int fontPointSize: 48;
    property string itemId:"";
    property string itemType: "text";

    signal signalClicked(string itemId);

    // json
    function toJson(){
        var json = {};
        json['text'] = textEditor.text;
        json['fontFamily'] = textEditor.fontFamily;
        json['fontColor'] = textEditor.fontColor;
        json['fontPointSize'] = textEditor.fontPointSize;
        json['itemId'] = textEditor.itemId;
        json['scale'] = textEditor.scale;
        json['x'] = textEditor.x;
        json['y'] = textEditor.y;
        json['rotate'] = textEditor.rotation;
        json['itemType'] = textEditor.itemType;

        console.log("json:", JSON.stringify(json));
        return json;
    }

    // 设置为选中状态
    function setSelectedState(){
        multiPointTouchArea.enabled = true; // 触摸事件可用
        pinchArea.enabled = true;// 选中时可缩放
        doubleClickDragHandleMouseArea.enabled = true;// 可拖拽
        editControlBorder.visible = true;// 边框可见
        textEditControl.readOnly = true;//只读

        //test
        toJson();
    }

    // 设置为编辑中状态
    function setEditingState(){
        multiPointTouchArea.enabled = true; // 触摸事件可用
        pinchArea.enabled = false;// 编辑时不可缩放
        doubleClickDragHandleMouseArea.enabled = false;// 不可拖拽
        editControlBorder.visible = true;// 可见
        textEditControl.readOnly = false;//能编辑
        textEditControl.forceActiveFocus();
        textEditControlBackground.visible = false; // 去除背景上的鼠标事件，以使文本可选择
    }

    // 设置为展示状态 不显示编辑框 不能编辑 不能拖拽
    function setDisplayState(){
        editControlBorder.visible = false;//不可见
        textEditControl.readOnly = true;//不能编辑
        multiPointTouchArea.enabled = false;
        pinchArea.enabled = false;// 编辑时不可缩放
        doubleClickDragHandleMouseArea.enabled = false;
        textEditControlBackground.visible = true; // 恢复鼠标事件的接收
    }

    TextEdit {
        id:textEditControl;
        anchors.centerIn : parent;
        text: textEditor.text;
        font.family: textEditor.fontFamily;
        color: textEditor.fontColor;
        font.pointSize: textEditor.fontPointSize;
        selectByMouse: true;
        selectedTextColor: "green";
        selectionColor: "lightblue";
        padding: 10;

        Rectangle {
            id:textEditControlBackground
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
                        if(textEditControl.focus){
                            textEditControl.cursorPosition = textEditControl.positionAt(touchPoints[0].x, touchPoints[0].y);
                        }
                    }

                    // 缩放鼠标事件
                    PinchArea{
                        id:pinchArea;
                        anchors.fill: multiPointTouchArea;
                        enabled: false;

                        pinch.target: textEditor;
                        pinch.maximumScale: 20;
                        pinch.minimumScale: 0.4;
                        pinch.minimumRotation: -180;
                        pinch.maximumRotation: 180;

                        onPinchFinished: {
                            console.log("scale:",textEditControl.scale);
                            console.log("x:",textEditControl.x);
                            console.log("y:",textEditControl.y);
                            console.log("width:",textEditControl.width);
                            console.log("height:",textEditControl.height);
                        }


                        // 拖拽 以及双击进入文本编辑事件处理
                        MouseArea {
                            id : doubleClickDragHandleMouseArea;
                            enabled: false;
                            anchors.fill: parent;
                            drag.target: textEditor;
                            drag.axis: Drag.XAndYAxis;

                            // 双击进入编辑模式，以及拖拽功能
                            onDoubleClicked: {
                                textEditor.setEditingState();
                                console.log("double clicked: ", mouseX, mouseY);
                                textEditControl.cursorPosition = textEditControl.positionAt(mouseX, mouseY);
                            }
                        }
                    }
                }


                // 单击后选中Item
                onClicked: {
                    console.log("clicked: ", mouseX, mouseY);
                    textEditor.setSelectedState();
                    //发信号
                    textEditor.signalClicked(textEditor.itemId);
                }
            }
            z:0;
        }


        EditControlBorder{
            id:editControlBorder;
            anchors.fill: textEditControl;
            visible: false;
            z:1
        }

        onTextChanged : {
            textEditControl.text = text;
            textEditor.text = textEditControl.text;
        }
    }

    Component.onCompleted:{
        itemId = new Date().toLocaleString(Qt.locale(), "yyyyMMddhhmmsszzz");
        console.log(itemId);
    }
}
