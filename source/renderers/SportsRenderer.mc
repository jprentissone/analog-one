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
        if (sportsData.state == SportsStates.NONE) {
            return;
        }

        var centerX = dc.getWidth() / 2 + SPORTS_OFFSET_X;
        var centerY = dc.getHeight() / 2 + SPORTS_OFFSET_Y;

        if (sportsData.state == SportsStates.UPCOMING) {
            drawUpcomingGame(dc, centerX, centerY, sportsData);
        } else if (sportsData.state == SportsStates.LIVE) {
            drawLiveGame(dc, centerX, centerY, sportsData);
        } else if (sportsData.state == SportsStates.FINAL) {
            drawFinalGame(dc, centerX, centerY, sportsData);
        }
    }

    function drawUpcomingGame(
        dc as Graphics.Dc,
        centerX,
        centerY,
        sportsData as SportsData
    ) {
        var awayText = sportsData.awayTeam;

        var homeText = Lang.format("at $1$", [sportsData.homeTeam]);

        drawGame(
            dc,
            centerX,
            centerY,
            awayText,
            homeText,
            sportsData.startTime,
            sportsData
        );
    }

    function drawLiveGame(
        dc as Graphics.Dc,
        centerX,
        centerY,
        sportsData as SportsData
    ) {
        var awayText = Lang.format("$1$ $2$", [
            sportsData.awayTeam,
            sportsData.awayScore,
        ]);

        var homeText = Lang.format("$1$ $2$", [
            sportsData.homeTeam,
            sportsData.homeScore,
        ]);

        drawGame(
            dc,
            centerX,
            centerY,
            awayText,
            homeText,
            sportsData.gameStatus,
            sportsData
        );
    }

    function drawFinalGame(
        dc as Graphics.Dc,
        centerX,
        centerY,
        sportsData as SportsData
    ) {
        var awayText = Lang.format("$1$ $2$", [
            sportsData.awayTeam,
            sportsData.awayScore,
        ]);

        var homeText = Lang.format("$1$ $2$", [
            sportsData.homeTeam,
            sportsData.homeScore,
        ]);

        drawGame(dc, centerX, centerY, awayText, homeText, "FINAL", sportsData);
    }

    function drawGame(
        dc as Graphics.Dc,
        centerX,
        centerY,
        awayText,
        homeText,
        statusText,
        sportsData as SportsData
    ) {
        var awayIsFeatured =
            sportsData.awayTeam.compareTo(sportsData.featuredTeam) == 0;

        _complicationRenderer.drawScore(
            dc,
            centerX,
            centerY,
            awayText,
            homeText,
            statusText,
            awayIsFeatured
        );
    }
}
