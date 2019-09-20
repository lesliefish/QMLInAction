import QtQuick 2.0
import QtQuick.Controls 2.2
Item {
    Rectangle {
        id: control
        width: 300
        height: width
        color: "black"

        // 根据角度获取颜色值
        function getAngleColor(angle) {
            var color, d;
            if (angle < Math.PI * 2 / 5) { // angle: 0-72
                d = 255 / (Math.PI * 2 / 5) * angle;
                color = '255,' + Math.round(d) + ',0'; // color: 255,0,0 - 255,255,0
            } else if (angle < Math.PI * 4 / 5) { // angle: 72-144
                d = 255 / (Math.PI * 2 / 5) * (angle - Math.PI * 2 / 5);
                color = (255 - Math.round(d)) + ',255,0'; // color: 255,255,0 - 0,255,0
            } else if (angle < Math.PI * 6 / 5) { // angle: 144-216
                d = 255 / (Math.PI * 2 / 5) * (angle - Math.PI * 4 / 5);
                color = '0,255,' + Math.round(d); // color: 0,255,0 - 0,255,255
            } else if (angle < Math.PI * 8 / 5) { // angle: 216-288
                d = 255 / (Math.PI * 2 / 5) * (angle - Math.PI * 6 / 5);
                color = '0,'+(255 - Math.round(d)) + ',255'; // color: 0,255,255 - 0,0,255
            } else { // angle: 288-360
                d = 255 / (Math.PI * 2 / 5) * (angle - Math.PI * 8 / 5);
                color = Math.round(d) + ',0,' + (255 - Math.round(d)) ; // color: 0,0,255 - 255,0,0
            }
            return color;
        }

        // 获取旋转角度
       function getRotateAngle (mouseX, mouseY) {
            var yPosOffset = mouseY - control.width/2;    // 计算角度 : tan(x) = (y2-y1)/(x2-x1);
            var xPosOffset = mouseX - control.height/2;
            // 旋转的弧度 hudu, 角度angle
            var hudu = 0, angle = 0;
            if (xPosOffset != 0 && yPosOffset != 0) {
                hudu = Math.atan(Math.abs(yPosOffset / xPosOffset));
            }

            if (xPosOffset === 0 && yPosOffset === 0) {
                return angle;
            } else if (xPosOffset < 0 && yPosOffset < 0) {
                angle = hudu * 180 / Math.PI;                   // 左上
            } else if (xPosOffset === 0 && yPosOffset < 0) {
                angle = 90;                                     // 上 中间
            } else if (xPosOffset > 0 && yPosOffset < 0) {
                angle = 180 - hudu * 180 / Math.PI;             // 右上
            } else if (xPosOffset > 0 && yPosOffset === 0) {
                angle = 180;                                    // 上 下 中间
            } else if (xPosOffset > 0 && yPosOffset > 0) {
                angle = 180 + hudu * 180 / Math.PI;             // 右下
            } else if (xPosOffset === 0 && yPosOffset > 0) {
                angle = 270;                                    // 下 中间
            } else if (xPosOffset < 0 && yPosOffset > 0) {
                angle = 360 - hudu * 180 / Math.PI;             // 左下
            }
            return angle;
        }


        // 选择按钮
        Rectangle {
            id:handle
            width : 90;
            height : width
            border.color: "black";
            radius: width/2
            opacity: 0.5
            color: "darkred"
            x:parent.x-25;
            y:parent.height/2 - height/2
            z:1000
            anchors.margins: 1
        }

        // 圆环画布
        Canvas {
            id: canvas
            width: parent.width;
            height: parent.height

            onPaint: {
                var ctx = getContext("2d")
                var iSectors = 360;
                var iSectorAngle = (360/iSectors)/180 * Math.PI; // in radians
                ctx.translate(width/2, height/2);
                for (var i = 0; i< iSectors; i++) {
                    var startAngle = 0;
                    var endAngle = startAngle + iSectorAngle;
                    var radius = (width/2);
                    var color = control.getAngleColor(iSectorAngle * i);
                    ctx.beginPath();
                    ctx.moveTo(0, 0);
                    ctx.arc(0, 0, radius, startAngle, endAngle, false);
                    ctx.closePath();
                    ctx.strokeStyle = 'rgb('+color+')';
                    ctx.stroke();
                    ctx.fillStyle = 'rgb('+color+')';
                    ctx.fill();
                    ctx.rotate(iSectorAngle);
                }
                ctx.restore();

                ctx.save();
                ctx.translate(0,0);
                ctx.beginPath();
                ctx.arc(0, 0, width/2-40, 0, 2 * Math.PI, false);
                ctx.fillStyle = 'black';
                ctx.fill();
                ctx.strokeStyle = 'transparent';
                ctx.stroke();
                ctx.restore();
            }

            MouseArea {
                anchors.fill: parent;
                onMouseXChanged: {
                    console.log(mouseX, mouseY);

                    var currentAngle = control.getRotateAngle(mouseX, mouseY);
                    console.log(currentAngle);

                    //半径上的点位置
                    var newX = (Math.cos(currentAngle) * Math.PI/180) * control.width/2;
                    var newY = (Math.sin(currentAngle) * Math.PI/180) * control.height/2;

                    console.log(newX, newY);
                    handle.x = newX;
                    handle.y = newY;
                }
            }
        }
    }
}
