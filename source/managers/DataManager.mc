import Toybox.ActivityMonitor;
import Toybox.System;
import Toybox.Time;
import Toybox.Time.Gregorian;
import Toybox.Weather;
import Toybox.Math;

class DataManager {
    var _sportsService as SportsService;

    function initialize() {
        _sportsService = new SportsService();
    }

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

        var batteryData = getBatteryData();

        var weatherData = getWeatherData();

        // NCAA score integration
        var sportsData = getSportsData();

        return new WatchFaceData(
            weatherData,
            dateData,
            activityData,
            batteryData,
            sportsData
        );
    }

    function getSportsData() {
        return _sportsService.parseResponse(null);
    }

    function getWeatherData() {
        var currentConditions = Weather.getCurrentConditions();

        if (currentConditions == null) {
            return new WeatherData(0, -1, false);
        }

        var currentTemperature = currentConditions.temperature;

        if (currentTemperature == null) {
            return new WeatherData(0, -1, false);
        }

        var temperature = currentTemperature.toFloat();

        if (System.getDeviceSettings().temperatureUnits != System.UNIT_METRIC) {
            temperature = (temperature * 9.0) / 5.0 + 32.0;
        }

        var roundedTemperature = Math.round(temperature).toNumber();

        var conditionCode = -1;

        if (currentConditions.condition != null) {
            conditionCode = currentConditions.condition;
        }

        return new WeatherData(roundedTemperature, conditionCode, true);
    }

    function getBatteryData() {
        var systemStats = System.getSystemStats();

        var percentage = Math.round(systemStats.battery).toNumber();

        var daysRemaining = 0.0;
        var hasDaysEstimate = false;

        if (systemStats has :batteryInDays) {
            daysRemaining = systemStats.batteryInDays.toFloat();

            hasDaysEstimate = true;
        }

        return new BatteryData(
            percentage,
            daysRemaining,
            systemStats.charging,
            hasDaysEstimate
        );
    }
}
