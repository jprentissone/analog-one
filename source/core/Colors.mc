module AnalogColors {
    // AMOLED foundation
    const TRUE_BLACK = 0x000000;

    // Primary and secondary whites
    const HAND_WHITE = 0xffffff;
    const DIAL_WHITE = 0xe6e6e6;
    const MINUTE_GRAY = 0xa0a0a0;

    // Structural tones
    const GRAPHITE = 0x383838;
    const GHOST_GRAY = 0x202020;

    // Benchcraft accent tones
    const SCARLET = 0xd00000;
    const DARK_SCARLET = 0x660000;
    const GHOST_SCARLET = 0x300000;

    const MICHIGAN_BLUE = 0x00274c;
    // Thin blue rings need a brighter display variant on true-black AMOLED.
    const MICHIGAN_RING = 0x1b5f9c;
    const MAIZE = 0xffcb05;
    const GHOST_BLUE = 0x001426;

    const PENN_STATE_NAVY = 0x041e42;
    // Preserve official navy above; use this only for thin display details.
    const PENN_STATE_RING = 0x1f5f8f;
    const PENN_STATE_WHITE = 0xffffff;
    const GHOST_NAVY = 0x020f21;

    const MICHIGAN_STATE_GREEN = 0x18453b;
    // Brighter related green for thin details on true-black AMOLED.
    const MICHIGAN_STATE_RING = 0x2f806e;
    const GHOST_GREEN = 0x0c241f;

    // Semantic weather colors
    const WEATHER_SUN = 0xffc400;
    const WEATHER_CLOUD = 0xd9d9d9;
    const WEATHER_RAIN = 0x3fa9f5;
    const WEATHER_SNOW = 0xcfefff;

    // Semantic battery colors
    const BATTERY_CHARGING = 0x00c853;
    const BATTERY_WARNING = 0xffb300;
    const BATTERY_CRITICAL = 0xff0000;
}
