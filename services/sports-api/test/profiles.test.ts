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
  assert.deepEqual(getCollegeProfileIds().sort(), ["michigan", "osu"]);
  assert.equal(getCollegeProfile("unknown"), null);
});
