(:background)
module ThemeIds {
    const CLASSIC = 0;
    const SCARLET_NIGHT = 1;
    const MAIZE_BLUE = 2;
    const NAVY_WHITE = 3;
    const SPARTAN_GREEN = 4;
    const OREGON_GREEN = 5;
    const USC_CARDINAL = 6;
    const WISCONSIN_RED = 7;
    const IOWA_BLACK_GOLD = 8;
    const WASHINGTON_PURPLE = 9;
    const NEBRASKA_SCARLET = 10;
    const MINNESOTA_MAROON = 11;
    const NORTHWESTERN_PURPLE = 12;
    const ILLINOIS_ORANGE = 13;
    const INDIANA_CRIMSON = 14;
    const MARYLAND_RED = 15;
    const PURDUE_BLACK_GOLD = 16;
    const RUTGERS_SCARLET = 17;
    const UCLA_BLUE_GOLD = 18;
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
