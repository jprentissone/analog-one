(:background)
module SchoolIds {
    const OHIO_STATE = 1;
    const MICHIGAN = 2;
    const PENN_STATE = 3;
    const MICHIGAN_STATE = 4;
    const OREGON = 5;
    const USC = 6;
    const WISCONSIN = 7;
    const IOWA = 8;

    function isSupported(schoolId) {
        return schoolId == OHIO_STATE ||
            schoolId == MICHIGAN ||
            schoolId == PENN_STATE ||
            schoolId == MICHIGAN_STATE ||
            schoolId == OREGON ||
            schoolId == USC ||
            schoolId == WISCONSIN ||
            schoolId == IOWA;
    }

    function themeForSchool(schoolId) {
        if (schoolId == OHIO_STATE) {
            return ThemeIds.SCARLET_NIGHT;
        } else if (schoolId == MICHIGAN) {
            return ThemeIds.MAIZE_BLUE;
        } else if (schoolId == PENN_STATE) {
            return ThemeIds.NAVY_WHITE;
        } else if (schoolId == MICHIGAN_STATE) {
            return ThemeIds.SPARTAN_GREEN;
        } else if (schoolId == OREGON) {
            return ThemeIds.OREGON_GREEN;
        } else if (schoolId == USC) {
            return ThemeIds.USC_CARDINAL;
        } else if (schoolId == WISCONSIN) {
            return ThemeIds.WISCONSIN_RED;
        } else if (schoolId == IOWA) {
            return ThemeIds.IOWA_BLACK_GOLD;
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
        } else if (themeId == ThemeIds.SPARTAN_GREEN) {
            return MICHIGAN_STATE;
        } else if (themeId == ThemeIds.OREGON_GREEN) {
            return OREGON;
        } else if (themeId == ThemeIds.USC_CARDINAL) {
            return USC;
        } else if (themeId == ThemeIds.WISCONSIN_RED) {
            return WISCONSIN;
        } else if (themeId == ThemeIds.IOWA_BLACK_GOLD) {
            return IOWA;
        }

        return OHIO_STATE;
    }
}
