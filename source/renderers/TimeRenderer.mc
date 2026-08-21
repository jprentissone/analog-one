import Toybox.Graphics;
import Toybox.Lang;

class TimeRenderer {

	var _dataManager;
	var _layoutManager;

    function initialize(dataManager, layoutManager) {

    _dataManager = dataManager;
    _layoutManager = layoutManager;

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
    _layoutManager.getCenterX(dc),
    _layoutManager.getCenterY(dc),
    Graphics.FONT_SMALL,
    timeString,
    Graphics.TEXT_JUSTIFY_CENTER
);
    }
}