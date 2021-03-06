import QtQuick 2.0

Item {
    id:dottedLineItem
    width: 300
    height: 180

    property int lineToLineSpace: 2;//虚线间隔
    property int singleLineWidth: 5;//单个线宽度
    property int singleLineHeight: 1;//单个线高度
    property string lineColor: "#2985da";

    Rectangle {
        id:control
        width: dottedLineItem.width;
        height: dottedLineItem.height;
        anchors.fill: parent;
        color: "transparent";

        Canvas{
            id:canvas;
            width:parent.width;
            height: parent.height;
            anchors.centerIn: parent

            onPaint: {
                var ctx = getContext("2d");
                var startX = 0;
                var startY = 0;
                // 水平
                var iHorCanDrawCount = width/(dottedLineItem.lineToLineSpace+dottedLineItem.singleLineWidth);//水平可以画的线段个数
                ctx.translate(startX, startY);
                for(var i = 0; i <= iHorCanDrawCount;i++){
                    //console.log(startX, startY, iHorCanDrawCount);
                    ctx.fillRect(startX, startY,dottedLineItem.singleLineWidth,dottedLineItem.singleLineHeight);
                    ctx.fillRect(startX, height-dottedLineItem.singleLineHeight,dottedLineItem.singleLineWidth,dottedLineItem.singleLineHeight);
                    context.fillStyle = dottedLineItem.lineColor;  //设置线的颜色状态
                    context.stroke();               //进行绘制
                    startX = i*(dottedLineItem.lineToLineSpace + dottedLineItem.singleLineWidth)
                }

                // 垂直方向
                var iVerCanDrawCount = height/(dottedLineItem.lineToLineSpace+dottedLineItem.singleLineWidth);//垂直可以画的线段个数
                startX = 0;
                startY = 0;
                ctx.moveTo(startX, startY);
                for(var j = 1; j <= iVerCanDrawCount;j++){
                    //console.log(startX, startY, iVerCanDrawCount);
                    ctx.fillRect(startX, startY, dottedLineItem.singleLineHeight, dottedLineItem.singleLineWidth);
                    ctx.fillRect(startX + width-dottedLineItem.singleLineHeight, startY, dottedLineItem.singleLineHeight, dottedLineItem.singleLineWidth);
                    context.fillStyle = dottedLineItem.lineColor;  //设置线的颜色状态
                    context.stroke();               //进行绘制
                    startY = j*(dottedLineItem.lineToLineSpace + dottedLineItem.singleLineWidth)
                }
            }
        }

        // 选中时样式的四个角的rect
        Component {
            id:selectedStateRect;

            Rectangle {
                id:rect;
                width: 10;
                height: width;
                color: "#1673c1"
                border.color: "white";
                border.width: 1/6*width;
                radius: width/2;
            }
        }

        Loader{
            id:leftUpItem;
            sourceComponent: selectedStateRect;
            onLoaded: {
                anchors.left = parent.left;
                anchors.leftMargin = -item.width/2;
                anchors.top = parent.top;
                anchors.topMargin = -item.width/2;
            }
        }

        Loader{
            id:rightUpItem;
            sourceComponent: selectedStateRect;
            onLoaded: {
                anchors.right = parent.right;
                anchors.rightMargin = -item.width/2;
                anchors.top = parent.top;
                anchors.topMargin = -item.width/2;
            }
        }
        Loader{
            id:leftDownItem;
            sourceComponent: selectedStateRect;
            onLoaded: {
                anchors.left = parent.left;
                anchors.leftMargin = -item.width/2;
                anchors.bottom = parent.bottom;
                anchors.bottomMargin = -item.width/2;
            }
        }
        Loader{
            id:rightDownItem;
            sourceComponent: selectedStateRect;
            onLoaded: {
                anchors.right = parent.right;
                anchors.rightMargin = -item.width/2;
                anchors.bottom = parent.bottom;
                anchors.bottomMargin = -item.width/2;
            }
        }
    }
}
