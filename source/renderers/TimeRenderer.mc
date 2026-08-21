import Toybox.Graphics;
import Toybox.Lang;

class TimeRenderer {

    var _dataManager;

    function initialize(dataManager) {
        _dataManager = dataManager;
    }

    function draw(dc as Dc) as Void {

        var clockTime = _dataManager.getClockTime();

        var timeString = Lang.format(
            "$1$:$2$",
            [
                clockTime.hour,
                clockTime.min.format("%02d")
            ]
        );

        dc.setColor(Graphics.COLOR_BLUE, Graphics.COLOR_TRANSPARENT);

        dc.drawText(
            dc.getWidth()/2,
            dc.getHeight()/2,
            Graphics.FONT_SMALL,
            timeString,
            Graphics.TEXT_JUSTIFY_CENTER
        );
    }
}