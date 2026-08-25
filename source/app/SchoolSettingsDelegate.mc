import Toybox.WatchUi;

class SchoolSettingsDelegate extends WatchUi.Menu2InputDelegate {
    function initialize() {
        Menu2InputDelegate.initialize();
    }

    function onSelect(item as WatchUi.MenuItem) as Void {
        getApp().applySchoolSelection(item.getId());
        WatchUi.popView(WatchUi.SLIDE_IMMEDIATE);
    }
}
