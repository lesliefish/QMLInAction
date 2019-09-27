import QtQuick 2.0
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4

Item {
    id:itemSelf;
    property string curMusicName : "";
    property string playedTime: "00:00";
    property string remainderTime: "00:00";
    property int progressMaxValue: 0;
    property int curPlayPosition: 0;

    signal signalPlayAction(bool bPlay);

    signal signalPlayPositionChanged(int newPosition);


    function formatDuring(mss) {
        var days = parseInt(mss / (1000 * 60 * 60 * 24));
        var hours = parseInt((mss % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
        var minutes = parseInt((mss % (1000 * 60 * 60)) / (1000 * 60));
        var seconds = (mss % (1000 * 60)) / 1000;
        if(hours !== 0){
            return ("0" + hours).substr(-2) + ":" + ("0" + minutes).substr(-2) + ":" + ("0" + parseInt(seconds)).substr(-2);
        } else {
            return ("0" + minutes).substr(-2) + ":" + ("0" + parseInt(seconds)).substr(-2); // 补0操作
        }
    }

    Rectangle {
        width: parent.width;
        height: parent.height;

        anchors.centerIn: parent;

        color: "transparent";
        border.width: 1;
        border.color: "grey";
        radius: 5;


        Text {
            id: fileNameText;
            width: parent.width*2/3;
            height: parent.width/3;
            anchors.left:parent.left;
            anchors.leftMargin: 5;
            anchors.top:parent.top;
            anchors.topMargin: 5;
            font.family: "microsoft yahei";
            font.pointSize: 11;
            text: curMusicName;
            horizontalAlignment: Text.AlignLeft;
            elide: Text.ElideRight;
            color:"black";
        }


        Switch {
            id:playButton;
            anchors.left:parent.left;
            anchors.leftMargin: 5;
            anchors.top:parent.top;
            anchors.topMargin: parent.height/2.5;
            height: parent.height/3;
            width: height;
            checked: true;

            onClicked : {
                console.log("play event:", !playButton.checked);
                itemSelf.signalPlayAction(!playButton.checked);
            }

            style: SwitchStyle {
                groove: Rectangle {
                    implicitWidth: control.width;
                    implicitHeight: implicitWidth;
                    radius: implicitWidth/2;

                    Rectangle {
                        anchors.centerIn: parent;
                        width: parent.width;
                        height: width;
                        visible:control.checked;

                        Image {
                            anchors.centerIn: parent;
                            source: "qrc:/icons/play.svg";
                        }
                    }

                    Rectangle {
                        anchors.centerIn: parent;
                        width: parent.width;
                        height: width;
                        visible:!control.checked;
                        Image {
                            anchors.centerIn: parent;
                            source: "qrc:/icons/pause.svg";
                        }
                    }
                }

                handle:Rectangle{
                    visible: false;
                }
            }
        }

        Slider {
            id:playProgressControl;
            width: parent.width*4/5;
            height: playButton.height;
            anchors.left :playButton.right;
            anchors.leftMargin: 10;
            anchors.top:playButton.top;
            maximumValue: progressMaxValue;
            value:curPlayPosition;

            style: SliderStyle {
                groove: Rectangle {
                    radius: control.height;
                    color: "lightgray"
                    border.color: "gray"
                    border.width: 1
                    implicitHeight: 4
                }
                handle:Rectangle {
                    anchors.centerIn: parent
                    color: control.pressed ? "lightblue" : "lightgray"
                    border.color: "gray"
                    border.width: 1
                    implicitWidth: control.height/2;
                    implicitHeight: implicitWidth
                    radius: width/2
                }
            }

            onValueChanged: {
                itemSelf.signalPlayPositionChanged(playProgressControl.value);
            }
        }

        Text {
            id: playedTimeText
            text: formatDuring(playedTime);
            anchors.left: playProgressControl.left;
            anchors.top:playProgressControl.bottom;
            anchors.topMargin: -10;
            font.family: "microsoft yahei";
        }

        Text {
            id: remainderTimeText
            text: "-" + formatDuring(remainderTime-playedTime);
            anchors.right : playProgressControl.right;
            anchors.top : playProgressControl.bottom;
            anchors.topMargin : -10;
            font.family: "microsoft yahei";
        }

        Rectangle {
            id:closeBtn;
            width: 16;
            height: 16;
            anchors.right: parent.right;
            anchors.top: parent.top;
            anchors.topMargin: 10;
            anchors.rightMargin: anchors.topMargin;
            color:"transparent";
            Image {
                anchors.centerIn: parent;
                source: "qrc:/icons/close.svg";
            }
            MouseArea {
                anchors.fill: parent;
                onClicked: {
                    Qt.quit();
                }
            }
        }
    }
}
