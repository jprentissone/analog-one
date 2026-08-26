import Toybox.Application;
import Toybox.Lang;

class SportsService {
    const STORAGE_KEY = "sportsData";
    const REFRESH_FAILED_KEY = "sportsRefreshFailed";

    function initialize() {}

    function getData() {
        var response = Application.Storage.getValue(STORAGE_KEY);
        var refreshFailed =
            Application.Storage.getValue(REFRESH_FAILED_KEY) == true;

        if (response instanceof Dictionary) {
            var schoolId = (new SettingsManager()).getSchoolId();
            var expectedTeam =
                CollegeProfileIds.abbreviationForSchool(schoolId);
            var receivedTeam = response["featured"];

            if (
                !(receivedTeam instanceof String) ||
                !expectedTeam.equals(receivedTeam)
            ) {
                return createNoGameData(
                    refreshFailed ? "OFFLINE" : "UPDATING",
                    refreshFailed
                );
            }

            return parseResponse(response as Dictionary, refreshFailed);
        }

        return createNoGameData(
            refreshFailed ? "OFFLINE" : "UPDATING",
            refreshFailed
        );
    }

    function parseResponse(response as Dictionary, isStale as Boolean) {
        var state = response["state"];

        if (!(state instanceof Number)) {
            return createNoGameData("DATA ERROR", false);
        }

        if (state == SportsStates.NONE) {
            return createNoGameData(isStale ? "OFFLINE" : "NO GAME", isStale);
        }

        if (
            state != SportsStates.UPCOMING &&
            state != SportsStates.LIVE &&
            state != SportsStates.FINAL
        ) {
            return createNoGameData("DATA ERROR", false);
        }

        var away = response["away"];
        var home = response["home"];
        var featured = response["featured"];

        if (
            !(away instanceof String) ||
            !(home instanceof String) ||
            !(featured instanceof String)
        ) {
            return createNoGameData("DATA ERROR", false);
        }

        var awayScore = response["awayScore"];
        var homeScore = response["homeScore"];
        var status = response["status"];
        var startTime = response["startTime"];

        if (!(awayScore instanceof Number)) {
            awayScore = 0;
        }

        if (!(homeScore instanceof Number)) {
            homeScore = 0;
        }

        if (!(status instanceof String)) {
            status = "";
        }

        if (!(startTime instanceof String)) {
            startTime = "";
        }

        return new SportsData(
            state,
            away,
            awayScore,
            home,
            homeScore,
            status,
            featured,
            startTime,
            isStale
        );
    }

    function createNoGameData(statusText, isStale) {
        var schoolId = (new SettingsManager()).getSchoolId();

        return new SportsData(
            SportsStates.NONE,
            "",
            0,
            "",
            0,
            statusText,
            CollegeProfileIds.abbreviationForSchool(schoolId),
            "",
            isStale
        );
    }
}
