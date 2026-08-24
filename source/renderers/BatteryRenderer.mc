import Toybox.Graphics;
import Toybox.Lang;
import Toybox.Math;

class BatteryRenderer {
    const BATTERY_OFFSET_X = 139;
    const BATTERY_OFFSET_Y = -51;

    var _complicationRenderer as ComplicationRenderer;

    function initialize(theme as Theme) {
        _complicationRenderer =
            new ComplicationRenderer(theme);
    }

    function draw(
        dc as Graphics.Dc,
        batteryData as BatteryData
    ) {
        var centerX =
            dc.getWidth() / 2 + BATTERY_OFFSET_X;

        var centerY =
            dc.getHeight() / 2 + BATTERY_OFFSET_Y;

        var valueText =
            getBatteryText(batteryData);

        _complicationRenderer.drawBattery(
            dc,
            centerX,
            centerY,
            valueText,
            batteryData.percentage,
            batteryData.isCharging
        );
    }

    function getBatteryText(
        batteryData as BatteryData
    ) {
        if (batteryData.isCharging) {
            return "CHG";
        }

        if (batteryData.hasDaysEstimate) {
            if (batteryData.daysRemaining >= 10.0) {
                var roundedDays =
                    Math.round(
                        batteryData.daysRemaining
                    ).toNumber();

                return Lang.format(
                    "$1$d",
                    [roundedDays]
                );
            }

            var formattedDays =
                batteryData.daysRemaining.format("%.1f");

            return Lang.format(
                "$1$d",
                [formattedDays]
            );
        }

        return Lang.format(
            "$1$%",
            [batteryData.percentage]
        );
    }
}