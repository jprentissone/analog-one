(:background)
module CollegeProfileIds {
    const OSU = "osu";
    const MICHIGAN = "michigan";
    const PENN_STATE = "penn_state";
    const MICHIGAN_STATE = "michigan_state";

    function forTheme(themeId) {
        if (themeId == ThemeIds.MAIZE_BLUE) {
            return MICHIGAN;
        } else if (themeId == ThemeIds.NAVY_WHITE) {
            return PENN_STATE;
        } else if (themeId == ThemeIds.SPARTAN_GREEN) {
            return MICHIGAN_STATE;
        }

        return OSU;
    }

    function abbreviationForTheme(themeId) {
        if (themeId == ThemeIds.MAIZE_BLUE) {
            return "MICH";
        } else if (themeId == ThemeIds.NAVY_WHITE) {
            return "PSU";
        } else if (themeId == ThemeIds.SPARTAN_GREEN) {
            return "MSU";
        }

        return "OSU";
    }
}
