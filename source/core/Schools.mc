(:background)
module SchoolIds {
    const NEUTRAL = 0;
    const OHIO_STATE = 1;
    const MICHIGAN = 2;
    const PENN_STATE = 3;
    const MICHIGAN_STATE = 4;

    function themeForSchool(schoolId) {
        if (schoolId == OHIO_STATE) {
            return ThemeIds.SCARLET_NIGHT;
        } else if (schoolId == MICHIGAN) {
            return ThemeIds.MAIZE_BLUE;
        } else if (schoolId == PENN_STATE) {
            return ThemeIds.NAVY_WHITE;
        } else if (schoolId == MICHIGAN_STATE) {
            return ThemeIds.SPARTAN_GREEN;
        }

        return ThemeIds.CLASSIC;
    }

    function fromLegacyTheme(themeId) {
        if (themeId == ThemeIds.SCARLET_NIGHT) {
            return OHIO_STATE;
        } else if (themeId == ThemeIds.MAIZE_BLUE) {
            return MICHIGAN;
        } else if (themeId == ThemeIds.NAVY_WHITE) {
            return PENN_STATE;
        } else if (themeId == ThemeIds.SPARTAN_GREEN) {
            return MICHIGAN_STATE;
        }

        return NEUTRAL;
    }
}
