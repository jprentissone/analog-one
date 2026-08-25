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
    const RADIUS = 50;

    var _theme as Theme;

    var _valueFont;
    var _compactValueFont;
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
        _compactValueFont = null;
        _detailFont = null;

        if (Graphics has :getVectorFont) {
            var valueSize = (dc.getWidth() * 23) / 454;
            var detailSize = (dc.getWidth() * 14) / 454;

            _valueFont = Graphics.getVectorFont({
                :face => ["RobotoCondensedRegular", "RobotoRegular"],
                :size => valueSize,
            });

            _compactValueFont = Graphics.getVectorFont({
                :face => ["RobotoCondensedRegular", "RobotoRegular"],
                :size => (dc.getWidth() * 18) / 454,
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

        if (_compactValueFont == null) {
            _compactValueFont = _detailFont;
        }

        _fontsReady = true;
    }

    function draw(dc as Graphics.Dc, centerX, centerY, iconType, value) {
        configureFonts(dc);

        dc.setPenWidth(1);

        dc.setColor(_theme.complicationBorderColor, Graphics.COLOR_TRANSPARENT);

        dc.drawCircle(centerX, centerY, RADIUS);

        drawIcon(dc, centerX, centerY - 15, iconType);

        dc.setColor(_theme.complicationValueColor, Graphics.COLOR_TRANSPARENT);

        dc.drawText(
            centerX,
            centerY + 16,
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

        drawIcon(dc, centerX, centerY - 24, iconType);

        dc.setColor(_theme.complicationValueColor, Graphics.COLOR_TRANSPARENT);

        dc.drawText(
            centerX,
            centerY + 2,
            _valueFont,
            value,
            Graphics.TEXT_JUSTIFY_CENTER | Graphics.TEXT_JUSTIFY_VCENTER
        );

        dc.setColor(_theme.complicationLabelColor, Graphics.COLOR_TRANSPARENT);

        dc.drawText(
            centerX,
            centerY + 27,
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
        var left = centerX - 9;
        var top = centerY - 9;
        var width = 18;
        var height = 18;

        dc.setColor(_theme.complicationIconColor, Graphics.COLOR_TRANSPARENT);

        dc.drawRectangle(left, top + 2, width, height - 2);

        dc.drawLine(left, top + 7, left + width, top + 7);

        dc.drawLine(left + 5, top, left + 5, top + 5);

        dc.drawLine(left + width - 5, top, left + width - 5, top + 5);
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

    function drawScore(
        dc as Graphics.Dc,
        centerX,
        centerY,
        awayText,
        homeText,
        statusText,
        awayIsFeatured
    ) {
        configureFonts(dc);

        dc.setPenWidth(1);

        dc.setColor(_theme.complicationBorderColor, Graphics.COLOR_TRANSPARENT);

        dc.drawCircle(centerX, centerY, RADIUS);

        if (awayIsFeatured) {
            dc.setColor(
                _theme.complicationIconColor,
                Graphics.COLOR_TRANSPARENT
            );
        } else {
            dc.setColor(
                _theme.complicationValueColor,
                Graphics.COLOR_TRANSPARENT
            );
        }

        dc.drawText(
            centerX,
            centerY - 19,
            getScoreFont(awayText),
            awayText,
            Graphics.TEXT_JUSTIFY_CENTER | Graphics.TEXT_JUSTIFY_VCENTER
        );

        if (awayIsFeatured) {
            dc.setColor(
                _theme.complicationValueColor,
                Graphics.COLOR_TRANSPARENT
            );
        } else {
            dc.setColor(
                _theme.complicationIconColor,
                Graphics.COLOR_TRANSPARENT
            );
        }

        dc.drawText(
            centerX,
            centerY + 2,
            getScoreFont(homeText),
            homeText,
            Graphics.TEXT_JUSTIFY_CENTER | Graphics.TEXT_JUSTIFY_VCENTER
        );

        dc.setColor(_theme.complicationLabelColor, Graphics.COLOR_TRANSPARENT);

        dc.drawText(
            centerX,
            centerY + 24,
            _detailFont,
            statusText,
            Graphics.TEXT_JUSTIFY_CENTER | Graphics.TEXT_JUSTIFY_VCENTER
        );

        dc.setPenWidth(1);
    }

    function getScoreFont(text) {
        if (text.length() > 7) {
            return _compactValueFont;
        }

        return _valueFont;
    }

    function drawStepsIcon(dc as Graphics.Dc, centerX, centerY) {
        dc.setColor(_theme.complicationIconColor, Graphics.COLOR_TRANSPARENT);

        // Left footprint
        dc.fillCircle(centerX - 5, centerY + 3, 4);

        dc.fillCircle(centerX - 6, centerY - 5, 3);

        // Right footprint
        dc.fillCircle(centerX + 5, centerY - 2, 4);

        dc.fillCircle(centerX + 6, centerY - 10, 3);
    }

    function setIconColor(dc as Graphics.Dc) {
        dc.setColor(_theme.complicationIconColor, Graphics.COLOR_TRANSPARENT);
    }

    function drawSunIcon(dc as Graphics.Dc, centerX, centerY) {
        dc.setColor(AnalogColors.WEATHER_SUN, Graphics.COLOR_TRANSPARENT);

        dc.drawCircle(centerX, centerY, 5);

        dc.drawLine(centerX, centerY - 11, centerX, centerY - 7);
        dc.drawLine(centerX, centerY + 7, centerX, centerY + 11);
        dc.drawLine(centerX - 11, centerY, centerX - 7, centerY);
        dc.drawLine(centerX + 7, centerY, centerX + 11, centerY);

        dc.drawLine(centerX - 8, centerY - 8, centerX - 5, centerY - 5);

        dc.drawLine(centerX + 5, centerY + 5, centerX + 8, centerY + 8);

        dc.drawLine(centerX + 5, centerY - 5, centerX + 8, centerY - 8);

        dc.drawLine(centerX - 8, centerY + 8, centerX - 5, centerY + 5);
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
