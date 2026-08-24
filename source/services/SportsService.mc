import Toybox.Application;
import Toybox.Lang;

class SportsService {
    const STORAGE_KEY = "sportsData";

    function initialize() {}

    function getData() {
        var response = Application.Storage.getValue(STORAGE_KEY);

        if (response instanceof Dictionary) {
            return parseResponse(response as Dictionary);
        }

        return createNoGameData();
    }

    function parseResponse(response) {
        if (response == null) {
            return createNoGameData();
        }

        var state = response["state"];

        if (state == SportsStates.NONE) {
            return createNoGameData();
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

    function createNoGameData() {
        return new SportsData(
            SportsStates.NONE,
            "",
            0,
            "",
            0,
            "",
            "",
            ""
        );
    }
}
