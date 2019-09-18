import QtQuick 2.9
import QtQuick.Window 2.2

Window {
    id:mainWindow
    visible: true
    width: 640
    height: 480
    title: qsTr("Components")

    // 字体选择器
    FontSelector { // 定义
        id:fontSelector
        anchors.centerIn: parent
    }

    Connections{   // 字体选择器信号捕捉
        target: fontSelector;
        onFontSelectChanged:{
            console.log(newFont)
        }
    }
}
