import Toybox.Graphics;

module ComplicationIcons {
    const CALENDAR = 0;
    const STEPS = 1;
}

class ComplicationRenderer {
    const RADIUS = 42;

    var _theme as Theme;

    var _valueFont;
    var _fontsReady = false;

    function initialize(theme as Theme) {
        _theme = theme;
    }

    function configureFonts(dc as Graphics.Dc) {
        if (_fontsReady) {
            return;
        }

        _valueFont = null;

        if (Graphics has :getVectorFont) {
            var valueSize = (dc.getWidth() * 18) / 454;

            _valueFont = Graphics.getVectorFont({
                :face => ["RobotoCondensedRegular", "RobotoRegular"],
                :size => valueSize,
            });
        }

        if (_valueFont == null) {
            _valueFont = Graphics.FONT_XTINY;
        }

        _fontsReady = true;
    }

    function draw(dc as Graphics.Dc, centerX, centerY, iconType, value) {
        configureFonts(dc);

        dc.setPenWidth(1);

        dc.setColor(_theme.complicationBorderColor, Graphics.COLOR_TRANSPARENT);

        dc.drawCircle(centerX, centerY, RADIUS);

        drawIcon(dc, centerX, centerY - 12, iconType);

        dc.setColor(_theme.complicationValueColor, Graphics.COLOR_TRANSPARENT);

        dc.drawText(
            centerX,
            centerY + 12,
            _valueFont,
            value,
            Graphics.TEXT_JUSTIFY_CENTER | Graphics.TEXT_JUSTIFY_VCENTER
        );

        dc.setPenWidth(1);
    }

    function drawIcon(dc as Graphics.Dc, centerX, centerY, iconType) {
        if (iconType == ComplicationIcons.CALENDAR) {
            drawCalendarIcon(dc, centerX, centerY);
        } else if (iconType == ComplicationIcons.STEPS) {
            drawStepsIcon(dc, centerX, centerY);
        }
    }

    function drawCalendarIcon(dc as Graphics.Dc, centerX, centerY) {
        var left = centerX - 7;
        var top = centerY - 7;
        var width = 14;
        var height = 14;

        dc.setColor(_theme.complicationIconColor, Graphics.COLOR_TRANSPARENT);

        dc.drawRectangle(left, top + 2, width, height - 2);

        dc.drawLine(left, top + 6, left + width, top + 6);

        dc.drawLine(left + 4, top, left + 4, top + 4);

        dc.drawLine(left + width - 4, top, left + width - 4, top + 4);
    }

    function drawStepsIcon(dc as Graphics.Dc, centerX, centerY) {
        dc.setColor(_theme.complicationIconColor, Graphics.COLOR_TRANSPARENT);

        // Left footprint
        dc.fillCircle(centerX - 4, centerY + 2, 3);

        dc.fillCircle(centerX - 5, centerY - 4, 2);

        // Right footprint
        dc.fillCircle(centerX + 4, centerY - 2, 3);

        dc.fillCircle(centerX + 5, centerY - 8, 2);
    }
}
