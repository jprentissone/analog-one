(:background)
module CollegeProfileIds {
    const OSU = "osu";
    const MICHIGAN = "michigan";
    const PENN_STATE = "penn_state";
    const MICHIGAN_STATE = "michigan_state";
    const OREGON = "oregon";
    const USC = "usc";
    const WISCONSIN = "wisconsin";
    const IOWA = "iowa";
    const WASHINGTON = "washington";
    const NEBRASKA = "nebraska";
    const MINNESOTA = "minnesota";
    const NORTHWESTERN = "northwestern";

    function forSchool(schoolId) {
        if (schoolId == SchoolIds.MICHIGAN) {
            return MICHIGAN;
        } else if (schoolId == SchoolIds.PENN_STATE) {
            return PENN_STATE;
        } else if (schoolId == SchoolIds.MICHIGAN_STATE) {
            return MICHIGAN_STATE;
        } else if (schoolId == SchoolIds.OREGON) {
            return OREGON;
        } else if (schoolId == SchoolIds.USC) {
            return USC;
        } else if (schoolId == SchoolIds.WISCONSIN) {
            return WISCONSIN;
        } else if (schoolId == SchoolIds.IOWA) {
            return IOWA;
        } else if (schoolId == SchoolIds.WASHINGTON) {
            return WASHINGTON;
        } else if (schoolId == SchoolIds.NEBRASKA) {
            return NEBRASKA;
        } else if (schoolId == SchoolIds.MINNESOTA) {
            return MINNESOTA;
        } else if (schoolId == SchoolIds.NORTHWESTERN) {
            return NORTHWESTERN;
        }

        return OSU;
    }

    function abbreviationForSchool(schoolId) {
        if (schoolId == SchoolIds.MICHIGAN) {
            return "MICH";
        } else if (schoolId == SchoolIds.PENN_STATE) {
            return "PSU";
        } else if (schoolId == SchoolIds.MICHIGAN_STATE) {
            return "MSU";
        } else if (schoolId == SchoolIds.OREGON) {
            return "ORE";
        } else if (schoolId == SchoolIds.USC) {
            return "USC";
        } else if (schoolId == SchoolIds.WISCONSIN) {
            return "WIS";
        } else if (schoolId == SchoolIds.IOWA) {
            return "IOWA";
        } else if (schoolId == SchoolIds.WASHINGTON) {
            return "WASH";
        } else if (schoolId == SchoolIds.NEBRASKA) {
            return "NEB";
        } else if (schoolId == SchoolIds.MINNESOTA) {
            return "MINN";
        } else if (schoolId == SchoolIds.NORTHWESTERN) {
            return "NW";
        }

        return "OSU";
    }
}
