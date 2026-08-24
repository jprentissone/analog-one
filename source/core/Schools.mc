(:background)
module SchoolIds {
    const NEUTRAL = 0;
    const OHIO_STATE = 1;
    const MICHIGAN = 2;
    const PENN_STATE = 3;
    const MICHIGAN_STATE = 4;
    const OREGON = 5;
    const USC = 6;
    const WISCONSIN = 7;
    const IOWA = 8;
    const WASHINGTON = 9;
    const NEBRASKA = 10;
    const MINNESOTA = 11;
    const NORTHWESTERN = 12;
    const ILLINOIS = 13;
    const INDIANA = 14;
    const MARYLAND = 15;
    const PURDUE = 16;
    const RUTGERS = 17;
    const UCLA = 18;

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
        } else if (schoolId == WASHINGTON) {
            return ThemeIds.WASHINGTON_PURPLE;
        } else if (schoolId == NEBRASKA) {
            return ThemeIds.NEBRASKA_SCARLET;
        } else if (schoolId == MINNESOTA) {
            return ThemeIds.MINNESOTA_MAROON;
        } else if (schoolId == NORTHWESTERN) {
            return ThemeIds.NORTHWESTERN_PURPLE;
        } else if (schoolId == ILLINOIS) {
            return ThemeIds.ILLINOIS_ORANGE;
        } else if (schoolId == INDIANA) {
            return ThemeIds.INDIANA_CRIMSON;
        } else if (schoolId == MARYLAND) {
            return ThemeIds.MARYLAND_RED;
        } else if (schoolId == PURDUE) {
            return ThemeIds.PURDUE_BLACK_GOLD;
        } else if (schoolId == RUTGERS) {
            return ThemeIds.RUTGERS_SCARLET;
        } else if (schoolId == UCLA) {
            return ThemeIds.UCLA_BLUE_GOLD;
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
        } else if (themeId == ThemeIds.OREGON_GREEN) {
            return OREGON;
        } else if (themeId == ThemeIds.USC_CARDINAL) {
            return USC;
        } else if (themeId == ThemeIds.WISCONSIN_RED) {
            return WISCONSIN;
        } else if (themeId == ThemeIds.IOWA_BLACK_GOLD) {
            return IOWA;
        } else if (themeId == ThemeIds.WASHINGTON_PURPLE) {
            return WASHINGTON;
        } else if (themeId == ThemeIds.NEBRASKA_SCARLET) {
            return NEBRASKA;
        } else if (themeId == ThemeIds.MINNESOTA_MAROON) {
            return MINNESOTA;
        } else if (themeId == ThemeIds.NORTHWESTERN_PURPLE) {
            return NORTHWESTERN;
        } else if (themeId == ThemeIds.ILLINOIS_ORANGE) {
            return ILLINOIS;
        } else if (themeId == ThemeIds.INDIANA_CRIMSON) {
            return INDIANA;
        } else if (themeId == ThemeIds.MARYLAND_RED) {
            return MARYLAND;
        } else if (themeId == ThemeIds.PURDUE_BLACK_GOLD) {
            return PURDUE;
        } else if (themeId == ThemeIds.RUTGERS_SCARLET) {
            return RUTGERS;
        } else if (themeId == ThemeIds.UCLA_BLUE_GOLD) {
            return UCLA;
        }

        return NEUTRAL;
    }
}
