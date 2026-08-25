import Toybox.Graphics;
import Toybox.Lang;

class SportsRenderer {
    const SCORE_TOP_OFFSET_Y = -143;
    const TEAM_LEFT_OFFSET_X = -90;
    const SCORE_RIGHT_OFFSET_X = 90;
    const ROW_SPACING = 32;

    var _theme as Theme;
    var _teamFont;
    var _compactTeamFont;
    var _statusFont;
    var _fontsReady = false;

    function initialize(theme as Theme) {
        _theme = theme;
    }

    function configureFonts(dc as Graphics.Dc) {
        if (_fontsReady) {
            return;
        }

        _teamFont = null;
        _compactTeamFont = null;
        _statusFont = null;

        if (Graphics has :getVectorFont) {
            _teamFont = Graphics.getVectorFont({
                :face => ["RobotoCondensedRegular", "RobotoRegular"],
                :size => (dc.getWidth() * 30) / 454,
            });

            _compactTeamFont = Graphics.getVectorFont({
                :face => ["RobotoCondensedRegular", "RobotoRegular"],
                :size => (dc.getWidth() * 26) / 454,
            });

            _statusFont = Graphics.getVectorFont({
                :face => ["RobotoCondensedRegular", "RobotoRegular"],
                :size => (dc.getWidth() * 18) / 454,
            });
        }

        if (_teamFont == null) {
            _teamFont = Graphics.FONT_SMALL;
        }

        if (_compactTeamFont == null) {
            _compactTeamFont = Graphics.FONT_XTINY;
        }

        if (_statusFont == null) {
            _statusFont = Graphics.FONT_XTINY;
        }

        _fontsReady = true;
    }

    function draw(dc as Graphics.Dc, sportsData as SportsData) {
        if (sportsData.state == SportsStates.NONE) {
            return;
        }

        configureFonts(dc);

        var centerX = dc.getWidth() / 2;
        var firstRowY = dc.getHeight() / 2 + SCORE_TOP_OFFSET_Y;

        var awayScore = "-";
        var homeScore = "-";
        var statusText = sportsData.startTime;

        if (sportsData.state == SportsStates.LIVE) {
            awayScore = Lang.format("$1$", [sportsData.awayScore]);
            homeScore = Lang.format("$1$", [sportsData.homeScore]);
            statusText = sportsData.gameStatus;
        } else if (sportsData.state == SportsStates.FINAL) {
            awayScore = Lang.format("$1$", [sportsData.awayScore]);
            homeScore = Lang.format("$1$", [sportsData.homeScore]);
            statusText = "FINAL";
        }

        drawTeamRow(
            dc,
            centerX,
            firstRowY,
            sportsData.awayTeam,
            awayScore,
            isFeaturedTeam(sportsData.awayTeam, sportsData)
        );

        drawTeamRow(
            dc,
            centerX,
            firstRowY + ROW_SPACING,
            sportsData.homeTeam,
            homeScore,
            isFeaturedTeam(sportsData.homeTeam, sportsData)
        );

        dc.setColor(_theme.complicationLabelColor, Graphics.COLOR_TRANSPARENT);

        dc.drawText(
            centerX,
            firstRowY + ROW_SPACING * 2,
            _statusFont,
            statusText,
            Graphics.TEXT_JUSTIFY_CENTER | Graphics.TEXT_JUSTIFY_VCENTER
        );
    }

    function drawTeamRow(
        dc as Graphics.Dc,
        centerX,
        rowY,
        teamText,
        scoreText,
        isFeatured
    ) {
        if (isFeatured) {
            dc.setColor(
                _theme.complicationIconColor,
                Graphics.COLOR_TRANSPARENT
            );
        } else {
            dc.setColor(
                _theme.complicationValueColor,
                Graphics.COLOR_TRANSPARENT
            );
        }

        dc.drawText(
            centerX + TEAM_LEFT_OFFSET_X,
            rowY,
            getTeamFont(teamText),
            teamText,
            Graphics.TEXT_JUSTIFY_LEFT | Graphics.TEXT_JUSTIFY_VCENTER
        );

        if (scoreText.length() > 0) {
            dc.setColor(
                _theme.complicationValueColor,
                Graphics.COLOR_TRANSPARENT
            );

            dc.drawText(
                centerX + SCORE_RIGHT_OFFSET_X,
                rowY,
                _teamFont,
                scoreText,
                Graphics.TEXT_JUSTIFY_RIGHT | Graphics.TEXT_JUSTIFY_VCENTER
            );
        }
    }

    function getTeamFont(teamText) {
        if (teamText.length() > 10) {
            return _compactTeamFont;
        }

        return _teamFont;
    }

    function isFeaturedTeam(teamText, sportsData as SportsData) {
        return teamText.compareTo(sportsData.featuredTeam) == 0;
    }
}
