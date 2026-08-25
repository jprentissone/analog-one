import Toybox.Graphics;
import Toybox.Lang;

class DateRenderer {
    // ==========================================================
    // Complication Position
    // ==========================================================

    const DATE_OFFSET_X = 0;
    const DATE_OFFSET_Y = 130;

    // ==========================================================
    // Renderer
    // ==========================================================

    var _complicationRenderer as ComplicationRenderer;

    function initialize(theme as Theme) {
        _complicationRenderer = new ComplicationRenderer(theme);
    }

    function draw(dc as Graphics.Dc, dateData as DateData) {
        var centerX = dc.getWidth() / 2 + DATE_OFFSET_X;
        var centerY = dc.getHeight() / 2 + DATE_OFFSET_Y;

        var dateText = Lang.format("$1$ $2$", [
            dateData.weekday,
            dateData.dayOfMonth,
        ]);

        _complicationRenderer.draw(
            dc,
            centerX,
            centerY,
            ComplicationIcons.CALENDAR,
            dateText
        );
    }
}
