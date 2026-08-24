import Toybox.Background;
import Toybox.Communications;
import Toybox.Lang;
import Toybox.PersistedContent;
import Toybox.System;

(:background)
class SportsServiceDelegate extends System.ServiceDelegate {
    const SPORTS_URL =
        "https://benchcraft-sports-api.benchcraft-sports-api.workers.dev/v1/ncaa/football?team=osu";

    function initialize() {
        ServiceDelegate.initialize();
    }

    function onTemporalEvent() as Void {
        var options = {
            :method => Communications.HTTP_REQUEST_METHOD_GET,
            :headers => {},
            :responseType => Communications.HTTP_RESPONSE_CONTENT_TYPE_JSON
        };

        Communications.makeWebRequest(
            SPORTS_URL,
            null,
            options,
            method(:onReceive)
        );
    }

    function onReceive(
        responseCode as Number,
        response as Null or Dictionary or String or PersistedContent.Iterator
    ) as Void {
        if (responseCode == 200 && response instanceof Dictionary) {
            Background.exit(response as Dictionary);
            return;
        }

        Background.exit(null);
    }
}
