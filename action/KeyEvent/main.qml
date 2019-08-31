import QtQuick 2.9
import QtQuick.Window 2.2

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Key Event")

    Rectangle {
        anchors.fill: parent
        color: "#999999"
        focus: true
        Keys.enabled: true

        Keys.onBackPressed: {
            Qt.quit()
        }

        Keys.onEscapePressed: {
            Qt.quit()
        }

        Keys.onPressed: {
            switch(event.key) {
            case Qt.Key_0:
            case Qt.Key_1:
            case Qt.Key_2:
            case Qt.Key_3:
            case Qt.Key_4:
            case Qt.Key_5:
            case Qt.Key_6:
            case Qt.Key_7:
            case Qt.Key_8:
            case Qt.Key_9:
                event.accepted = true;
                textView.text = event.key - Qt.Key_0
                break;
            }

        }

        Text {
            id: textView
            font.pixelSize: 20
            anchors.centerIn: parent
            text: qsTr("text")
        }

    }
}
