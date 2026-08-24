(:background)
module CollegeProfileIds {
    const OSU = "osu";
    const MICHIGAN = "michigan";
    const PENN_STATE = "penn_state";

    function forTheme(themeId) {
        if (themeId == ThemeIds.MAIZE_BLUE) {
            return MICHIGAN;
        } else if (themeId == ThemeIds.NAVY_WHITE) {
            return PENN_STATE;
        }

        return OSU;
    }

    function abbreviationForTheme(themeId) {
        if (themeId == ThemeIds.MAIZE_BLUE) {
            return "MICH";
        } else if (themeId == ThemeIds.NAVY_WHITE) {
            return "PSU";
        }

        return "OSU";
    }
}
