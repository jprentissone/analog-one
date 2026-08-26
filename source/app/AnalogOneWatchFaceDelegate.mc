import Toybox.Complications;
import Toybox.Lang;
import Toybox.WatchUi;

class AnalogOneWatchFaceDelegate extends WatchUi.WatchFaceDelegate {
    // The current release supports the 454 x 454 fēnix 8 target.
    const STEPS_CENTER_X = 101;
    const STEPS_CENTER_Y = 300;
    const DATE_CENTER_X = 227;
    const DATE_CENTER_Y = 377;
    const WEATHER_CENTER_X = 353;
    const WEATHER_CENTER_Y = 300;
    // Slightly larger than the visible circles for reliable wrist interaction.
    const COMPLICATION_RADIUS = 62;

    var _stepsComplicationId as Complications.Id;
    var _dateComplicationId as Complications.Id;
    var _weatherComplicationId as Complications.Id;

    function initialize() {
        WatchFaceDelegate.initialize();

        _stepsComplicationId = new Complications.Id(
            Complications.COMPLICATION_TYPE_STEPS
        );
        _dateComplicationId = new Complications.Id(
            Complications.COMPLICATION_TYPE_WEEKDAY_MONTHDAY
        );
        _weatherComplicationId = new Complications.Id(
            Complications.COMPLICATION_TYPE_CURRENT_WEATHER
        );
    }

    function onPress(clickEvent as WatchUi.ClickEvent) as Lang.Boolean {
        var coordinates = clickEvent.getCoordinates();

        if (isInsideCircle(
            coordinates[0],
            coordinates[1],
            STEPS_CENTER_X,
            STEPS_CENTER_Y
        )) {
            return launchComplication(_stepsComplicationId);
        }

        if (isInsideCircle(
            coordinates[0],
            coordinates[1],
            DATE_CENTER_X,
            DATE_CENTER_Y
        )) {
            return launchComplication(_dateComplicationId);
        }

        if (isInsideCircle(
            coordinates[0],
            coordinates[1],
            WEATHER_CENTER_X,
            WEATHER_CENTER_Y
        )) {
            return launchComplication(_weatherComplicationId);
        }

        return false;
    }

    function launchComplication(complicationId as Complications.Id)
        as Lang.Boolean {
        try {
            Complications.exitTo(complicationId);
            return true;
        } catch (error) {
            return false;
        }
    }

    function isInsideCircle(x, y, centerX, centerY) as Lang.Boolean {
        var deltaX = x - centerX;
        var deltaY = y - centerY;

        return deltaX * deltaX + deltaY * deltaY <=
            COMPLICATION_RADIUS * COMPLICATION_RADIUS;
    }
}
