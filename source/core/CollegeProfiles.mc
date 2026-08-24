(:background)
module CollegeProfileIds {
    const OSU = "osu";
    const MICHIGAN = "michigan";

    function forTheme(themeId) {
        if (themeId == ThemeIds.MAIZE_BLUE) {
            return MICHIGAN;
        }

        return OSU;
    }

    function abbreviationForTheme(themeId) {
        if (themeId == ThemeIds.MAIZE_BLUE) {
            return "MICH";
        }

        return "OSU";
    }
}
