import QtQuick 2.9
import QtQuick.Controls 2.2

Popup {
    id:popup;
    width: parent.width;
    height: 120;
    topMargin: 0;
    y:100;

    background: Rectangle{
        color: "transparent";
        radius: 8;
    }

    function printColor(strColor){
        console.log("color is " + strColor);
        rect.curColor = strColor;
    }

    Component.onCompleted: {
        rect.signalColorSelect.connect(printColor);
    }

    Popup {
        id:circleRect;
        width: 100;
        height: 100;
        background:Rectangle{color:"green"}
        y:rect.y - height - 10;
        x:rect.x + rect.width-width;
        visible: rect.curColor === "circle";
    }

    Rectangle {
        id:rect;
        anchors.fill: parent;
        color: "grey";
        radius: 8;

        signal signalColorSelect(string strColor);

        property string curColor: "#ffffff";
        Row {

            Rectangle{
                id:btn1;
                width: rect.width/7;
                height: rect.height;
                color:"transparent";

                Rectangle {
                    color: "#FFFFFF";
                    anchors.centerIn: parent;
                    width: parent.width;
                    height:width;
                    radius: width/2;
                    border.color:rect.color;
                    border.width:rect.curColor === String(color)?width/5:width/3;

                    MouseArea {
                        anchors.fill: parent;
                        onClicked: rect.signalColorSelect(String(parent.color));
                    }
                }
            }
            Rectangle{
                id:btn2;
                width: rect.width/7;
                height: rect.height;
                color:"transparent";

                Rectangle {
                    color: "#000000";
                    anchors.centerIn: parent;
                    width: parent.width;
                    height:width;
                    radius: width/2;
                    border.color:rect.color;
                    border.width:rect.curColor === String(color)?width/5:width/3;

                    MouseArea {
                        anchors.fill: parent;
                        onClicked: rect.signalColorSelect(String(parent.color));
                    }
                }
            }

            Rectangle{
                id:btn3;
                width: rect.width/7;
                height: rect.height;
                color:"transparent";

                Rectangle {
                    color: "#eead0e";
                    anchors.centerIn: parent;
                    width: parent.width;
                    height:width;
                    radius: width/2;
                    border.color: rect.color;
                    border.width:(rect.curColor === String(color))?width/5:width/3;

                    MouseArea {
                        anchors.fill: parent;
                        onClicked: rect.signalColorSelect(String(parent.color));
                    }
                }
            }
            Rectangle{
                id:btn4;
                width: rect.width/7;
                height: rect.height;
                color:"transparent";

                Rectangle {
                    color: "#7FFFD4";
                    anchors.centerIn: parent;
                    width: parent.width;
                    height:width;
                    radius: width/2;
                    border.color: rect.color;
                    border.width:rect.curColor === String(color)?width/5:width/3;
                    MouseArea {
                        anchors.fill: parent;
                        onClicked: rect.signalColorSelect(String(parent.color));
                    }
                }
            }

            Rectangle{
                id:btn5;
                width: rect.width/7;
                height: rect.height;
                color:"transparent";
                Rectangle {
                    color: "#4F94CD";
                    anchors.centerIn: parent;
                    width: parent.width;
                    height:width;
                    radius: width/2;
                    border.color: rect.color;
                    border.width:rect.curColor === String(color)?width/5:width/3;
                    MouseArea {
                        anchors.fill: parent;
                        onClicked: rect.signalColorSelect(String(parent.color));
                    }
                }
            }

            Rectangle{
                id:btn6;
                width: rect.width/7;
                height: rect.height;
                color:"transparent";

                Rectangle {
                    color: "#FF0000";
                    anchors.centerIn: parent;
                    width: parent.width;
                    height:width;
                    radius: width/2;
                    border.color: rect.color;
                    border.width:rect.curColor === String(color)?width/5:width/3;
                    MouseArea {
                        anchors.fill: parent;
                        onClicked: rect.signalColorSelect(String(parent.color));
                    }
                }
            }

            Rectangle{
                id:btn7;
                width: rect.width/7;
                height: rect.height;
                color:"transparent";

                Rectangle {
                    anchors.centerIn: parent;
                    width: parent.width;
                    height:width;
                    radius: width/2;
                    border.color: rect.color;
                    border.width:rect.curColor === "circle"?width/5:width/3;
                    MouseArea {
                        anchors.fill: parent;
                        onClicked: rect.signalColorSelect("circle");
                    }
                }
            }
        }
    }
}


