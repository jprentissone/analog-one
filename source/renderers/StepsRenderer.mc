import Toybox.Graphics;
import Toybox.Lang;

class StepsRenderer {
    // ==========================================================
    // Complication Position
    // ==========================================================

    const STEPS_OFFSET_X = -139;
    const STEPS_OFFSET_Y = -51;

    // ==========================================================
    // Renderer
    // ==========================================================

    var _complicationRenderer as ComplicationRenderer;

    function initialize(theme as Theme) {
        _complicationRenderer = new ComplicationRenderer(theme);
    }

    function draw(dc as Graphics.Dc, activityData as ActivityData) {
        if (!activityData.isAvailable) {
            return;
        }

        var centerX = dc.getWidth() / 2 + STEPS_OFFSET_X;
        var centerY = dc.getHeight() / 2 + STEPS_OFFSET_Y;

        var stepsText = Lang.format("$1$", [activityData.steps]);

        _complicationRenderer.draw(
            dc,
            centerX,
            centerY,
            ComplicationIcons.STEPS,
            stepsText
        );
    }
}
