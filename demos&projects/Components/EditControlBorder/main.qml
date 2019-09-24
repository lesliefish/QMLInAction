import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Controls 1.4

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("EditControlBorder");
    color: "black"

    TextEdit {
        id:textControl
        scale: parent.scale;
        anchors.centerIn: parent
        text: "千言万语只能无语";
        font.family: "STCaiyun";
        color: "lightyellow";
        font.pointSize: 36;
        selectByMouse: true;
        selectedTextColor: "green";
        selectionColor: "lightblue";
        padding: 10;

        Rectangle {
            anchors.fill: parent;
            color: "transparent";

            MouseArea {
                id:mouseArea;
                anchors.fill: parent;
                MultiPointTouchArea {
                    id:multiPointTouchArea
                    //anchors.fill: parent;
                    mouseEnabled: false;
                    touchPoints: [
                        TouchPoint {
                            id: point1;
                        }
                    ]

                    onPressed: {
                        console.log("touch pressed: ", touchPoints[0].x, touchPoints[0].y);
                        textControl.cursorPosition = textControl.positionAt(touchPoints[0].x, touchPoints[0].y);
                    }

                    PinchArea{
                        anchors.fill: parent;
                        pinch.target: textControl;
                        pinch.maximumScale: 20;
                        pinch.minimumScale: 0.2;
                        pinch.minimumRotation: -180;
                        pinch.maximumRotation: 180;

                        onPinchStarted: {
                            editControlBorder.visible = true;
                        }

                        onPinchFinished: {
                            //editControlBorder.visible = false;
                        }
                    }
                }


                onDoubleClicked: {
                    console.log("double clicked: ", mouseX, mouseY);
                    textControl.cursorPosition = textControl.positionAt(mouseX, mouseY);
                    textControl.forceActiveFocus();
                    textControl.readOnly = false;
                    multiPointTouchArea.anchors.fill = mouseArea;
                }

                onClicked: {
                    editControlBorder.visible = true;
                    textControl.readOnly = true;
                    console.log("clicked: ", mouseX, mouseY);
                    multiPointTouchArea.anchors.fill = undefined;
                }

                drag.target: textControl;
                drag.axis: Drag.XAndYAxis;
                drag.minimumX: 0
                drag.maximumX: 1024
            }
            z:-2;
        }



        EditControlBorder{
            id:editControlBorder;
            anchors.fill: textControl;
            visible: false;
            z:-1
        }
    }
}
