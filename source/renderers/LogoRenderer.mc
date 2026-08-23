import Toybox.Graphics;

class LogoRenderer {
    const EMBLEM_COLOR = 0x202020;
    const LINE_WIDTH = 6;

    function initialize() {}

    function draw(dc as Graphics.Dc) {
        var centerX = dc.getWidth() / 2;
        var centerY = dc.getHeight() / 2;

        dc.setColor(EMBLEM_COLOR, Graphics.COLOR_TRANSPARENT);

        dc.setPenWidth(LINE_WIDTH);

        drawAnalogOneMark(dc, centerX, centerY);

        dc.setPenWidth(1);
    }

    function drawAnalogOneMark(dc, centerX, centerY) {
        var topY = centerY - 80;
        var bottomY = centerY + 75;

        // Geometric A
        dc.drawLine(centerX - 85, bottomY, centerX - 35, topY);

        dc.drawLine(centerX - 35, topY, centerX + 15, bottomY);

        dc.drawLine(centerX - 63, centerY + 15, centerX - 7, centerY + 15);

        // Geometric 1
        dc.drawLine(centerX + 30, centerY - 55, centerX + 55, topY);

        dc.drawLine(centerX + 55, topY, centerX + 55, bottomY);

        dc.drawLine(centerX + 30, bottomY, centerX + 80, bottomY);
    }
}
