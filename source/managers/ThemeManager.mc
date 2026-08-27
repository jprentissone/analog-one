class ThemeManager {
    var _activeTheme as Theme;

    function initialize(themeId) {
        if (themeId == ThemeIds.ARKANSAS_CARDINAL) {
            _activeTheme = createSchoolTheme(AnalogColors.ARKANSAS_CARDINAL, AnalogColors.HAND_WHITE, AnalogColors.GHOST_ARKANSAS, AnalogColors.ARKANSAS_RING);
        } else if (themeId == ThemeIds.AUBURN_NAVY) {
            _activeTheme = createSchoolTheme(AnalogColors.AUBURN_NAVY, AnalogColors.AUBURN_ORANGE, AnalogColors.GHOST_AUBURN, AnalogColors.AUBURN_RING);
        } else if (themeId == ThemeIds.FLORIDA_BLUE) {
            _activeTheme = createSchoolTheme(AnalogColors.FLORIDA_BLUE, AnalogColors.FLORIDA_ORANGE, AnalogColors.GHOST_FLORIDA, AnalogColors.FLORIDA_RING);
        } else if (themeId == ThemeIds.GEORGIA_RED) {
            _activeTheme = createSchoolTheme(AnalogColors.GEORGIA_RED, AnalogColors.HAND_WHITE, AnalogColors.GHOST_GEORGIA, AnalogColors.GEORGIA_RING);
        } else if (themeId == ThemeIds.KENTUCKY_BLUE) {
            _activeTheme = createSchoolTheme(AnalogColors.KENTUCKY_BLUE, AnalogColors.HAND_WHITE, AnalogColors.GHOST_KENTUCKY, AnalogColors.KENTUCKY_RING);
        } else if (themeId == ThemeIds.LSU_PURPLE) {
            _activeTheme = createSchoolTheme(AnalogColors.LSU_PURPLE, AnalogColors.LSU_GOLD, AnalogColors.GHOST_LSU, AnalogColors.LSU_RING);
        } else if (themeId == ThemeIds.MISSISSIPPI_STATE_MAROON) {
            _activeTheme = createSchoolTheme(AnalogColors.MISSISSIPPI_STATE_MAROON, AnalogColors.HAND_WHITE, AnalogColors.GHOST_MISSISSIPPI_STATE, AnalogColors.MISSISSIPPI_STATE_RING);
        } else if (themeId == ThemeIds.MISSOURI_BLACK_GOLD) {
            _activeTheme = createSchoolTheme(AnalogColors.MISSOURI_GRAPHITE, AnalogColors.MISSOURI_GOLD, AnalogColors.GHOST_MISSOURI, AnalogColors.MISSOURI_RING);
        } else if (themeId == ThemeIds.OKLAHOMA_CRIMSON) {
            _activeTheme = createSchoolTheme(AnalogColors.OKLAHOMA_CRIMSON, AnalogColors.OKLAHOMA_CREAM, AnalogColors.GHOST_OKLAHOMA, AnalogColors.OKLAHOMA_RING);
        } else if (themeId == ThemeIds.OLE_MISS_NAVY) {
            _activeTheme = createSchoolTheme(AnalogColors.OLE_MISS_NAVY, AnalogColors.OLE_MISS_RED, AnalogColors.GHOST_OLE_MISS, AnalogColors.OLE_MISS_RING);
        } else if (themeId == ThemeIds.SOUTH_CAROLINA_GARNET) {
            _activeTheme = createSchoolTheme(AnalogColors.SOUTH_CAROLINA_GARNET, AnalogColors.HAND_WHITE, AnalogColors.GHOST_SOUTH_CAROLINA, AnalogColors.SOUTH_CAROLINA_RING);
        } else if (themeId == ThemeIds.TENNESSEE_ORANGE) {
            _activeTheme = createSchoolTheme(AnalogColors.TENNESSEE_ORANGE, AnalogColors.HAND_WHITE, AnalogColors.GHOST_TENNESSEE, AnalogColors.TENNESSEE_RING);
        } else if (themeId == ThemeIds.TEXAS_BURNT_ORANGE) {
            _activeTheme = createSchoolTheme(AnalogColors.TEXAS_BURNT_ORANGE, AnalogColors.HAND_WHITE, AnalogColors.GHOST_TEXAS, AnalogColors.TEXAS_RING);
        } else if (themeId == ThemeIds.TEXAS_AM_MAROON) {
            _activeTheme = createSchoolTheme(AnalogColors.TEXAS_AM_MAROON, AnalogColors.HAND_WHITE, AnalogColors.GHOST_TEXAS_AM, AnalogColors.TEXAS_AM_RING);
        } else if (themeId == ThemeIds.VANDERBILT_BLACK_GOLD) {
            _activeTheme = createSchoolTheme(AnalogColors.VANDERBILT_GRAPHITE, AnalogColors.VANDERBILT_GOLD, AnalogColors.GHOST_VANDERBILT, AnalogColors.VANDERBILT_RING);
        } else {
            _activeTheme = createSchoolTheme(AnalogColors.ALABAMA_CRIMSON, AnalogColors.HAND_WHITE, AnalogColors.GHOST_ALABAMA, AnalogColors.ALABAMA_RING);
        }
    }

    function getTheme() as Theme {
        return _activeTheme;
    }

    function createSchoolTheme(primary, accent, ghost, ring) as Theme {
        return new Theme(
            AnalogColors.TRUE_BLACK,
            AnalogColors.DIAL_WHITE,
            AnalogColors.MINUTE_GRAY,
            AnalogColors.HAND_WHITE,
            primary,
            accent,
            ghost,
            ring,
            accent,
            AnalogColors.DIAL_WHITE,
            AnalogColors.MINUTE_GRAY
        );
    }
}
