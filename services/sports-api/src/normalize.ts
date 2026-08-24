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
  featuredTeam: string;
  featuredAbbreviation: string;
  timeZone: string;
  now?: Date;
};

const FINAL_RETENTION_MS = 48 * 60 * 60 * 1000;

const TEAM_ABBREVIATIONS: Record<string, string> = {
  "Ohio State": "OSU",
  Michigan: "MICH",
  Texas: "TEX",
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
      game.homeTeam.name === options.featuredTeam ||
      game.awayTeam.name === options.featuredTeam,
  );

  const game = selectGame(teamGames, now);
  if (!game) {
    return emptySportsResponse();
  }

  const base = {
    away: abbreviate(game.awayTeam.name, options),
    awayScore: game.awayTeam.points ?? 0,
    home: abbreviate(game.homeTeam.name, options),
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
    startTime: formatStartTime(game.startDate, options.timeZone),
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

function abbreviate(teamName: string, options: NormalizeOptions) {
  if (teamName === options.featuredTeam) {
    return options.featuredAbbreviation;
  }

  return TEAM_ABBREVIATIONS[teamName] ?? teamName.slice(0, 4).toUpperCase();
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
