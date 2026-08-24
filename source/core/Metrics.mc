class WeatherData {
    var temperature;
    var conditionCode;
    var isAvailable;

    function initialize(currentTemperature, currentConditionCode, available) {
        temperature = currentTemperature;
        conditionCode = currentConditionCode;
        isAvailable = available;
    }
}

class DateData {
    var weekday;
    var dayOfMonth;

    function initialize(currentWeekday, currentDayOfMonth) {
        weekday = currentWeekday;
        dayOfMonth = currentDayOfMonth;
    }
}

class ActivityData {
    var steps;
    var isAvailable;

    function initialize(currentSteps, available) {
        steps = currentSteps;
        isAvailable = available;
    }
}

class BatteryData {
    var percentage;
    var daysRemaining;
    var isCharging;
    var hasDaysEstimate;

    function initialize(
        currentPercentage,
        currentDaysRemaining,
        charging,
        daysEstimateAvailable
    ) {
        percentage = currentPercentage;
        daysRemaining = currentDaysRemaining;
        isCharging = charging;
        hasDaysEstimate = daysEstimateAvailable;
    }
}

class SportsData {
    var awayTeam;
    var awayScore;
    var homeTeam;
    var homeScore;
    var gameStatus;
    var isAvailable;

    function initialize(
        currentAwayTeam,
        currentAwayScore,
        currentHomeTeam,
        currentHomeScore,
        currentGameStatus,
        available
    ) {
        awayTeam = currentAwayTeam;
        awayScore = currentAwayScore;
        homeTeam = currentHomeTeam;
        homeScore = currentHomeScore;
        gameStatus = currentGameStatus;
        isAvailable = available;
    }
}

class WatchFaceData {
    var weather;
    var date;
    var activity;
    var battery;
    var sports;

    function initialize(
        weatherData,
        dateData,
        activityData,
        batteryData,
        sportsData
    ) {
        weather = weatherData;
        date = dateData;
        activity = activityData;
        battery = batteryData;
        sports = sportsData;
    }
}
