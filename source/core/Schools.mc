(:background)
module SchoolIds {
    const ALABAMA = 1;
    const ARKANSAS = 2;
    const AUBURN = 3;
    const FLORIDA = 4;
    const GEORGIA = 5;
    const KENTUCKY = 6;
    const LSU = 7;
    const MISSISSIPPI_STATE = 8;
    const MISSOURI = 9;
    const OKLAHOMA = 10;
    const OLE_MISS = 11;
    const SOUTH_CAROLINA = 12;
    const TENNESSEE = 13;
    const TEXAS = 14;
    const TEXAS_AM = 15;
    const VANDERBILT = 16;

    function isSupported(schoolId) {
        return schoolId == ALABAMA || schoolId == ARKANSAS ||
            schoolId == AUBURN || schoolId == FLORIDA ||
            schoolId == GEORGIA || schoolId == KENTUCKY ||
            schoolId == LSU || schoolId == MISSISSIPPI_STATE ||
            schoolId == MISSOURI || schoolId == OKLAHOMA ||
            schoolId == OLE_MISS || schoolId == SOUTH_CAROLINA ||
            schoolId == TENNESSEE || schoolId == TEXAS ||
            schoolId == TEXAS_AM || schoolId == VANDERBILT;
    }

    function themeForSchool(schoolId) {
        if (schoolId == ARKANSAS) { return ThemeIds.ARKANSAS_CARDINAL; }
        else if (schoolId == AUBURN) { return ThemeIds.AUBURN_NAVY; }
        else if (schoolId == FLORIDA) { return ThemeIds.FLORIDA_BLUE; }
        else if (schoolId == GEORGIA) { return ThemeIds.GEORGIA_RED; }
        else if (schoolId == KENTUCKY) { return ThemeIds.KENTUCKY_BLUE; }
        else if (schoolId == LSU) { return ThemeIds.LSU_PURPLE; }
        else if (schoolId == MISSISSIPPI_STATE) { return ThemeIds.MISSISSIPPI_STATE_MAROON; }
        else if (schoolId == MISSOURI) { return ThemeIds.MISSOURI_BLACK_GOLD; }
        else if (schoolId == OKLAHOMA) { return ThemeIds.OKLAHOMA_CRIMSON; }
        else if (schoolId == OLE_MISS) { return ThemeIds.OLE_MISS_NAVY; }
        else if (schoolId == SOUTH_CAROLINA) { return ThemeIds.SOUTH_CAROLINA_GARNET; }
        else if (schoolId == TENNESSEE) { return ThemeIds.TENNESSEE_ORANGE; }
        else if (schoolId == TEXAS) { return ThemeIds.TEXAS_BURNT_ORANGE; }
        else if (schoolId == TEXAS_AM) { return ThemeIds.TEXAS_AM_MAROON; }
        else if (schoolId == VANDERBILT) { return ThemeIds.VANDERBILT_BLACK_GOLD; }
        return ThemeIds.ALABAMA_CRIMSON;
    }

    function fromLegacyTheme(themeId) {
        if (themeId == ThemeIds.ARKANSAS_CARDINAL) { return ARKANSAS; }
        else if (themeId == ThemeIds.AUBURN_NAVY) { return AUBURN; }
        else if (themeId == ThemeIds.FLORIDA_BLUE) { return FLORIDA; }
        else if (themeId == ThemeIds.GEORGIA_RED) { return GEORGIA; }
        else if (themeId == ThemeIds.KENTUCKY_BLUE) { return KENTUCKY; }
        else if (themeId == ThemeIds.LSU_PURPLE) { return LSU; }
        else if (themeId == ThemeIds.MISSISSIPPI_STATE_MAROON) { return MISSISSIPPI_STATE; }
        else if (themeId == ThemeIds.MISSOURI_BLACK_GOLD) { return MISSOURI; }
        else if (themeId == ThemeIds.OKLAHOMA_CRIMSON) { return OKLAHOMA; }
        else if (themeId == ThemeIds.OLE_MISS_NAVY) { return OLE_MISS; }
        else if (themeId == ThemeIds.SOUTH_CAROLINA_GARNET) { return SOUTH_CAROLINA; }
        else if (themeId == ThemeIds.TENNESSEE_ORANGE) { return TENNESSEE; }
        else if (themeId == ThemeIds.TEXAS_BURNT_ORANGE) { return TEXAS; }
        else if (themeId == ThemeIds.TEXAS_AM_MAROON) { return TEXAS_AM; }
        else if (themeId == ThemeIds.VANDERBILT_BLACK_GOLD) { return VANDERBILT; }
        return ALABAMA;
    }
}
