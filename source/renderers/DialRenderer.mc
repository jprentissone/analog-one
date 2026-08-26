import Toybox.Graphics;
import Toybox.Lang;
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
    const HOUR_OUTER_PIP_LENGTH = 5;
    const HOUR_OUTER_PIP_WIDTH = 3;
    const HOUR_MARKER_GAP = 6;
    const HOUR_INNER_PIP_LENGTH = 9;
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

        drawDialNumber(dc, "9", 180, centerX, centerY, numeralRadius);
    }

    function drawMinuteTrack(dc, centerX, centerY, radius) {
        for (var minute = 0; minute < 60; minute += 1) {
            var angle = (270 + minute * 6) % 360;

            var tickLength = MINUTE_TICK_LENGTH;

            if (isCardinalPosition(minute)) {
                tickLength = CARDINAL_TICK_LENGTH;
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

            if (isCardinalPosition(minute)) {
                drawCardinalMarker(dc, minute, outerPoint, innerPoint);
            } else if (isHourMarker(minute)) {
                drawSplitHourMarker(
                    dc,
                    centerX,
                    centerY,
                    radius,
                    angle
                );
            } else {
                dc.setPenWidth(1);
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

    function drawSplitHourMarker(
        dc,
        centerX,
        centerY,
        radius,
        angle
    ) {
        var outerPipEndRadius = radius - HOUR_OUTER_PIP_LENGTH;
        var innerPipStartRadius = outerPipEndRadius - HOUR_MARKER_GAP;
        var innerPipEndRadius =
            innerPipStartRadius - HOUR_INNER_PIP_LENGTH;

        var outerPoint = polarToPoint(centerX, centerY, radius, angle);
        var outerPipEnd = polarToPoint(
            centerX,
            centerY,
            outerPipEndRadius,
            angle
        );
        var innerPipStart = polarToPoint(
            centerX,
            centerY,
            innerPipStartRadius,
            angle
        );
        var innerPipEnd = polarToPoint(
            centerX,
            centerY,
            innerPipEndRadius,
            angle
        );

        drawRadialRectangle(
            dc,
            outerPoint,
            outerPipEnd,
            angle,
            HOUR_OUTER_PIP_WIDTH
        );

        dc.setPenWidth(2);
        dc.drawLine(
            innerPipStart[0],
            innerPipStart[1],
            innerPipEnd[0],
            innerPipEnd[1]
        );
    }

    function drawRadialRectangle(
        dc,
        outerPoint as Array,
        innerPoint as Array,
        angle,
        width
    ) {
        var halfWidth = width / 2;
        var outerLeft = polarToPoint(
            outerPoint[0],
            outerPoint[1],
            halfWidth,
            angle - 90
        );
        var outerRight = polarToPoint(
            outerPoint[0],
            outerPoint[1],
            halfWidth,
            angle + 90
        );
        var innerLeft = polarToPoint(
            innerPoint[0],
            innerPoint[1],
            halfWidth,
            angle - 90
        );
        var innerRight = polarToPoint(
            innerPoint[0],
            innerPoint[1],
            halfWidth,
            angle + 90
        );

        dc.fillPolygon([
            [outerLeft[0], outerLeft[1]],
            [innerLeft[0], innerLeft[1]],
            [innerRight[0], innerRight[1]],
            [outerRight[0], outerRight[1]],
        ]);
    }

    function drawCardinalMarker(
        dc,
        minute,
        outerPoint as Array,
        innerPoint as Array
    ) {
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

    function polarToPoint(centerX, centerY, radius, degrees) as Array {
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
