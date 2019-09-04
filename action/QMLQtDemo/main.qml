import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Controls 1.4
import lesliefish.qml.ColorMaker 1.0

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("QML Qt 混合编程")

    Rectangle {
        id : rootItem
        anchors.fill : parent

        Text {
            id: timeLabel
            anchors.left: parent.left;
            anchors.leftMargin: 4;
            anchors.top: parent.top;
            anchors.topMargin: 4;
            font.pixelSize: 26;
        }

        ColorMaker {
            id : colorMaker
            color: Qt.green
        }


        Rectangle {
            id:colorRect
            width: 200
            height: 200
            anchors.centerIn: parent
            color: "blue"
        }

        Button {
               id: start;
               text: "start";
               anchors.left: parent.left;
               anchors.leftMargin: 4;
               anchors.bottom: parent.bottom;
               anchors.bottomMargin: 4;
               onClicked: {
                   colorMaker.start();
               }
        }

        Button {
               id: stop;
               text: "stop";
               anchors.left: start.right;
               anchors.leftMargin: 4;
               anchors.bottom: start.bottom;
               onClicked: {
                   colorMaker.stop();
               }
        }

        Button {
                id: colorAlgorithm;
                text: "RandomRGB";
                anchors.left: stop.right;
                anchors.leftMargin: 4;
                anchors.bottom: start.bottom;
                onClicked: {
                    var algorithm = (colorMaker.algorithm() + 1) % 5;
                    rootItem.changeAlgorithm(colorAlgorithm, algorithm);
                    colorMaker.setAlgorithm(algorithm);
                }
            }

        Button {
            id: quit;
            text: "quit";
            anchors.left: colorAlgorithm.right;
            anchors.leftMargin: 4;
            anchors.bottom: start.bottom;
            onClicked: {
                Qt.quit();
            }
        }

        function changeAlgorithm(button, algorithm) {
            switch(algorithm) {
            case 0:
                button.text = "RandomRGB";
                break;
            case 1:
                button.text = "RandomRed";
                break;
            case 2:
                button.text = "RandomGreen";
                break;
            case 3:
                button.text = "RandomBlue";
                break;
            case 4:
                button.text = "LinearIncrease";
                break;
            }
        }

        Component.onCompleted: {
            colorMaker.color = Qt.rgba(0,180,120,255);
            colorMaker.setAlgorithm(ColorMaker.LinearIncrease)
            changeAlgorithm(colorAlgorithm, colorMaker.algorithm())
        }

        Connections {
               target: colorMaker;
               onCurrentTime:{
                   timeLabel.text = strTime;
                   timeLabel.color = colorMaker.timeColor;
               }
               onColorChanged:{
                   colorRect.color = color;
               }
        }
    }
}
