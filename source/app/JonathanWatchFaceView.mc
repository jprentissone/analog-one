import Toybox.Graphics;
import Toybox.Lang;
import Toybox.System;
import Toybox.WatchUi;

class JonathanWatchFaceView extends WatchUi.WatchFace {

    var _timeRenderer as TimeRenderer;
    var _dataManager as DataManager;
    var _layoutManager as LayoutManager;

    function initialize() {
        WatchFace.initialize();

        _dataManager = new DataManager();
        _layoutManager = new LayoutManager();

        _timeRenderer = new TimeRenderer(
            _dataManager,
            _layoutManager
        );
    }

    // Load your resources here
    function onLayout(dc as Dc) as Void {
        setLayout(Rez.Layouts.WatchFace(dc));
    }

    function onShow() as Void {
    }

    // Update the view
    function onUpdate(dc as Dc) as Void {
        dc.clear();
        _timeRenderer.draw(dc);
    }

    function onHide() as Void {
    }

    // The user has just looked at their watch.
    function onExitSleep() as Void {
    }

    // Prepare for slow updates.
    function onEnterSleep() as Void {
    }

}