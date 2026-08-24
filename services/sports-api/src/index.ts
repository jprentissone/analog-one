import {
  emptySportsResponse,
  normalizeScoreboard,
  type ScoreboardGame,
  type WatchSportsResponse,
} from "./normalize";

type Env = {
  CFBD_API_KEY: string;
  FEATURED_TEAM: string;
  FEATURED_ABBREVIATION: string;
  TIME_ZONE: string;
};

const CFBD_SCOREBOARD_URL =
  "https://api.collegefootballdata.com/scoreboard?classification=fbs";

export default {
  async fetch(request: Request, env: Env): Promise<Response> {
    const url = new URL(request.url);

    if (url.pathname === "/health") {
      return jsonResponse({ ok: true }, 200, 60);
    }

    if (url.pathname !== "/v1/ncaa/football") {
      return jsonResponse({ error: "Not found" }, 404, 60);
    }

    try {
      const providerResponse = await fetch(CFBD_SCOREBOARD_URL, {
        headers: {
          Authorization: `Bearer ${env.CFBD_API_KEY}`,
        },
      });

      if (!providerResponse.ok) {
        return jsonResponse(emptySportsResponse(), 200, 300);
      }

      const games = (await providerResponse.json()) as ScoreboardGame[];
      const result = normalizeScoreboard(games, {
        featuredTeam: env.FEATURED_TEAM,
        featuredAbbreviation: env.FEATURED_ABBREVIATION,
        timeZone: env.TIME_ZONE,
      });

      return jsonResponse(result, 200, cacheSeconds(result));
    } catch {
      return jsonResponse(emptySportsResponse(), 200, 300);
    }
  },
};

function cacheSeconds(result: WatchSportsResponse) {
  if (result.state === 2) return 60;
  if (result.state === 1) return 900;
  if (result.state === 3) return 3600;
  return 21600;
}

function jsonResponse(value: unknown, status: number, maxAge: number) {
  return Response.json(value, {
    status,
    headers: {
      "Cache-Control": `public, max-age=${maxAge}`,
    },
  });
}
