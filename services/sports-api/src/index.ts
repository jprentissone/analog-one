import {
  normalizeScoreboard,
  type ScoreboardGame,
  type WatchSportsResponse,
} from "./normalize.ts";
import { getCollegeProfile } from "./profiles.ts";

type Env = {
  CFBD_API_KEY: string;
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

    const profileId = url.searchParams.get("team") ?? "osu";
    const profile = getCollegeProfile(profileId);

    if (profile == null) {
      return jsonResponse({ error: "Unknown college profile" }, 400, 60);
    }

    try {
      const providerResponse = await fetch(CFBD_SCOREBOARD_URL, {
        headers: {
          Authorization: `Bearer ${env.CFBD_API_KEY}`,
        },
      });

      if (!providerResponse.ok) {
        return jsonResponse({ error: "Sports provider unavailable" }, 502, 60);
      }

      const games = (await providerResponse.json()) as ScoreboardGame[];
      const result = normalizeScoreboard(games, {
        featuredTeamId: profile.cfbdTeamId,
        featuredAbbreviation: profile.abbreviation,
        timeZone: env.TIME_ZONE,
      });

      return jsonResponse(result, 200, cacheSeconds(result));
    } catch {
      return jsonResponse({ error: "Sports service unavailable" }, 503, 60);
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
