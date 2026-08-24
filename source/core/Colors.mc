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

    const OREGON_GREEN = 0x154733;
    const OREGON_RING = 0x2f805d;
    const OREGON_YELLOW = 0xfee123;
    const GHOST_OREGON = 0x0a241a;

    const USC_CARDINAL = 0x990000;
    const USC_RING = 0xc62828;
    const USC_GOLD = 0xffc72c;
    const GHOST_USC = 0x330000;

    const WISCONSIN_RED = 0xc5050c;
    const WISCONSIN_RING = 0xe32636;
    const GHOST_WISCONSIN = 0x3a0004;

    // Iowa black is lifted to graphite only where black-on-black would vanish.
    const IOWA_GRAPHITE = 0x303030;
    const IOWA_RING = 0x555555;
    const IOWA_GOLD = 0xffcd00;
    const GHOST_IOWA = 0x181818;

    const WASHINGTON_PURPLE = 0x4b2e83;
    const WASHINGTON_RING = 0x7655a6;
    const WASHINGTON_GOLD = 0xb7a57a;
    const GHOST_WASHINGTON = 0x24163f;

    const NEBRASKA_SCARLET = 0xe41c38;
    const NEBRASKA_RING = 0xf04a5d;
    const NEBRASKA_CREAM = 0xfdf2d0;
    const GHOST_NEBRASKA = 0x41080f;

    const MINNESOTA_MAROON = 0x7a0019;
    const MINNESOTA_RING = 0xa82a46;
    const MINNESOTA_GOLD = 0xffcc33;
    const GHOST_MINNESOTA = 0x30000a;

    const NORTHWESTERN_PURPLE = 0x4e2a84;
    const NORTHWESTERN_RING = 0x7a5aad;
    const GHOST_NORTHWESTERN = 0x261440;

    const ILLINOIS_ORANGE = 0xe84a27;
    const ILLINOIS_NAVY = 0x13294b;
    const ILLINOIS_RING = 0x2a5d8f;
    const GHOST_ILLINOIS = 0x091526;

    const INDIANA_CRIMSON = 0x990000;
    const INDIANA_RING = 0xc6283c;
    const INDIANA_CREAM = 0xeeedeb;
    const GHOST_INDIANA = 0x330000;

    const MARYLAND_RED = 0xe03a3e;
    const MARYLAND_RING = 0xf05b5e;
    const MARYLAND_YELLOW = 0xffd520;
    const GHOST_MARYLAND = 0x410f12;

    const PURDUE_GRAPHITE = 0x303030;
    const PURDUE_RING = 0x6e6250;
    const PURDUE_GOLD = 0xceb888;
    const GHOST_PURDUE = 0x181818;

    const RUTGERS_SCARLET = 0xcc0033;
    const RUTGERS_RING = 0xe23b5b;
    const GHOST_RUTGERS = 0x3b0010;

    const UCLA_BLUE = 0x2d68c4;
    const UCLA_RING = 0x4d86d1;
    const UCLA_GOLD = 0xf2a900;
    const GHOST_UCLA = 0x132e57;

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
