(:background)
module ThemeIds {
    const CLASSIC = 0;
    const SCARLET_NIGHT = 1;
    const MAIZE_BLUE = 2;
    const NAVY_WHITE = 3;
    const SPARTAN_GREEN = 4;
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
