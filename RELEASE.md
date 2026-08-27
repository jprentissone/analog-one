# Analog One College South Release Process

## Release identities

- App ID: `6c548c4b-c3ca-44cc-94e5-ddb38715f562`

College South is a separate Connect IQ app and must never reuse the College
North app ID. A separate beta ID can be introduced later if needed.

## Package a beta

From the AnalogOneCollegeSouth project folder, run:

```bash
scripts/package-beta.zsh 1.4
```

This creates:

- `dist/AnalogOne-College-South-Beta-1.4.iq`
- `dist/AnalogOne-College-South-Beta-1.4.iq.sha256`

The script stops before building if the manifest is not using the College South
app ID.

## Package a production release candidate

From the AnalogOneCollegeSouth project folder, run:

```bash
scripts/package-production.zsh 1.0.0
```

This creates:

- `dist/AnalogOne-College-South-1.0.0.iq`
- `dist/AnalogOne-College-South-1.0.0.iq.sha256`

The production script stops if the manifest does not contain the production app
ID or if temporary marketing-preview or fake-score markers remain in source.

## Production listing metadata

- Launch price: `$6.99`
- Privacy policy: `https://analogonewatch.com/privacy`
- Support page: `https://analogonewatch.com/support`
- Support email: `jsp@benchcraftstudio.com`

## Upload checklist

1. Confirm the package filename contains the intended version.
2. Create a new beta version in the Connect IQ developer dashboard.
3. Use the same version label in the dashboard and package filename.
4. Upload the newly generated package.
5. Confirm Connect IQ shows the new version before installing it.
6. If the watch does not offer an update, remove the old beta and reinstall the
   newest version.
7. Run the physical-device validation checklist before promoting the build.

## Git checklist

- Commit source and resource changes only after simulator and physical testing.
- Do not commit `.iq` packages or checksum files.
- Never replace the College South app ID with the College North app ID.
- Tag a public release only after verifying the College South app ID.

## Connect IQ production review checklist

- Use only the independently developed, factual school presentation approved for
  this product. Do not add school or conference logos, mascots, uniforms, or
  claims of official affiliation without separate authorization.
- State in the store description that Analog One is independently developed and
  is not affiliated with or endorsed by any conference, university, or athletic
  organization.
- Retain the supporting fair-use analysis in the business records.
- Give Garmin review notes that explain school selection, background refresh
  timing, and the upcoming, live, final, no-game, updating, offline, and data-error
  states.
- Make the score feature reviewable even when no game is active, and verify that
  network or API failures never crash or blank the watch face.
- Keep the CollegeFootballData API credential in the Cloudflare Worker secret
  store; never include it in the Connect IQ package.
- Document what the Worker receives, stores, and retains. Publish or update the
  privacy policy if the app collects or retains user or device information.
- Test the full school selector on physical devices, including scrolling,
  switching, persistence, theme refresh, and score refresh.
- Confirm every product in `manifest.xml` is eligible for Garmin monetization and
  passes its device-specific build and runtime-memory checks.
- Validate store icons, screenshots, hero art, and descriptions against Garmin's
  current Connect IQ brand and asset rules. Do not use unauthorized Garmin or
  school branding.
- Decide whether the first public production listing is paid before publication;
  converting a public free app to paid requires another review and may require
  existing users to purchase it.
- Accurately disclose the price and included functionality, and provide Garmin
  with complete reviewer instructions rather than hiding or bypassing features.
