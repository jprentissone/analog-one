class ThemeManager {
    var _activeTheme as Theme;

    function initialize(themeId) {
        if (themeId == ThemeIds.SCARLET_NIGHT) {
            _activeTheme = createScarletNight();
        } else if (themeId == ThemeIds.MAIZE_BLUE) {
            _activeTheme = createMaizeBlue();
        } else if (themeId == ThemeIds.NAVY_WHITE) {
            _activeTheme = createNavyWhite();
        } else if (themeId == ThemeIds.SPARTAN_GREEN) {
            _activeTheme = createSpartanGreen();
        } else if (themeId == ThemeIds.OREGON_GREEN) {
            _activeTheme = createOregonGreen();
        } else if (themeId == ThemeIds.USC_CARDINAL) {
            _activeTheme = createUscCardinal();
        } else if (themeId == ThemeIds.WISCONSIN_RED) {
            _activeTheme = createWisconsinRed();
        } else if (themeId == ThemeIds.IOWA_BLACK_GOLD) {
            _activeTheme = createIowaBlackGold();
        } else if (themeId == ThemeIds.WASHINGTON_PURPLE) {
            _activeTheme = createWashingtonPurple();
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

    function createSpartanGreen() as Theme {
        return new Theme(
            AnalogColors.TRUE_BLACK,
            AnalogColors.DIAL_WHITE,
            AnalogColors.MINUTE_GRAY,
            AnalogColors.HAND_WHITE,
            AnalogColors.MICHIGAN_STATE_GREEN,
            AnalogColors.HAND_WHITE,
            AnalogColors.GHOST_GREEN,
            AnalogColors.MICHIGAN_STATE_RING,
            AnalogColors.HAND_WHITE,
            AnalogColors.DIAL_WHITE,
            AnalogColors.MINUTE_GRAY
        );
    }

    function createOregonGreen() as Theme {
        return new Theme(
            AnalogColors.TRUE_BLACK,
            AnalogColors.DIAL_WHITE,
            AnalogColors.MINUTE_GRAY,
            AnalogColors.HAND_WHITE,
            AnalogColors.OREGON_GREEN,
            AnalogColors.OREGON_YELLOW,
            AnalogColors.GHOST_OREGON,
            AnalogColors.OREGON_RING,
            AnalogColors.OREGON_YELLOW,
            AnalogColors.DIAL_WHITE,
            AnalogColors.MINUTE_GRAY
        );
    }

    function createUscCardinal() as Theme {
        return new Theme(
            AnalogColors.TRUE_BLACK,
            AnalogColors.DIAL_WHITE,
            AnalogColors.MINUTE_GRAY,
            AnalogColors.HAND_WHITE,
            AnalogColors.USC_CARDINAL,
            AnalogColors.USC_GOLD,
            AnalogColors.GHOST_USC,
            AnalogColors.USC_RING,
            AnalogColors.USC_GOLD,
            AnalogColors.DIAL_WHITE,
            AnalogColors.MINUTE_GRAY
        );
    }

    function createWisconsinRed() as Theme {
        return new Theme(
            AnalogColors.TRUE_BLACK,
            AnalogColors.DIAL_WHITE,
            AnalogColors.MINUTE_GRAY,
            AnalogColors.HAND_WHITE,
            AnalogColors.WISCONSIN_RED,
            AnalogColors.HAND_WHITE,
            AnalogColors.GHOST_WISCONSIN,
            AnalogColors.WISCONSIN_RING,
            AnalogColors.HAND_WHITE,
            AnalogColors.DIAL_WHITE,
            AnalogColors.MINUTE_GRAY
        );
    }

    function createIowaBlackGold() as Theme {
        return new Theme(
            AnalogColors.TRUE_BLACK,
            AnalogColors.DIAL_WHITE,
            AnalogColors.MINUTE_GRAY,
            AnalogColors.HAND_WHITE,
            AnalogColors.IOWA_GRAPHITE,
            AnalogColors.IOWA_GOLD,
            AnalogColors.GHOST_IOWA,
            AnalogColors.IOWA_RING,
            AnalogColors.IOWA_GOLD,
            AnalogColors.DIAL_WHITE,
            AnalogColors.MINUTE_GRAY
        );
    }

    function createWashingtonPurple() as Theme {
        return new Theme(
            AnalogColors.TRUE_BLACK,
            AnalogColors.DIAL_WHITE,
            AnalogColors.MINUTE_GRAY,
            AnalogColors.HAND_WHITE,
            AnalogColors.WASHINGTON_PURPLE,
            AnalogColors.WASHINGTON_GOLD,
            AnalogColors.GHOST_WASHINGTON,
            AnalogColors.WASHINGTON_RING,
            AnalogColors.WASHINGTON_GOLD,
            AnalogColors.DIAL_WHITE,
            AnalogColors.MINUTE_GRAY
        );
    }
}
