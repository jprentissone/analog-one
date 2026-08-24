import Toybox.Lang;

class SportsService {
    function initialize() {}

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