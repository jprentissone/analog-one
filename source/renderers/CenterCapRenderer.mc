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

    var _theme as Theme;

    function initialize(theme as Theme) {
        _theme = theme;
    }

    function draw(dc as Graphics.Dc, offsetX, offsetY) {
        var centerX = dc.getWidth() / 2 + offsetX;
        var centerY = dc.getHeight() / 2 + offsetY;

        drawCenterCap(dc, centerX, centerY);
    }

    function drawCenterCap(dc, centerX, centerY) {
        // Outer dark rim
        dc.setColor(_theme.handBorderColor, Graphics.COLOR_TRANSPARENT);

        dc.fillCircle(centerX, centerY, CAP_OUTER_RADIUS);

        // White ring
        dc.setColor(_theme.handColor, Graphics.COLOR_TRANSPARENT);

        dc.fillCircle(centerX, centerY, CAP_WHITE_RADIUS);

        // Black separation ring
        dc.setColor(_theme.backgroundColor, Graphics.COLOR_TRANSPARENT);

        dc.fillCircle(centerX, centerY, CAP_BLACK_RING_RADIUS);

        // Red accent ring
        dc.setColor(_theme.accentColor, Graphics.COLOR_TRANSPARENT);

        dc.fillCircle(centerX, centerY, CAP_RED_RADIUS);

        // Hollow center
        dc.setColor(_theme.backgroundColor, Graphics.COLOR_TRANSPARENT);

        dc.fillCircle(centerX, centerY, CAP_HOLLOW_RADIUS);
    }
}
