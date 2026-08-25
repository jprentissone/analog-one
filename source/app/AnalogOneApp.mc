import Toybox.Application;
import Toybox.Background;
import Toybox.Lang;
import Toybox.System;
import Toybox.Time;
import Toybox.WatchUi;

(:background)
class AnalogOneApp extends Application.AppBase {
    var _mainView;

    function initialize() {
        AppBase.initialize();
    }

    // onStart() is called on application start up
    function onStart(state as Dictionary?) as Void {}

    // onStop() is called when your application is exiting
    function onStop(state as Dictionary?) as Void {}

    // Return the initial view of your application here
    function getInitialView() as [Views] or [Views, InputDelegates] {
        var refreshInterval = new Time.Duration(5 * 60);
        var lastRefresh = Background.getLastTemporalEventTime();

        if (lastRefresh != null) {
            Background.registerForTemporalEvent(
                lastRefresh.add(refreshInterval)
            );
        } else {
            Background.registerForTemporalEvent(Time.now());
        }

        _mainView = new AnalogOneView();
        return [_mainView];
    }

    function getSettingsView()
        as [WatchUi.Views] or [WatchUi.Views, WatchUi.InputDelegates] or Null {
        var currentSchoolId = new SettingsManager().getSchoolId();
        var menu = new WatchUi.Menu2({
            :title => Rez.Strings.SchoolTitle,
        });

        addSchoolMenuItem(
            menu,
            Rez.Strings.SchoolOhioState,
            SchoolIds.OHIO_STATE,
            currentSchoolId
        );
        addSchoolMenuItem(
            menu,
            Rez.Strings.SchoolMichigan,
            SchoolIds.MICHIGAN,
            currentSchoolId
        );
        addSchoolMenuItem(
            menu,
            Rez.Strings.SchoolPennState,
            SchoolIds.PENN_STATE,
            currentSchoolId
        );

        return [menu, new SchoolSettingsDelegate()];
    }

    function addSchoolMenuItem(menu, label, schoolId, currentSchoolId) as Void {
        var subLabel = null;

        if (schoolId == currentSchoolId) {
            subLabel = Rez.Strings.SchoolSelected;
        }

        menu.addItem(
            new WatchUi.MenuItem(label, subLabel, schoolId, {})
        );
    }

    function applySchoolSelection(schoolId) as Void {
        new SettingsManager().setSchoolId(schoolId);
        Application.Storage.deleteValue("sportsData");

        if (_mainView != null) {
            _mainView.reloadSchoolTheme();
        }

        WatchUi.requestUpdate();
    }

    function onSettingsChanged() as Void {
        if (_mainView != null) {
            _mainView.reloadSchoolTheme();
        }

        WatchUi.requestUpdate();
    }

    function getServiceDelegate() as [System.ServiceDelegate] {
        return [new SportsServiceDelegate()];
    }

    function onBackgroundData(data) as Void {
        if (data instanceof Dictionary) {
            Application.Storage.setValue("sportsData", data);
            WatchUi.requestUpdate();
        }
    }
}

function getApp() as AnalogOneApp {
    return Application.getApp() as AnalogOneApp;
}
