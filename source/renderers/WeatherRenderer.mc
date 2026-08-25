import Toybox.Graphics;
import Toybox.Lang;
import Toybox.Weather;

class WeatherRenderer {
    const WEATHER_OFFSET_X = 130;
    const WEATHER_OFFSET_Y = 75;

    var _complicationRenderer as ComplicationRenderer;

    function initialize(theme as Theme) {
        _complicationRenderer = new ComplicationRenderer(theme);
    }

    function draw(dc as Graphics.Dc, weatherData as WeatherData) {
        if (!weatherData.isAvailable) {
            return;
        }

        var centerX = dc.getWidth() / 2 + WEATHER_OFFSET_X;

        var centerY = dc.getHeight() / 2 + WEATHER_OFFSET_Y;

        var temperatureText = Lang.format("$1$°", [weatherData.temperature]);

        _complicationRenderer.drawWithDetail(
            dc,
            centerX,
            centerY,
            getWeatherIcon(weatherData.conditionCode),
            temperatureText,
            getWeatherLabel(weatherData.conditionCode)
        );
    }

    function getWeatherIcon(conditionCode) {
        if (conditionCode == Weather.CONDITION_CLEAR) {
            return ComplicationIcons.WEATHER_CLEAR;
        }

        if (conditionCode == Weather.CONDITION_PARTLY_CLOUDY) {
            return ComplicationIcons.WEATHER_PARTLY_CLOUDY;
        }

        if (
            conditionCode == Weather.CONDITION_SNOW ||
            conditionCode == Weather.CONDITION_WINTRY_MIX
        ) {
            return ComplicationIcons.WEATHER_SNOW;
        }

        if (
            conditionCode == Weather.CONDITION_RAIN ||
            conditionCode == Weather.CONDITION_HAIL ||
            conditionCode == Weather.CONDITION_SCATTERED_SHOWERS ||
            conditionCode == Weather.CONDITION_THUNDERSTORMS ||
            conditionCode == Weather.CONDITION_SCATTERED_THUNDERSTORMS ||
            conditionCode == Weather.CONDITION_UNKNOWN_PRECIPITATION
        ) {
            return ComplicationIcons.WEATHER_RAIN;
        }

        return ComplicationIcons.WEATHER_CLOUDY;
    }

    function getWeatherLabel(conditionCode) {
        if (conditionCode == Weather.CONDITION_CLEAR) {
            return "Clear";
        }

        if (conditionCode == Weather.CONDITION_PARTLY_CLOUDY) {
            return "Partly Cloudy";
        }

        if (conditionCode == Weather.CONDITION_MOSTLY_CLOUDY) {
            return "Cloudy";
        }

        if (
            conditionCode == Weather.CONDITION_RAIN ||
            conditionCode == Weather.CONDITION_UNKNOWN_PRECIPITATION
        ) {
            return "Rain";
        }

        if (conditionCode == Weather.CONDITION_SCATTERED_SHOWERS) {
            return "Showers";
        }

        if (conditionCode == Weather.CONDITION_SNOW) {
            return "Snow";
        }

        if (conditionCode == Weather.CONDITION_WINTRY_MIX) {
            return "Wintry Mix";
        }

        if (
            conditionCode == Weather.CONDITION_THUNDERSTORMS ||
            conditionCode == Weather.CONDITION_SCATTERED_THUNDERSTORMS
        ) {
            return "Storms";
        }

        if (conditionCode == Weather.CONDITION_WINDY) {
            return "Windy";
        }

        if (conditionCode == Weather.CONDITION_FOG) {
            return "Fog";
        }

        if (conditionCode == Weather.CONDITION_HAZY) {
            return "Hazy";
        }

        if (conditionCode == Weather.CONDITION_HAIL) {
            return "Hail";
        }

        return "Weather";
    }
}
