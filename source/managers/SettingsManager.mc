import Toybox.Application;

class SettingsManager {
    const THEME_KEY = "theme";

    function initialize() {}

    function getThemeId() {
        var savedTheme = Application.Properties.getValue(THEME_KEY);

        if (savedTheme == null) {
            return ThemeIds.CLASSIC;
        }

        return savedTheme;
    }

    function setThemeId(themeId) as Void {
        Application.Properties.setValue(THEME_KEY, themeId);
    }
}
