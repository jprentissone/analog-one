export const SportsStates = {
  NONE: 0,
  UPCOMING: 1,
  LIVE: 2,
  FINAL: 3,
} as const;

type Team = {
  id: number;
  name: string;
  points: number | null;
};

export type ScoreboardGame = {
  id: number;
  startDate: string;
  startTimeTBD: boolean;
  status: "scheduled" | "in_progress" | "completed";
  period: number | null;
  clock: string | null;
  homeTeam: Team;
  awayTeam: Team;
};

export type WatchSportsResponse = {
  state: number;
  away: string;
  awayScore: number;
  home: string;
  homeScore: number;
  status: string;
  featured: string;
  startTime: string;
};

type NormalizeOptions = {
  featuredTeamId: number;
  featuredAbbreviation: string;
  timeZone: string;
  now?: Date;
};

const FINAL_RETENTION_MS = 48 * 60 * 60 * 1000;

const TEAM_ABBREVIATIONS: Record<number, string> = {
  2: "AUB",
  8: "ARK",
  30: "USC",
  57: "FLA",
  61: "UGA",
  77: "NW",
  84: "IND",
  96: "UK",
  99: "LSU",
  120: "MD",
  130: "MICH",
  142: "MIZ",
  145: "MISS",
  158: "NEB",
  194: "OSU",
  201: "OU",
  238: "VAN",
  245: "TAMU",
  251: "TEX",
  333: "BAMA",
  344: "MSST",
  356: "ILL",
  2050: "BALL ST",
  2294: "IOWA",
  2309: "KENT ST",
  2483: "ORE",
  2579: "SC",
  2633: "TENN",
};

export function emptySportsResponse(): WatchSportsResponse {
  return {
    state: SportsStates.NONE,
    away: "",
    awayScore: 0,
    home: "",
    homeScore: 0,
    status: "",
    featured: "",
    startTime: "",
  };
}

export function normalizeScoreboard(
  games: ScoreboardGame[],
  options: NormalizeOptions,
): WatchSportsResponse {
  const now = options.now ?? new Date();
  const teamGames = games.filter(
    (game) =>
      game.homeTeam.id === options.featuredTeamId ||
      game.awayTeam.id === options.featuredTeamId,
  );

  const game = selectGame(teamGames, now);
  if (!game) {
    return emptySportsResponse();
  }

  const base = {
    away: abbreviate(game.awayTeam, options),
    awayScore: game.awayTeam.points ?? 0,
    home: abbreviate(game.homeTeam, options),
    homeScore: game.homeTeam.points ?? 0,
    featured: options.featuredAbbreviation,
  };

  if (game.status === "in_progress") {
    return {
      state: SportsStates.LIVE,
      ...base,
      status: formatLiveStatus(game.period, game.clock),
      startTime: "",
    };
  }

  if (game.status === "completed") {
    return {
      state: SportsStates.FINAL,
      ...base,
      status: "FINAL",
      startTime: "",
    };
  }

  return {
    state: SportsStates.UPCOMING,
    ...base,
    status: "",
    startTime: game.startTimeTBD
      ? "TBD"
      : formatStartTime(game.startDate, options.timeZone),
  };
}

function selectGame(games: ScoreboardGame[], now: Date) {
  const live = games.find((game) => game.status === "in_progress");
  if (live) {
    return live;
  }

  const upcoming = games
    .filter(
      (game) =>
        game.status === "scheduled" && new Date(game.startDate) >= now,
    )
    .sort(
      (a, b) =>
        new Date(a.startDate).getTime() - new Date(b.startDate).getTime(),
    )[0];
  if (upcoming) {
    return upcoming;
  }

  return games
    .filter((game) => {
      if (game.status !== "completed") {
        return false;
      }

      const age = now.getTime() - new Date(game.startDate).getTime();
      return age >= 0 && age <= FINAL_RETENTION_MS;
    })
    .sort(
      (a, b) =>
        new Date(b.startDate).getTime() - new Date(a.startDate).getTime(),
    )[0];
}

function abbreviate(team: Team, options: NormalizeOptions) {
  if (team.id === options.featuredTeamId) {
    return options.featuredAbbreviation;
  }

  return TEAM_ABBREVIATIONS[team.id] ?? fallbackAbbreviation(team.name);
}

function fallbackAbbreviation(teamName: string) {
  return teamName
    .split(/\s+/)
    .slice(0, 2)
    .map((word) => word.slice(0, 4).toUpperCase())
    .join(" ");
}

function formatLiveStatus(period: number | null, clock: string | null) {
  const periodText = period ? `Q${period}` : "LIVE";
  return clock ? `${periodText} ${clock}` : periodText;
}

function formatStartTime(startDate: string, timeZone: string) {
  const parts = new Intl.DateTimeFormat("en-US", {
    timeZone,
    weekday: "short",
    hour: "numeric",
    minute: "2-digit",
    hour12: true,
  }).formatToParts(new Date(startDate));

  const weekday = parts.find((part) => part.type === "weekday")?.value ?? "";
  const hour = parts.find((part) => part.type === "hour")?.value ?? "";
  const minute = parts.find((part) => part.type === "minute")?.value ?? "00";

  return `${weekday.toUpperCase()} ${hour}:${minute}`;
}
