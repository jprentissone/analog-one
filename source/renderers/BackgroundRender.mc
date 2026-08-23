import Toybox.Graphics;

class BackgroundRenderer {
    var _theme as Theme;

    function initialize(theme as Theme) {
        _theme = theme;
    }

    function draw(dc as Graphics.Dc) {
        dc.setColor(_theme.backgroundColor, _theme.backgroundColor);

        dc.clear();
    }
}
