(:background)
module ThemeIds {
    const CLASSIC = 0;
    const ALABAMA_CRIMSON = 1;
    const ARKANSAS_CARDINAL = 2;
    const AUBURN_NAVY = 3;
    const FLORIDA_BLUE = 4;
    const GEORGIA_RED = 5;
    const KENTUCKY_BLUE = 6;
    const LSU_PURPLE = 7;
    const MISSISSIPPI_STATE_MAROON = 8;
    const MISSOURI_BLACK_GOLD = 9;
    const OKLAHOMA_CRIMSON = 10;
    const OLE_MISS_NAVY = 11;
    const SOUTH_CAROLINA_GARNET = 12;
    const TENNESSEE_ORANGE = 13;
    const TEXAS_BURNT_ORANGE = 14;
    const TEXAS_AM_MAROON = 15;
    const VANDERBILT_BLACK_GOLD = 16;
}

class Theme {
    var backgroundColor;
    var dialColor;
    var minuteTrackColor;
    var handColor;
    var handBorderColor;
    var accentColor;
    var emblemColor;
    var complicationBorderColor;
    var complicationIconColor;
    var complicationValueColor;
    var complicationLabelColor;

    function initialize(
        background,
        dial,
        minuteTrack,
        hand,
        handBorder,
        accent,
        emblem,
        complicationBorder,
        complicationIcon,
        complicationValue,
        complicationLabel
    ) {
        backgroundColor = background;
        dialColor = dial;
        minuteTrackColor = minuteTrack;
        handColor = hand;
        handBorderColor = handBorder;
        accentColor = accent;
        emblemColor = emblem;
        complicationBorderColor = complicationBorder;
        complicationIconColor = complicationIcon;
        complicationValueColor = complicationValue;
        complicationLabelColor = complicationLabel;
    }
}
