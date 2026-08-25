(:background)
module CollegeProfileIds {
    const OSU = "osu";
    const MICHIGAN = "michigan";
    const PENN_STATE = "penn_state";

    function forSchool(schoolId) {
        if (schoolId == SchoolIds.MICHIGAN) {
            return MICHIGAN;
        } else if (schoolId == SchoolIds.PENN_STATE) {
            return PENN_STATE;
        }

        return OSU;
    }

    function abbreviationForSchool(schoolId) {
        if (schoolId == SchoolIds.MICHIGAN) {
            return "MICH";
        } else if (schoolId == SchoolIds.PENN_STATE) {
            return "PSU";
        }

        return "OSU";
    }
}
