(:background)
module CollegeProfileIds {
    const ALABAMA = "alabama";
    const ARKANSAS = "arkansas";
    const AUBURN = "auburn";
    const FLORIDA = "florida";
    const GEORGIA = "georgia";
    const KENTUCKY = "kentucky";
    const LSU = "lsu";
    const MISSISSIPPI_STATE = "mississippi_state";
    const MISSOURI = "missouri";
    const OKLAHOMA = "oklahoma";
    const OLE_MISS = "ole_miss";
    const SOUTH_CAROLINA = "south_carolina";
    const TENNESSEE = "tennessee";
    const TEXAS = "texas";
    const TEXAS_AM = "texas_am";
    const VANDERBILT = "vanderbilt";

    function forSchool(schoolId) {
        if (schoolId == SchoolIds.ARKANSAS) { return ARKANSAS; }
        else if (schoolId == SchoolIds.AUBURN) { return AUBURN; }
        else if (schoolId == SchoolIds.FLORIDA) { return FLORIDA; }
        else if (schoolId == SchoolIds.GEORGIA) { return GEORGIA; }
        else if (schoolId == SchoolIds.KENTUCKY) { return KENTUCKY; }
        else if (schoolId == SchoolIds.LSU) { return LSU; }
        else if (schoolId == SchoolIds.MISSISSIPPI_STATE) { return MISSISSIPPI_STATE; }
        else if (schoolId == SchoolIds.MISSOURI) { return MISSOURI; }
        else if (schoolId == SchoolIds.OKLAHOMA) { return OKLAHOMA; }
        else if (schoolId == SchoolIds.OLE_MISS) { return OLE_MISS; }
        else if (schoolId == SchoolIds.SOUTH_CAROLINA) { return SOUTH_CAROLINA; }
        else if (schoolId == SchoolIds.TENNESSEE) { return TENNESSEE; }
        else if (schoolId == SchoolIds.TEXAS) { return TEXAS; }
        else if (schoolId == SchoolIds.TEXAS_AM) { return TEXAS_AM; }
        else if (schoolId == SchoolIds.VANDERBILT) { return VANDERBILT; }
        return ALABAMA;
    }

    function abbreviationForSchool(schoolId) {
        if (schoolId == SchoolIds.ARKANSAS) { return "ARK"; }
        else if (schoolId == SchoolIds.AUBURN) { return "AUB"; }
        else if (schoolId == SchoolIds.FLORIDA) { return "FLA"; }
        else if (schoolId == SchoolIds.GEORGIA) { return "UGA"; }
        else if (schoolId == SchoolIds.KENTUCKY) { return "UK"; }
        else if (schoolId == SchoolIds.LSU) { return "LSU"; }
        else if (schoolId == SchoolIds.MISSISSIPPI_STATE) { return "MSST"; }
        else if (schoolId == SchoolIds.MISSOURI) { return "MIZ"; }
        else if (schoolId == SchoolIds.OKLAHOMA) { return "OU"; }
        else if (schoolId == SchoolIds.OLE_MISS) { return "MISS"; }
        else if (schoolId == SchoolIds.SOUTH_CAROLINA) { return "SC"; }
        else if (schoolId == SchoolIds.TENNESSEE) { return "TENN"; }
        else if (schoolId == SchoolIds.TEXAS) { return "TEX"; }
        else if (schoolId == SchoolIds.TEXAS_AM) { return "TAMU"; }
        else if (schoolId == SchoolIds.VANDERBILT) { return "VAN"; }
        return "BAMA";
    }
}
