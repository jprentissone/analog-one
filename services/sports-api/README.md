# Benchcraft Sports API

This Cloudflare Worker keeps the CollegeFootballData API key off the watch and
normalizes the current Ohio State football game into Analog One's compact sports
response.

## Routes

- `GET /health`
- `GET /v1/ncaa/football`

## Sports states

- `0`: none
- `1`: upcoming
- `2`: live
- `3`: final

## Secrets

`CFBD_API_KEY` must be configured as a Cloudflare secret. For local development,
place it in an ignored `.dev.vars` file. Never commit the key.

## Development

```sh
npm install
npm test
npm run dev
```

Deployment will be configured after the local normalization tests pass.

## Reliability behavior

- The featured team is matched by its stable CFBD team ID.
- Kickoffs without an announced time are returned as `TBD`.
- A legitimate absence of games returns sports state `0` with HTTP 200.
- Provider or service failures return an HTTP error, allowing the watch to keep
  its last successful result.
