import Toybox.Graphics;
import Toybox.Lang;

class SportsRenderer {
    const SPORTS_OFFSET_X = 101;
    const SPORTS_OFFSET_Y = 108;

    var _complicationRenderer as ComplicationRenderer;

    function initialize(theme as Theme) {
        _complicationRenderer = new ComplicationRenderer(theme);
    }

    function draw(dc as Graphics.Dc, sportsData as SportsData) {
        if (!sportsData.isAvailable) {
            return;
        }

        var centerX = dc.getWidth() / 2 + SPORTS_OFFSET_X;

        var centerY = dc.getHeight() / 2 + SPORTS_OFFSET_Y;

        var awayText = Lang.format("$1$ $2$", [
            sportsData.awayTeam,
            sportsData.awayScore,
        ]);

        var homeText = Lang.format("$1$ $2$", [
            sportsData.homeTeam,
            sportsData.homeScore,
        ]);

        var awayIsFeatured =
            sportsData.awayTeam.compareTo(sportsData.featuredTeam) == 0;

        _complicationRenderer.drawScore(
            dc,
            centerX,
            centerY,
            awayText,
            homeText,
            sportsData.gameStatus,
            awayIsFeatured
        );
    }
}
