import Toybox.Graphics;

class LayoutManager {

    function initialize() {
    }

    function getCenterX(dc as Graphics.Dc) {
        return dc.getWidth() / 2;
    }

    function getCenterY(dc as Graphics.Dc) {
        return dc.getHeight() / 2;
    }
}