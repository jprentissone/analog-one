import Toybox.Application;
import Toybox.Lang;

class SportsService {
    const STORAGE_KEY = "sportsData";

    function initialize() {}

    function getData() {
        var response = Application.Storage.getValue(STORAGE_KEY);

        if (response instanceof Dictionary) {
            var schoolId = new SettingsManager().getSchoolId();
            var expectedTeam =
                CollegeProfileIds.abbreviationForSchool(schoolId);
            var receivedTeam = response["featured"];

            if (!(receivedTeam instanceof String) ||
                !expectedTeam.equals(receivedTeam)) {
                return createNoGameData("UPDATING");
            }

            return parseResponse(response as Dictionary);
        }

        return createNoGameData("UPDATING");
    }

    function parseResponse(response) {
        if (response == null) {
            return createNoGameData("UPDATING");
        }

        var state = response["state"];

        if (state == SportsStates.NONE) {
            return createNoGameData("NO GAME");
        }

        return new SportsData(
            state,
            response["away"],
            response["awayScore"],
            response["home"],
            response["homeScore"],
            response["status"],
            response["featured"],
            response["startTime"]
        );
    }

    function createNoGameData(statusText) {
        var schoolId = new SettingsManager().getSchoolId();

        return new SportsData(
            SportsStates.NONE,
            "",
            0,
            "",
            0,
            statusText,
            CollegeProfileIds.abbreviationForSchool(schoolId),
            ""
        );
    }
}
