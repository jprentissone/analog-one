import Toybox.Graphics;
import Toybox.Math;
import Toybox.System;

class HandRenderer {
    // ==========================================================
    // Hour Hand
    // ==========================================================

    const HOUR_HAND_LENGTH = 120;
    const HOUR_OUTER_WIDTH = 16;
    const HOUR_WHITE_WIDTH = 11;

    // ==========================================================
    // Minute Hand
    // ==========================================================

    const MINUTE_HAND_LENGTH = 165;
    const MINUTE_OUTER_WIDTH = 14;
    const MINUTE_WHITE_WIDTH = 10;

    // ==========================================================
    // Seconds Hand
    // ==========================================================

    // Reaches the inner five-minute pip band without touching the outer pips.
    const SECOND_HAND_LENGTH = 210;
    const SECOND_HAND_WIDTH = 2;

    const SECOND_COUNTERWEIGHT = 18;
    const SECOND_CENTER_RADIUS = 4;

    // ==========================================================
    // Shared Hand Shape
    // ==========================================================

    // Outer frame begins closer to the center
    const HAND_OUTER_START_RADIUS = 12;

    // White fill begins farther out, creating visible separation
    const HAND_INNER_START_RADIUS = 19;
    //17
    // Difference between outer frame and white hand length
    const BORDER_GAP = 2;

    // Softer, less pointy tip
    const TIP_TAPER_LENGTH = 24;
    const TIP_END_WIDTH_RATIO = 0.45;

    // ==========================================================
    // Hour Hand Window
    // ==========================================================

    const WINDOW_LENGTH = 24;
    const WINDOW_WIDTH = 4;
    const WINDOW_END_OFFSET = 12;

    // ==========================================================
    // Colors
    // ==========================================================

    var _theme as Theme;

    function initialize(theme as Theme) {
        _theme = theme;
    }

    function draw(dc as Graphics.Dc, isAwake, offsetX, offsetY) {
        var centerX = dc.getWidth() / 2 + offsetX;
        var centerY = dc.getHeight() / 2 + offsetY;

        var clockTime = System.getClockTime();

        // ======================================================
        // Minute Hand Angle
        // ======================================================

        var minuteAngle = (270 + clockTime.min * 6) % 360;

        // ======================================================
        // Hour Hand Angle
        // ======================================================

        var hour = clockTime.hour % 12;

        var hourAngle = 270 + hour * 30 + clockTime.min * 0.5;

        while (hourAngle >= 360) {
            hourAngle -= 360;
        }

        // ======================================================
        // Second Hand Angle
        // ======================================================
        var secondAngle = (270 + clockTime.sec * 6) % 360;

        // ======================================================
        // Draw Hands
        // ======================================================

        drawHourHand(dc, centerX, centerY, hourAngle);

        drawMinuteHand(dc, centerX, centerY, minuteAngle);

        if (isAwake) {
            drawSecondHand(dc, centerX, centerY, secondAngle);
        }
    }

    // ==========================================================
    // Hour Hand
    // ==========================================================

    function drawHourHand(dc, centerX, centerY, angle) {
        drawPremiumHand(
            dc,
            centerX,
            centerY,
            HOUR_HAND_LENGTH,
            HOUR_OUTER_WIDTH,
            HOUR_WHITE_WIDTH,
            angle,
            true
        );
    }

    // ==========================================================
    // Minute Hand
    // ==========================================================

    function drawMinuteHand(dc, centerX, centerY, angle) {
        drawPremiumHand(
            dc,
            centerX,
            centerY,
            MINUTE_HAND_LENGTH,
            MINUTE_OUTER_WIDTH,
            MINUTE_WHITE_WIDTH,
            angle,
            false
        );
    }

    function drawSecondHand(dc, centerX, centerY, angle) {
        dc.setColor(_theme.accentColor, Graphics.COLOR_TRANSPARENT);

        // Front tip
        var tip = polarToPoint(centerX, centerY, SECOND_HAND_LENGTH, angle);

        // Rear counterweight
        var rear = polarToPoint(
            centerX,
            centerY,
            SECOND_COUNTERWEIGHT,
            angle + 180
        );

        dc.drawLine(rear[0], rear[1], tip[0], tip[1]);

        dc.fillCircle(rear[0], rear[1], SECOND_CENTER_RADIUS);
    }

    // ==========================================================
    // Premium Hand Builder
    // ==========================================================

    function drawPremiumHand(
        dc,
        centerX,
        centerY,
        length,
        outerWidth,
        whiteWidth,
        angle,
        hasWindow
    ) {
        // ------------------------------------------------------
        // Layer 1 — Dark outer frame
        // ------------------------------------------------------

        drawHandBody(
            dc,
            centerX,
            centerY,
            HAND_OUTER_START_RADIUS,
            length,
            outerWidth,
            angle,
            _theme.handBorderColor
        );

        // ------------------------------------------------------
        // Layer 2 — White inner hand
        // ------------------------------------------------------

        drawHandBody(
            dc,
            centerX,
            centerY,
            HAND_INNER_START_RADIUS,
            length - BORDER_GAP,
            whiteWidth,
            angle,
            _theme.handColor
        );

        // ------------------------------------------------------
        // Layer 3 — Hollow slot, hour hand only
        // ------------------------------------------------------

        if (hasWindow) {
            drawTipWindow(dc, centerX, centerY, length, angle);
        }
    }

    // ==========================================================
    // Hand Body
    // ==========================================================

    function drawHandBody(
        dc,
        centerX,
        centerY,
        startRadius,
        length,
        width,
        angle,
        color
    ) {
        var start = polarToPoint(centerX, centerY, startRadius, angle);

        var taperStartRadius = length - TIP_TAPER_LENGTH;

        var taperStart = polarToPoint(
            centerX,
            centerY,
            taperStartRadius,
            angle
        );

        var tip = polarToPoint(centerX, centerY, length, angle);

        var halfWidth = width / 2;

        var taperHalfWidth = halfWidth * 0.75;

        var tipHalfWidth = halfWidth * TIP_END_WIDTH_RATIO;

        var startLeft = polarToPoint(start[0], start[1], halfWidth, angle - 90);

        var startRight = polarToPoint(
            start[0],
            start[1],
            halfWidth,
            angle + 90
        );

        var taperLeft = polarToPoint(
            taperStart[0],
            taperStart[1],
            taperHalfWidth,
            angle - 90
        );

        var taperRight = polarToPoint(
            taperStart[0],
            taperStart[1],
            taperHalfWidth,
            angle + 90
        );

        var tipLeft = polarToPoint(tip[0], tip[1], tipHalfWidth, angle - 90);

        var tipRight = polarToPoint(tip[0], tip[1], tipHalfWidth, angle + 90);

        dc.setColor(color, Graphics.COLOR_TRANSPARENT);

        dc.fillPolygon([
            [startLeft[0], startLeft[1]],
            [taperLeft[0], taperLeft[1]],
            [tipLeft[0], tipLeft[1]],
            [tipRight[0], tipRight[1]],
            [taperRight[0], taperRight[1]],
            [startRight[0], startRight[1]],
        ]);

        // Rounded base
        dc.fillCircle(start[0], start[1], halfWidth);

        // Rounded tip
        dc.fillCircle(tip[0], tip[1], tipHalfWidth);
    }

    // ==========================================================
    // Rounded Hollow Window — Hour Hand Only
    // ==========================================================

    function drawTipWindow(dc, centerX, centerY, handLength, angle) {
        var windowEndRadius = handLength - WINDOW_END_OFFSET;

        var windowStartRadius = windowEndRadius - WINDOW_LENGTH;

        var windowStart = polarToPoint(
            centerX,
            centerY,
            windowStartRadius,
            angle
        );

        var windowEnd = polarToPoint(centerX, centerY, windowEndRadius, angle);

        var halfWidth = WINDOW_WIDTH / 2;

        var startLeft = polarToPoint(
            windowStart[0],
            windowStart[1],
            halfWidth,
            angle - 90
        );

        var startRight = polarToPoint(
            windowStart[0],
            windowStart[1],
            halfWidth,
            angle + 90
        );

        var endLeft = polarToPoint(
            windowEnd[0],
            windowEnd[1],
            halfWidth,
            angle - 90
        );

        var endRight = polarToPoint(
            windowEnd[0],
            windowEnd[1],
            halfWidth,
            angle + 90
        );

        dc.setColor(_theme.backgroundColor, Graphics.COLOR_TRANSPARENT);

        dc.fillPolygon([
            [startLeft[0], startLeft[1]],
            [endLeft[0], endLeft[1]],
            [endRight[0], endRight[1]],
            [startRight[0], startRight[1]],
        ]);

        dc.fillCircle(windowStart[0], windowStart[1], halfWidth);

        dc.fillCircle(windowEnd[0], windowEnd[1], halfWidth);
    }

    // ==========================================================
    // Geometry Helpers
    // ==========================================================

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
}
