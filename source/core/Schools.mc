(:background)
module SchoolIds {
    const OHIO_STATE = 1;
    const MICHIGAN = 2;
    const PENN_STATE = 3;

    function isSupported(schoolId) {
        return schoolId == OHIO_STATE ||
            schoolId == MICHIGAN ||
            schoolId == PENN_STATE;
    }

    function themeForSchool(schoolId) {
        if (schoolId == OHIO_STATE) {
            return ThemeIds.SCARLET_NIGHT;
        } else if (schoolId == MICHIGAN) {
            return ThemeIds.MAIZE_BLUE;
        } else if (schoolId == PENN_STATE) {
            return ThemeIds.NAVY_WHITE;
        }

        return ThemeIds.SCARLET_NIGHT;
    }

    function fromLegacyTheme(themeId) {
        if (themeId == ThemeIds.SCARLET_NIGHT) {
            return OHIO_STATE;
        } else if (themeId == ThemeIds.MAIZE_BLUE) {
            return MICHIGAN;
        } else if (themeId == ThemeIds.NAVY_WHITE) {
            return PENN_STATE;
        }

        return OHIO_STATE;
    }
}
