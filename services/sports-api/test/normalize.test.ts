import assert from "node:assert/strict";
import test from "node:test";

import {
  normalizeScoreboard,
  SportsStates,
  type ScoreboardGame,
} from "../src/normalize.ts";

const options = {
  featuredTeamId: 194,
  featuredAbbreviation: "OSU",
  timeZone: "America/New_York",
  now: new Date("2026-09-05T16:00:00Z"),
};

function game(overrides: Partial<ScoreboardGame>): ScoreboardGame {
  return {
    id: 1,
    startDate: "2026-09-05T19:30:00Z",
    startTimeTBD: false,
    status: "scheduled",
    period: null,
    clock: null,
    awayTeam: { id: 194, name: "Ohio State Buckeyes", points: null },
    homeTeam: { id: 251, name: "Texas Longhorns", points: null },
    ...overrides,
  };
}

test("returns NONE when the featured team has no game", () => {
  const result = normalizeScoreboard([], options);
  assert.equal(result.state, SportsStates.NONE);
});

test("normalizes the next scheduled game", () => {
  const result = normalizeScoreboard([game({})], options);
  assert.equal(result.state, SportsStates.UPCOMING);
  assert.equal(result.away, "OSU");
  assert.equal(result.home, "TEX");
  assert.equal(result.startTime, "SAT 3:30");
});

test("matches the featured team by stable CFBD ID", () => {
  const renamedTeamGame = game({
    awayTeam: { id: 194, name: "A Renamed Ohio State Team", points: null },
  });

  const result = normalizeScoreboard([renamedTeamGame], options);
  assert.equal(result.state, SportsStates.UPCOMING);
  assert.equal(result.away, "OSU");
});

test("uses a curated abbreviation for the scheduled opponent", () => {
  const ballStateGame = game({
    awayTeam: { id: 2050, name: "Ball State Cardinals", points: null },
    homeTeam: { id: 194, name: "Ohio State Buckeyes", points: null },
  });

  const result = normalizeScoreboard([ballStateGame], options);
  assert.equal(result.away, "BALL ST");
  assert.equal(result.home, "OSU");
});

test("shows TBD instead of a placeholder midnight kickoff", () => {
  const result = normalizeScoreboard(
    [game({ startTimeTBD: true, startDate: "2026-09-26T04:00:00Z" })],
    options,
  );

  assert.equal(result.startTime, "TBD");
});

test("prioritizes a live game and formats its status", () => {
  const liveGame = game({
    status: "in_progress",
    period: 3,
    clock: "6:42",
    awayTeam: { id: 194, name: "Ohio State Buckeyes", points: 31 },
    homeTeam: { id: 130, name: "Michigan Wolverines", points: 10 },
  });

  const result = normalizeScoreboard([liveGame], options);
  assert.equal(result.state, SportsStates.LIVE);
  assert.equal(result.status, "Q3 6:42");
  assert.equal(result.awayScore, 31);
  assert.equal(result.homeScore, 10);
});

test("retains a recently completed game as FINAL", () => {
  const finalGame = game({
    status: "completed",
    startDate: "2026-09-04T16:00:00Z",
    awayTeam: { id: 194, name: "Ohio State Buckeyes", points: 38 },
    homeTeam: { id: 130, name: "Michigan Wolverines", points: 27 },
  });

  const result = normalizeScoreboard([finalGame], options);
  assert.equal(result.state, SportsStates.FINAL);
  assert.equal(result.status, "FINAL");
});
