import Toybox.Graphics;
import Toybox.Lang;
import Toybox.System;
import Toybox.WatchUi;

class AnalogOneView extends WatchUi.WatchFace {
    var _timeRenderer as TimeRenderer;
    var _dataManager as DataManager;
    var _layoutManager as LayoutManager;
    var _backgroundRenderer as BackgroundRenderer;
    var _dialRenderer as DialRenderer;
    var _handRenderer as HandRenderer;
    var _centerCapRenderer as CenterCapRenderer;
    var _logoRenderer as LogoRenderer;

    function initialize() {
        WatchFace.initialize();

        _dataManager = new DataManager();
        _layoutManager = new LayoutManager();
        _backgroundRenderer = new BackgroundRenderer();
        _dialRenderer = new DialRenderer();
        _handRenderer = new HandRenderer();
        _timeRenderer = new TimeRenderer(_dataManager, _layoutManager);
        _centerCapRenderer = new CenterCapRenderer();
        _logoRenderer = new LogoRenderer();
    }

    // Load your resources here
    function onLayout(dc as Dc) as Void {
        setLayout(Rez.Layouts.WatchFace(dc));
    }

    function onShow() as Void {}

    // Update the view
    function onUpdate(dc as Dc) as Void {
        _backgroundRenderer.draw(dc);

        _logoRenderer.draw(dc);

        _dialRenderer.draw(dc);

        _handRenderer.draw(dc);

        _centerCapRenderer.draw(dc);
    }

    function onHide() as Void {}

    // The user has just looked at their watch.
    function onExitSleep() as Void {}

    // Prepare for slow updates.
    function onEnterSleep() as Void {}
}
