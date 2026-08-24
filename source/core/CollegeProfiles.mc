(:background)
module CollegeProfileIds {
    const OSU = "osu";
    const MICHIGAN = "michigan";
    const PENN_STATE = "penn_state";
    const MICHIGAN_STATE = "michigan_state";
    const OREGON = "oregon";
    const USC = "usc";

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
        }

        return "OSU";
    }
}
