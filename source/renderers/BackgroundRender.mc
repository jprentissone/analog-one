import Toybox.Graphics;

class BackgroundRenderer {

    function initialize() {
    }

    function draw(dc as Graphics.Dc) {

        dc.setColor(
            Graphics.COLOR_BLACK,
            Graphics.COLOR_BLACK
        );

        dc.clear();

    }

}