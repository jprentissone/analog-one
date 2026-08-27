import Toybox.Application;
import Toybox.Background;
import Toybox.Lang;
import Toybox.System;
import Toybox.Time;
import Toybox.WatchUi;

(:background)
class AnalogOneApp extends Application.AppBase {
    var _mainView;

    function initialize() { AppBase.initialize(); }
    function onStart(state as Dictionary?) as Void {}
    function onStop(state as Dictionary?) as Void {}

    function getInitialView() as [Views] or [Views, InputDelegates] {
        var refreshInterval = new Time.Duration(5 * 60);
        var lastRefresh = Background.getLastTemporalEventTime();

        if (lastRefresh != null) {
            Background.registerForTemporalEvent(lastRefresh.add(refreshInterval));
        } else {
            Background.registerForTemporalEvent(Time.now());
        }

        _mainView = new AnalogOneView();
        return [_mainView, new AnalogOneWatchFaceDelegate()];
    }

    function getSettingsView()
        as [WatchUi.Views] or [WatchUi.Views, WatchUi.InputDelegates] or Null {
        var currentSchoolId = new SettingsManager().getSchoolId();
        var menu = new WatchUi.Menu2({ :title => Rez.Strings.SchoolTitle });

        addSchoolMenuItem(menu, Rez.Strings.SchoolAlabama, SchoolIds.ALABAMA, currentSchoolId);
        addSchoolMenuItem(menu, Rez.Strings.SchoolArkansas, SchoolIds.ARKANSAS, currentSchoolId);
        addSchoolMenuItem(menu, Rez.Strings.SchoolAuburn, SchoolIds.AUBURN, currentSchoolId);
        addSchoolMenuItem(menu, Rez.Strings.SchoolFlorida, SchoolIds.FLORIDA, currentSchoolId);
        addSchoolMenuItem(menu, Rez.Strings.SchoolGeorgia, SchoolIds.GEORGIA, currentSchoolId);
        addSchoolMenuItem(menu, Rez.Strings.SchoolKentucky, SchoolIds.KENTUCKY, currentSchoolId);
        addSchoolMenuItem(menu, Rez.Strings.SchoolLSU, SchoolIds.LSU, currentSchoolId);
        addSchoolMenuItem(menu, Rez.Strings.SchoolMississippiState, SchoolIds.MISSISSIPPI_STATE, currentSchoolId);
        addSchoolMenuItem(menu, Rez.Strings.SchoolMissouri, SchoolIds.MISSOURI, currentSchoolId);
        addSchoolMenuItem(menu, Rez.Strings.SchoolOklahoma, SchoolIds.OKLAHOMA, currentSchoolId);
        addSchoolMenuItem(menu, Rez.Strings.SchoolOleMiss, SchoolIds.OLE_MISS, currentSchoolId);
        addSchoolMenuItem(menu, Rez.Strings.SchoolSouthCarolina, SchoolIds.SOUTH_CAROLINA, currentSchoolId);
        addSchoolMenuItem(menu, Rez.Strings.SchoolTennessee, SchoolIds.TENNESSEE, currentSchoolId);
        addSchoolMenuItem(menu, Rez.Strings.SchoolTexas, SchoolIds.TEXAS, currentSchoolId);
        addSchoolMenuItem(menu, Rez.Strings.SchoolTexasAM, SchoolIds.TEXAS_AM, currentSchoolId);
        addSchoolMenuItem(menu, Rez.Strings.SchoolVanderbilt, SchoolIds.VANDERBILT, currentSchoolId);

        return [menu, new SchoolSettingsDelegate()];
    }

    function addSchoolMenuItem(menu, label, schoolId, currentSchoolId) as Void {
        var subLabel = null;
        if (schoolId == currentSchoolId) { subLabel = Rez.Strings.SchoolSelected; }
        menu.addItem(new WatchUi.MenuItem(label, subLabel, schoolId, {}));
    }

    function applySchoolSelection(schoolId) as Void {
        new SettingsManager().setSchoolId(schoolId);
        Application.Storage.deleteValue("sportsData");
        Application.Storage.setValue("sportsRefreshFailed", false);
        scheduleSportsRefresh();
        if (_mainView != null) { _mainView.reloadSchoolTheme(); }
        WatchUi.requestUpdate();
    }

    function scheduleSportsRefresh() as Void {
        var refreshInterval = new Time.Duration(5 * 60);
        var lastRefresh = Background.getLastTemporalEventTime();
        try {
            if (lastRefresh != null) {
                Background.registerForTemporalEvent(lastRefresh.add(refreshInterval));
            } else {
                Background.registerForTemporalEvent(Time.now());
            }
        } catch (error) {
            // Keep the existing schedule if Garmin rejects a nearer event.
        }
    }

    function onSettingsChanged() as Void {
        Application.Storage.deleteValue("sportsData");
        Application.Storage.setValue("sportsRefreshFailed", false);
        scheduleSportsRefresh();
        if (_mainView != null) { _mainView.reloadSchoolTheme(); }
        WatchUi.requestUpdate();
    }

    function getServiceDelegate() as [System.ServiceDelegate] {
        return [new SportsServiceDelegate()];
    }

    function onBackgroundData(data) as Void {
        if (data instanceof Dictionary) {
            if (data["requestFailed"] == true) {
                Application.Storage.setValue("sportsRefreshFailed", true);
            } else {
                Application.Storage.setValue("sportsData", data);
                Application.Storage.setValue("sportsRefreshFailed", false);
            }
        } else {
            Application.Storage.setValue("sportsRefreshFailed", true);
        }
        WatchUi.requestUpdate();
    }
}
