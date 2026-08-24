import Toybox.Application;

class SettingsManager {
    const THEME_KEY = "theme";

    function initialize() {}

    function getThemeId() {
        return Application.Properties.getValue(THEME_KEY);
    }

    function setThemeId(themeId) as Void {
        Application.Properties.setValue(THEME_KEY, themeId);
    }
}
