import Toybox.Graphics;
import Toybox.Math;

class DialRenderer {
    // ==========================================================
    // Dial Layout
    // ==========================================================

    const DIAL_INSET = 3;
    const NUMERAL_OFFSET = 32;

    // ==========================================================
    // Dial Markers
    // ==========================================================

    const MINUTE_TICK_LENGTH = 6; // 1-59
    const HOUR_TICK_LENGTH = 18; //
    const ALWAYS_ON_TICK_LENGTH = 10;
    const CARDINAL_TICK_LENGTH = 10; // 12, 3, 6, 9

    // ==========================================================
    // Colors
    // ==========================================================

    var _theme as Theme;

    // ==========================================================
    // Typography
    // ==========================================================

    const DIAL_NUMBER_FONT = Graphics.FONT_XTINY;

    function initialize(theme as Theme) {
        _theme = theme;
    }

    function draw(dc as Graphics.Dc) {
        dc.setColor(_theme.dialColor, Graphics.COLOR_TRANSPARENT);

        var centerX = dc.getWidth() / 2;
        var centerY = dc.getHeight() / 2;

        var radius = dc.getWidth() / 2 - DIAL_INSET;
        var numeralRadius = radius - NUMERAL_OFFSET;

        drawDialNumbers(dc, centerX, centerY, numeralRadius);

        drawMinuteTrack(dc, centerX, centerY, radius);
    }

    function drawDialNumbers(dc, centerX, centerY, numeralRadius) {
        drawDialNumber(dc, "12", 270, centerX, centerY, numeralRadius);

        drawDialNumber(dc, "3", 0, centerX, centerY, numeralRadius);

        drawDialNumber(dc, "6", 90, centerX, centerY, numeralRadius);

        drawDialNumber(dc, "9", 180, centerX, centerY, numeralRadius);
    }

    function drawMinuteTrack(dc, centerX, centerY, radius) {
        for (var minute = 0; minute < 60; minute += 1) {
            var angle = (270 + minute * 6) % 360;

            var tickLength = MINUTE_TICK_LENGTH;

            if (isCardinalPosition(minute)) {
                tickLength = CARDINAL_TICK_LENGTH;
            } else if (isHourMarker(minute)) {
                tickLength = HOUR_TICK_LENGTH;
            }

            var outerPoint = polarToPoint(centerX, centerY, radius, angle);

            var innerPoint = polarToPoint(
                centerX,
                centerY,
                radius - tickLength,
                angle
            );

            if (minute == 0) {
                dc.setColor(_theme.accentColor, Graphics.COLOR_TRANSPARENT);
            } else if (isHourMarker(minute)) {
                dc.setColor(_theme.dialColor, Graphics.COLOR_TRANSPARENT);
            } else {
                dc.setColor(
                    _theme.minuteTrackColor,
                    Graphics.COLOR_TRANSPARENT
                );
            }

            if (isHourMarker(minute)) {
                dc.setPenWidth(2);
            } else {
                dc.setPenWidth(1);
            }

            if (isCardinalPosition(minute)) {
                drawCardinalMarker(dc, minute, outerPoint, innerPoint);
            } else {
                dc.drawLine(
                    outerPoint[0],
                    outerPoint[1],
                    innerPoint[0],
                    innerPoint[1]
                );
            }
        }

        dc.setPenWidth(1);
    }

    function drawCardinalMarker(dc, minute, outerPoint, innerPoint) {
        for (var offset = -2; offset <= 2; offset += 1) {
            if (minute == 0 || minute == 30) {
                // The 12 and 6 markers are vertical,
                // so spread their lines horizontally.
                dc.drawLine(
                    outerPoint[0] + offset,
                    outerPoint[1],
                    innerPoint[0] + offset,
                    innerPoint[1]
                );
            } else {
                // The 3 and 9 markers are horizontal,
                // so spread their lines vertically.
                dc.drawLine(
                    outerPoint[0],
                    outerPoint[1] + offset,
                    innerPoint[0],
                    innerPoint[1] + offset
                );
            }
        }
    }

    function drawDialNumber(dc, text, angle, centerX, centerY, numeralRadius) {
        var point = polarToPoint(centerX, centerY, numeralRadius, angle);

        var font = DIAL_NUMBER_FONT;
        var textHeight = dc.getFontHeight(font);

        dc.drawText(
            point[0],
            point[1] - textHeight / 2,
            font,
            text,
            Graphics.TEXT_JUSTIFY_CENTER
        );
    }

    function isCardinalPosition(minute) {
        return minute == 0 || minute == 15 || minute == 30 || minute == 45;
    }

    function isHourMarker(minute) {
        return minute % 5 == 0;
    }

    function polarToPoint(centerX, centerY, radius, degrees) {
        var radians = degreesToRadians(degrees);

        return [
            centerX + Math.cos(radians) * radius,
            centerY + Math.sin(radians) * radius,
        ];
    }

    function degreesToRadians(degrees) {
        return (degrees * Math.PI) / 180.0;
    }

    function drawAlwaysOn(dc as Graphics.Dc, offsetX, offsetY) {
        dc.setColor(_theme.minuteTrackColor, Graphics.COLOR_TRANSPARENT);

        var centerX = dc.getWidth() / 2 + offsetX;
        var centerY = dc.getHeight() / 2 + offsetY;
        var radius = dc.getWidth() / 2 - DIAL_INSET;

        drawAlwaysOnMarker(dc, centerX, centerY, radius, 270);
        drawAlwaysOnMarker(dc, centerX, centerY, radius, 0);
        drawAlwaysOnMarker(dc, centerX, centerY, radius, 90);
        drawAlwaysOnMarker(dc, centerX, centerY, radius, 180);
    }

    function drawAlwaysOnMarker(dc, centerX, centerY, radius, angle) {
        var outerPoint = polarToPoint(centerX, centerY, radius, angle);

        var innerPoint = polarToPoint(
            centerX,
            centerY,
            radius - ALWAYS_ON_TICK_LENGTH,
            angle
        );

        dc.drawLine(outerPoint[0], outerPoint[1], innerPoint[0], innerPoint[1]);
    }
}
