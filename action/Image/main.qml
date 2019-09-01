import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Controls 1.4

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Image")

    Image {
        id : image1
        anchors.left : parent.left
        anchors.leftMargin: 10
        anchors.top : parent.top
        anchors.topMargin: 10
        width: 200
        height: 200*3/4
        source :"qrc:/../../../../../../Public/Pictures/Sample Pictures/Hydrangeas.jpg"
    }

    Image {
        id : urlImage
        anchors.left : image1.right
        anchors.leftMargin: 10
        anchors.top : parent.top
        anchors.topMargin: 10
        width: 230
        height: 100
        asynchronous: true
        fillMode: Image.PreserveAspectFit
        source :"http://www.csu.edu.cn/images/logo.jpg"

        onStatusChanged: {
            if(urlImage.status == Image.Loading) {
                busyIndicator.running = true
                errorText.visible = false
            } else if (urlImage.status == Image.Ready) {
                busyIndicator.running = false
            } else if (urlImage.status == Image.Error) {
                busyIndicator.running = true
                errorText.visible = true
                errorText.text = "error"
            }
        }
    }

    BusyIndicator {
        id: busyIndicator
        running: true
        anchors.centerIn: urlImage
        z:2
    }

    Text {
        id: errorText
        visible: false
        anchors.centerIn: parent
        z:3
    }
}
