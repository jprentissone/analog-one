import assert from "node:assert/strict";
import test from "node:test";

import worker from "../src/index.ts";

const env = {
  CFBD_API_KEY: "test-key",
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

test("rejects an unknown college profile before calling the provider", async () => {
  const response = await worker.fetch(
    new Request("https://example.com/v1/ncaa/football?team=unknown"),
    env,
  );

  assert.equal(response.status, 400);
});
