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
    var _themeManager as ThemeManager;
    var _theme as Theme;
    var _settingsManager as SettingsManager;
    var _isAwake = true;

    function initialize() {
        WatchFace.initialize();

        _settingsManager = new SettingsManager();

        _themeManager = new ThemeManager(_settingsManager.getThemeId());

        _themeManager = new ThemeManager(_settingsManager.getThemeId());
        _theme = _themeManager.getTheme();

        _dataManager = new DataManager();
        _layoutManager = new LayoutManager();
        _backgroundRenderer = new BackgroundRenderer(_theme);
        _dialRenderer = new DialRenderer(_theme);
        _handRenderer = new HandRenderer(_theme);
        _timeRenderer = new TimeRenderer(_dataManager, _layoutManager);
        _centerCapRenderer = new CenterCapRenderer(_theme);
        _logoRenderer = new LogoRenderer(_theme);
    }

    // Load your resources here
    function onLayout(dc as Dc) as Void {
        setLayout(Rez.Layouts.WatchFace(dc));
    }

    function onShow() as Void {}

    // Update the view
    function onUpdate(dc as Dc) as Void {
        _backgroundRenderer.draw(dc);

        if (_isAwake) {
            _logoRenderer.draw(dc);
            _dialRenderer.draw(dc);
        } else {
            _dialRenderer.drawAlwaysOn(dc);
        }

        _handRenderer.draw(dc, _isAwake);

        _centerCapRenderer.draw(dc);
    }

    function onHide() as Void {}

    function onExitSleep() as Void {
        _isAwake = true;
        WatchUi.requestUpdate();
    }

    function onEnterSleep() as Void {
        _isAwake = false;
        WatchUi.requestUpdate();
    }
}
