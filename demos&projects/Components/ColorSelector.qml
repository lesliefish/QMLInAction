import QtQuick 2.0
import QtQuick.Controls 2.2
Item {
    Rectangle {
        id: control
        width: 300
        height: width

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


        Canvas {
            id: root
            // canvas size
            width: parent.width;
            height: parent.height
            // handler to override for drawing
            onPaint: {
                var ctx = getContext("2d")
                var iSectors = 360;
                var iSectorAngle = (360/iSectors)/180 * Math.PI; // in radians
                ctx.translate(width/2, height/2);
                for (var i = 0; i< iSectors; i++) {
                    var startAngle = 0;
                    var endAngle = startAngle + iSectorAngle;
                    var radius = (width/2)-1;
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
                ctx.arc(0, 0, width/2-41, 0, 2 * Math.PI, false);
                ctx.fillStyle = 'white';
                ctx.fill();
                ctx.strokeStyle = 'transparent';
                ctx.stroke();
                ctx.restore();
            }
        }
    }
}
