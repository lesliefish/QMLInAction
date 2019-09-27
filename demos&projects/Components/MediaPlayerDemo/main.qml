import QtQuick 2.9
import QtQuick.Window 2.2
import QtMultimedia 5.9

Window {
    id:mainWindow;
    visible: true
    width: 320;
    height: 100;
    title: qsTr("Hello World");
    flags: Qt.FramelessWindowHint;

    // 窗口可拖动
    MouseArea {
        //为窗口添加鼠标事件
        anchors.fill: parent
        acceptedButtons: Qt.LeftButton //只处理鼠标左键
        property point clickPos: "0,0"
        onPressed: { //接收鼠标按下事件
            clickPos  = Qt.point(mouse.x,mouse.y)
        }
        onPositionChanged: { //鼠标按下后改变位置
            //鼠标偏移量
            var delta = Qt.point(mouse.x - clickPos.x, mouse.y - clickPos.y)

            //如果mainwindow继承自QWidget,用setPos
            mainWindow.setX(mainWindow.x+delta.x)
            mainWindow.setY(mainWindow.y+delta.y)
        }
    }

    Rectangle {
        anchors.fill: parent;
        MediaPlayer {
            id: mediaPlayer
            source: "file:///C:\\Users\\Public\\Music\\Sample Music\\Kalimba.mp3"
            readonly property string title: !!metaData.author && !!metaData.title
                                            ? qsTr("%1 - %2").arg(metaData.author).arg(metaData.title)
                                            : metaData.author || metaData.title || source
        }

        PlayerUI {
            id:playerUi;
            anchors.fill: parent;
            curMusicName:mediaPlayer.title;
            playedTime: mediaPlayer.position;
            remainderTime: mediaPlayer.duration;
            progressMaxValue: mediaPlayer.duration;
            curPlayPosition: mediaPlayer.position;
        }

        Connections {
            target:playerUi;
            onSignalPlayAction: {
                if(bPlay) {
                    mediaPlayer.play();
                } else {
                    mediaPlayer.pause();
                }
            }

            onSignalPlayPositionChanged: {
                mediaPlayer.seek(newPosition);
            }
        }
    }
}
