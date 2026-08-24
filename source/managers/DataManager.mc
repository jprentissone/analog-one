import Toybox.ActivityMonitor;
import Toybox.System;
import Toybox.Time;
import Toybox.Time.Gregorian;

class DataManager {
    function initialize() {}

    function getClockTime() {
        return System.getClockTime();
    }

    function getWatchFaceData() {
        var dateInfo = Gregorian.info(Time.now(), Time.FORMAT_MEDIUM);

        var dateData = new DateData(dateInfo.day_of_week, dateInfo.day);

        var activityInfo = ActivityMonitor.getInfo();
        var steps = 0;
        var stepsAvailable = false;

        if (activityInfo.steps != null) {
            steps = activityInfo.steps;
            stepsAvailable = true;
        }

        var activityData = new ActivityData(steps, stepsAvailable);

        // Weather integration will be added in a later lesson.
        var weatherData = new WeatherData(0, 0, false);

        // NCAA score integration will be added in a later lesson.
        var sportsData = new SportsData("", 0, "", 0, "", false);

        return new WatchFaceData(
            weatherData,
            dateData,
            activityData,
            sportsData
        );
    }
}
