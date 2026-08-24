import Toybox.Graphics;

module ComplicationIcons {
    const CALENDAR = 0;
    const STEPS = 1;

    const WEATHER_CLEAR = 2;
    const WEATHER_CLOUDY = 3;
    const WEATHER_RAIN = 4;
    const WEATHER_SNOW = 5;
    const WEATHER_PARTLY_CLOUDY = 6;
}

class ComplicationRenderer {
    const RADIUS = 42;

    var _theme as Theme;

    var _valueFont;
    var _fontsReady = false;

    var _detailFont;

    function initialize(theme as Theme) {
        _theme = theme;
    }

    function configureFonts(dc as Graphics.Dc) {
        if (_fontsReady) {
            return;
        }

        _valueFont = null;
        _detailFont = null;

        if (Graphics has :getVectorFont) {
            var valueSize = (dc.getWidth() * 18) / 454;
            var detailSize = (dc.getWidth() * 12) / 454;

            _valueFont = Graphics.getVectorFont({
                :face => ["RobotoCondensedRegular", "RobotoRegular"],
                :size => valueSize,
            });

            _detailFont = Graphics.getVectorFont({
                :face => ["RobotoCondensedRegular", "RobotoRegular"],
                :size => detailSize,
            });
        }

        if (_valueFont == null) {
            _valueFont = Graphics.FONT_XTINY;
        }

        if (_detailFont == null) {
            _detailFont = Graphics.FONT_XTINY;
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

    function drawWithDetail(
        dc as Graphics.Dc,
        centerX,
        centerY,
        iconType,
        value,
        detail
    ) {
        configureFonts(dc);

        dc.setPenWidth(1);

        dc.setColor(_theme.complicationBorderColor, Graphics.COLOR_TRANSPARENT);

        dc.drawCircle(centerX, centerY, RADIUS);

        drawIcon(dc, centerX, centerY - 21, iconType);

        dc.setColor(_theme.complicationValueColor, Graphics.COLOR_TRANSPARENT);

        dc.drawText(
            centerX,
            centerY + 1,
            _valueFont,
            value,
            Graphics.TEXT_JUSTIFY_CENTER | Graphics.TEXT_JUSTIFY_VCENTER
        );

        dc.setColor(_theme.complicationLabelColor, Graphics.COLOR_TRANSPARENT);

        dc.drawText(
            centerX,
            centerY + 22,
            _detailFont,
            detail,
            Graphics.TEXT_JUSTIFY_CENTER | Graphics.TEXT_JUSTIFY_VCENTER
        );

        dc.setPenWidth(1);
    }

    function drawBattery(
        dc as Graphics.Dc,
        centerX,
        centerY,
        value,
        percentage,
        isCharging
    ) {
        configureFonts(dc);

        dc.setPenWidth(1);

        dc.setColor(_theme.complicationBorderColor, Graphics.COLOR_TRANSPARENT);

        dc.drawCircle(centerX, centerY, RADIUS);

        drawBatteryIcon(dc, centerX, centerY - 12, percentage, isCharging);

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
        } else if (iconType == ComplicationIcons.WEATHER_CLEAR) {
            drawSunIcon(dc, centerX, centerY);
        } else if (iconType == ComplicationIcons.WEATHER_PARTLY_CLOUDY) {
            drawPartlyCloudyIcon(dc, centerX, centerY);
        } else if (iconType == ComplicationIcons.WEATHER_CLOUDY) {
            drawCloudIcon(dc, centerX, centerY);
        } else if (iconType == ComplicationIcons.WEATHER_RAIN) {
            drawRainIcon(dc, centerX, centerY);
        } else if (iconType == ComplicationIcons.WEATHER_SNOW) {
            drawSnowIcon(dc, centerX, centerY);
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

    function drawBatteryIcon(
        dc as Graphics.Dc,
        centerX,
        centerY,
        percentage,
        isCharging
    ) {
        var iconColor = _theme.complicationValueColor;

        if (isCharging) {
            iconColor = AnalogColors.BATTERY_CHARGING;
        } else if (percentage <= 10) {
            iconColor = AnalogColors.BATTERY_CRITICAL;
        } else if (percentage <= 20) {
            iconColor = AnalogColors.BATTERY_WARNING;
        }

        dc.setColor(iconColor, Graphics.COLOR_TRANSPARENT);

        var left = centerX - 9;
        var top = centerY - 5;
        var width = 16;
        var height = 10;

        // Horizontal battery body
        dc.drawRectangle(left, top, width, height);

        // Positive terminal
        dc.fillRectangle(left + width, centerY - 2, 2, 4);

        // Charge-level fill
        var fillWidth = ((width - 4) * percentage) / 100;

        if (fillWidth > 0) {
            dc.fillRectangle(left + 2, top + 2, fillWidth, height - 4);
        }
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

    function setIconColor(dc as Graphics.Dc) {
        dc.setColor(_theme.complicationIconColor, Graphics.COLOR_TRANSPARENT);
    }

    function drawSunIcon(dc as Graphics.Dc, centerX, centerY) {
        dc.setColor(AnalogColors.WEATHER_SUN, Graphics.COLOR_TRANSPARENT);

        dc.drawCircle(centerX, centerY, 4);

        dc.drawLine(centerX, centerY - 9, centerX, centerY - 6);
        dc.drawLine(centerX, centerY + 6, centerX, centerY + 9);
        dc.drawLine(centerX - 9, centerY, centerX - 6, centerY);
        dc.drawLine(centerX + 6, centerY, centerX + 9, centerY);

        dc.drawLine(centerX - 6, centerY - 6, centerX - 4, centerY - 4);

        dc.drawLine(centerX + 4, centerY + 4, centerX + 6, centerY + 6);

        dc.drawLine(centerX + 4, centerY - 4, centerX + 6, centerY - 6);

        dc.drawLine(centerX - 6, centerY + 6, centerX - 4, centerY + 4);
    }

    function drawPartlyCloudyIcon(dc as Graphics.Dc, centerX, centerY) {
        dc.setColor(AnalogColors.WEATHER_SUN, Graphics.COLOR_TRANSPARENT);

        dc.drawCircle(centerX + 4, centerY - 4, 3);

        dc.drawLine(centerX + 4, centerY - 9, centerX + 4, centerY - 8);

        dc.drawLine(centerX + 8, centerY - 4, centerX + 10, centerY - 4);

        dc.drawLine(centerX + 7, centerY - 7, centerX + 9, centerY - 9);

        drawCloudIcon(dc, centerX - 2, centerY + 2);
    }

    function drawCloudIcon(dc as Graphics.Dc, centerX, centerY) {
        dc.setColor(AnalogColors.WEATHER_CLOUD, Graphics.COLOR_TRANSPARENT);

        dc.drawCircle(centerX - 4, centerY, 4);
        dc.drawCircle(centerX + 3, centerY - 2, 5);

        dc.drawLine(centerX - 8, centerY + 4, centerX + 8, centerY + 4);
    }

    function drawRainIcon(dc as Graphics.Dc, centerX, centerY) {
        drawCloudIcon(dc, centerX, centerY - 2);

        dc.setColor(AnalogColors.WEATHER_RAIN, Graphics.COLOR_TRANSPARENT);

        dc.drawLine(centerX - 5, centerY + 5, centerX - 7, centerY + 9);

        dc.drawLine(centerX, centerY + 5, centerX - 2, centerY + 9);

        dc.drawLine(centerX + 5, centerY + 5, centerX + 3, centerY + 9);
    }

    function drawSnowIcon(dc as Graphics.Dc, centerX, centerY) {
        drawCloudIcon(dc, centerX, centerY - 3);

        dc.setColor(AnalogColors.WEATHER_SNOW, Graphics.COLOR_TRANSPARENT);

        dc.drawLine(centerX - 5, centerY + 5, centerX - 5, centerY + 9);

        dc.drawLine(centerX - 7, centerY + 7, centerX - 3, centerY + 7);

        dc.drawLine(centerX + 4, centerY + 5, centerX + 4, centerY + 9);

        dc.drawLine(centerX + 2, centerY + 7, centerX + 6, centerY + 7);
    }
}
