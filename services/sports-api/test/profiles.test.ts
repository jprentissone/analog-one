import assert from "node:assert/strict";
import test from "node:test";

import {
  getCollegeProfile,
  getCollegeProfileIds,
} from "../src/profiles.ts";

test("defines the Ohio State profile with its stable CFBD ID", () => {
  const profile = getCollegeProfile("osu");

  assert.equal(profile?.cfbdTeamId, 194);
  assert.equal(profile?.abbreviation, "OSU");
  assert.equal(profile?.primaryColor, "#BA0C2F");
});

test("defines a reusable Michigan profile", () => {
  const profile = getCollegeProfile("MICHIGAN");

  assert.equal(profile?.cfbdTeamId, 130);
  assert.equal(profile?.abbreviation, "MICH");
  assert.equal(profile?.primaryColor, "#00274C");
});

test("lists only supported profile IDs", () => {
  assert.deepEqual(getCollegeProfileIds().sort(), [
    "alabama",
    "arkansas",
    "auburn",
    "florida",
    "georgia",
    "illinois",
    "indiana",
    "iowa",
    "kentucky",
    "lsu",
    "maryland",
    "michigan",
    "michigan_state",
    "minnesota",
    "mississippi_state",
    "missouri",
    "nebraska",
    "northwestern",
    "oklahoma",
    "ole_miss",
    "oregon",
    "osu",
    "penn_state",
    "purdue",
    "rutgers",
    "south_carolina",
    "tennessee",
    "texas",
    "texas_am",
    "ucla",
    "usc",
    "vanderbilt",
    "washington",
    "wisconsin",
  ]);
  assert.equal(getCollegeProfile("unknown"), null);
});

test("defines both edition catalogs with unique stable IDs and abbreviations", () => {
  const profiles = getCollegeProfileIds().map((id) => getCollegeProfile(id));

  assert.equal(profiles.length, 34);
  assert.ok(profiles.every((profile) => profile !== null));
  assert.equal(new Set(profiles.map((profile) => profile?.cfbdTeamId)).size, 34);
  assert.equal(new Set(profiles.map((profile) => profile?.abbreviation)).size, 34);
});
