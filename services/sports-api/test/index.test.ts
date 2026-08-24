import assert from "node:assert/strict";
import test from "node:test";

import worker from "../src/index.ts";

const env = {
  CFBD_API_KEY: "test-key",
  FEATURED_TEAM_ID: "194",
  FEATURED_ABBREVIATION: "OSU",
  TIME_ZONE: "America/New_York",
};

test("keeps provider failures distinct from a legitimate no-game response", async () => {
  const originalFetch = globalThis.fetch;
  globalThis.fetch = async () => new Response("Unauthorized", { status: 401 });

  try {
    const response = await worker.fetch(
      new Request("https://example.com/v1/ncaa/football"),
      env,
    );
    const body = (await response.json()) as { error: string };

    assert.equal(response.status, 502);
    assert.equal(body.error, "Sports provider unavailable");
  } finally {
    globalThis.fetch = originalFetch;
  }
});

test("rejects an invalid featured-team configuration", async () => {
  const originalFetch = globalThis.fetch;
  globalThis.fetch = async () =>
    Response.json([], { headers: { "Content-Type": "application/json" } });

  try {
    const response = await worker.fetch(
      new Request("https://example.com/v1/ncaa/football"),
      { ...env, FEATURED_TEAM_ID: "not-a-team-id" },
    );

    assert.equal(response.status, 500);
  } finally {
    globalThis.fetch = originalFetch;
  }
});
