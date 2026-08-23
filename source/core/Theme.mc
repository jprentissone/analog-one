module ThemeIds {
    const CLASSIC = 0;
    const SCARLET_NIGHT = 1;
}

class Theme {
    var backgroundColor;
    var dialColor;
    var minuteTrackColor;
    var handColor;
    var handBorderColor;
    var accentColor;
    var emblemColor;

    function initialize(
        background,
        dial,
        minuteTrack,
        hand,
        handBorder,
        accent,
        emblem
    ) {
        backgroundColor = background;
        dialColor = dial;
        minuteTrackColor = minuteTrack;
        handColor = hand;
        handBorderColor = handBorder;
        accentColor = accent;
        emblemColor = emblem;
    }
}
