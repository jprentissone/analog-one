class ThemeManager {
    var _activeTheme as Theme;

    function initialize(themeId) {
        if (themeId == ThemeIds.SCARLET_NIGHT) {
            _activeTheme = createScarletNight();
        } else if (themeId == ThemeIds.MAIZE_BLUE) {
            _activeTheme = createMaizeBlue();
        } else if (themeId == ThemeIds.NAVY_WHITE) {
            _activeTheme = createNavyWhite();
        } else {
            _activeTheme = createAnalogOneClassic();
        }
    }

    function getTheme() as Theme {
        return _activeTheme;
    }

    function createAnalogOneClassic() as Theme {
        return new Theme(
            AnalogColors.TRUE_BLACK,
            AnalogColors.DIAL_WHITE,
            AnalogColors.MINUTE_GRAY,
            AnalogColors.HAND_WHITE,
            AnalogColors.GRAPHITE,
            AnalogColors.SCARLET,
            AnalogColors.GHOST_GRAY,
            AnalogColors.GRAPHITE,
            AnalogColors.SCARLET,
            AnalogColors.DIAL_WHITE,
            AnalogColors.MINUTE_GRAY
        );
    }

    function createScarletNight() as Theme {
        return new Theme(
            AnalogColors.TRUE_BLACK,
            AnalogColors.DIAL_WHITE,
            AnalogColors.MINUTE_GRAY,
            AnalogColors.HAND_WHITE,
            AnalogColors.DARK_SCARLET,
            AnalogColors.SCARLET,
            AnalogColors.GHOST_SCARLET,
            AnalogColors.DARK_SCARLET,
            AnalogColors.SCARLET,
            AnalogColors.DIAL_WHITE,
            AnalogColors.MINUTE_GRAY
        );
    }

    function createMaizeBlue() as Theme {
        return new Theme(
            AnalogColors.TRUE_BLACK,
            AnalogColors.DIAL_WHITE,
            AnalogColors.MINUTE_GRAY,
            AnalogColors.HAND_WHITE,
            AnalogColors.MICHIGAN_BLUE,
            AnalogColors.MAIZE,
            AnalogColors.GHOST_BLUE,
            AnalogColors.MICHIGAN_RING,
            AnalogColors.MAIZE,
            AnalogColors.DIAL_WHITE,
            AnalogColors.MINUTE_GRAY
        );
    }

    function createNavyWhite() as Theme {
        return new Theme(
            AnalogColors.TRUE_BLACK,
            AnalogColors.DIAL_WHITE,
            AnalogColors.MINUTE_GRAY,
            AnalogColors.HAND_WHITE,
            AnalogColors.PENN_STATE_NAVY,
            AnalogColors.PENN_STATE_WHITE,
            AnalogColors.GHOST_NAVY,
            AnalogColors.PENN_STATE_RING,
            AnalogColors.PENN_STATE_WHITE,
            AnalogColors.DIAL_WHITE,
            AnalogColors.MINUTE_GRAY
        );
    }
}
