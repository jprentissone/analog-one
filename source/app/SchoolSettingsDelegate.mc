import Toybox.Application;
import Toybox.WatchUi;

class SchoolSettingsDelegate extends WatchUi.Menu2InputDelegate {
    function initialize() {
        Menu2InputDelegate.initialize();
    }

    function onSelect(item as WatchUi.MenuItem) as Void {
        Application.getApp().applySchoolSelection(item.getId());
        WatchUi.popView(WatchUi.SLIDE_IMMEDIATE);
    }
}
