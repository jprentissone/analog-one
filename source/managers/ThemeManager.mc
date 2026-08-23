import Toybox.Graphics;

class ThemeManager {
    var _activeTheme as Theme;

    function initialize(themeId) {
        if (themeId == ThemeIds.SCARLET_NIGHT) {
            _activeTheme = createScarletNight();
        } else {
            _activeTheme = createAnalogOneClassic();
        }
    }

    function getTheme() as Theme {
        return _activeTheme;
    }

    function createAnalogOneClassic() as Theme {
        return new Theme(
            Graphics.COLOR_BLACK, // Background
            Graphics.COLOR_WHITE, // Dial
            Graphics.COLOR_WHITE, // Hands
            Graphics.COLOR_DK_GRAY, // Hand borders
            Graphics.COLOR_RED, // Accent
            0x202020 // Ghosted emblem
        );
    }

    function createScarletNight() as Theme {
        return new Theme(
            Graphics.COLOR_BLACK, // Background
            0xcccccc, // Dial
            Graphics.COLOR_WHITE, // Hands
            0x660000, // Hand borders
            Graphics.COLOR_RED, // Accent
            0x300000 // Ghosted emblem
        );
    }
}
