import Toybox.Application;
import Toybox.Background;
import Toybox.Lang;
import Toybox.System;
import Toybox.Time;
import Toybox.WatchUi;

(:background)
class AnalogOneApp extends Application.AppBase {

    function initialize() {
        AppBase.initialize();
    }

    // onStart() is called on application start up
    function onStart(state as Dictionary?) as Void {
    }

    // onStop() is called when your application is exiting
    function onStop(state as Dictionary?) as Void {
    }

    // Return the initial view of your application here
    function getInitialView() as [Views] or [Views, InputDelegates] {
        if (Background.getTemporalEventRegisteredTime() == null) {
            Background.registerForTemporalEvent(new Time.Duration(5 * 60));
        }

        return [ new AnalogOneView() ];
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
