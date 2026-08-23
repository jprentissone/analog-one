module ThemeIds {
    const CLASSIC = 0;
    const SCARLET_NIGHT = 1;
}

class Theme {
    var backgroundColor;
    var dialColor;
    var handColor;
    var handBorderColor;
    var accentColor;
    var emblemColor;

    function initialize(background, dial, hand, handBorder, accent, emblem) {
        backgroundColor = background;
        dialColor = dial;
        handColor = hand;
        handBorderColor = handBorder;
        accentColor = accent;
        emblemColor = emblem;
    }
}
