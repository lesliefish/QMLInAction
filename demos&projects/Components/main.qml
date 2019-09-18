import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Controls 1.2

Window {
    id:mainWindow
    visible: true
    width: 640
    height: 480
    title: qsTr("Components")

    Rectangle {
        anchors.fill: parent;
        Button {
            id:button
            anchors.centerIn: parent
            width: 200;
            height: 36;
            text:qsTr("Choose Font");

            onClicked: {
                fontSelector.visible = !fontSelector.visible;
            }
        }

        // 字体选择器
        FontSelector { // 定义
            visible: false
            id:fontSelector
            x:button.x + button.width;
            y:button.y - fontSelector.height;
        }

        Connections{   // 字体选择器信号捕捉
            target: fontSelector;
            onFontSelectChanged:{
                console.log(newFont)
            }
        }
    }
}
