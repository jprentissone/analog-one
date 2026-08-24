import Toybox.Application;

(:background)
class SettingsManager {
    const SCHOOL_KEY = "school";
    const THEME_KEY = "theme";

    function initialize() {}

    function getSchoolId() {
        var schoolId = Application.Properties.getValue(SCHOOL_KEY);

        if (schoolId != null && schoolId >= SchoolIds.NEUTRAL) {
            return schoolId;
        }

        var legacyThemeId = Application.Properties.getValue(THEME_KEY);
        var migratedSchoolId = SchoolIds.fromLegacyTheme(legacyThemeId);

        Application.Properties.setValue(SCHOOL_KEY, migratedSchoolId);
        return migratedSchoolId;
    }

    function getThemeId() {
        return SchoolIds.themeForSchool(getSchoolId());
    }

    function setSchoolId(schoolId) as Void {
        Application.Properties.setValue(SCHOOL_KEY, schoolId);
    }

    function setThemeId(themeId) as Void {
        setSchoolId(SchoolIds.fromLegacyTheme(themeId));
    }
}
