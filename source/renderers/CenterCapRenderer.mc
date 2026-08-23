import Toybox.Graphics;

class CenterCapRenderer {

    // ==========================================================
    // Center Cap Layout
    // ==========================================================

    const CAP_OUTER_RADIUS = 11;
    const CAP_WHITE_RADIUS = 9;
    const CAP_BLACK_RING_RADIUS = 7;
    const CAP_RED_RADIUS = 5;
    const CAP_HOLLOW_RADIUS = 3;

    // ==========================================================
    // Colors
    // ==========================================================

    const CAP_OUTER_COLOR = Graphics.COLOR_DK_GRAY;
    const CAP_WHITE_COLOR = Graphics.COLOR_WHITE;
    const CAP_BLACK_COLOR = Graphics.COLOR_BLACK;
    const CAP_RED_COLOR = Graphics.COLOR_RED;
    const CAP_CENTER_COLOR = Graphics.COLOR_BLACK;

    function initialize() {
    }

    function draw(dc as Graphics.Dc) {

        var centerX = dc.getWidth() / 2;
        var centerY = dc.getHeight() / 2;

        drawCenterCap(
            dc,
            centerX,
            centerY
        );
    }

    function drawCenterCap(
        dc,
        centerX,
        centerY
    ) {

        // Outer dark rim
        dc.setColor(
            CAP_OUTER_COLOR,
            Graphics.COLOR_TRANSPARENT
        );

        dc.fillCircle(
            centerX,
            centerY,
            CAP_OUTER_RADIUS
        );

        // White ring
        dc.setColor(
            CAP_WHITE_COLOR,
            Graphics.COLOR_TRANSPARENT
        );

        dc.fillCircle(
            centerX,
            centerY,
            CAP_WHITE_RADIUS
        );

        // Black separation ring
        dc.setColor(
            CAP_BLACK_COLOR,
            Graphics.COLOR_TRANSPARENT
        );

        dc.fillCircle(
            centerX,
            centerY,
            CAP_BLACK_RING_RADIUS
        );

        // Red accent ring
        dc.setColor(
            CAP_RED_COLOR,
            Graphics.COLOR_TRANSPARENT
        );

        dc.fillCircle(
            centerX,
            centerY,
            CAP_RED_RADIUS
        );

        // Hollow center
        dc.setColor(
            CAP_CENTER_COLOR,
            Graphics.COLOR_TRANSPARENT
        );

        dc.fillCircle(
            centerX,
            centerY,
            CAP_HOLLOW_RADIUS
        );
    }
}