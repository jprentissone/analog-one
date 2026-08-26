#!/bin/zsh

set -euo pipefail

if [[ $# -ne 1 ]]; then
    echo "Usage: scripts/package-beta.zsh <version>"
    echo "Example: scripts/package-beta.zsh 1.4"
    exit 1
fi

VERSION="$1"
PROJECT_DIR="${0:A:h:h}"
MANIFEST="$PROJECT_DIR/manifest.xml"
DIST_DIR="$PROJECT_DIR/dist"
OUTPUT="$DIST_DIR/AnalogOne-Beta-$VERSION.iq"
CHECKSUM="$OUTPUT.sha256"

BETA_APP_ID="6ab2b611-8edf-4f73-8d7d-a56c8a7cf152"
SDK_CONFIG="$HOME/Library/Application Support/Garmin/ConnectIQ/current-sdk.cfg"
DEVELOPER_KEY="$HOME/Documents/Garmin/developer_key"

if ! grep -q "id=\"$BETA_APP_ID\"" "$MANIFEST"; then
    echo "Packaging stopped: manifest.xml is not using the Analog One beta app ID."
    exit 1
fi

if [[ ! -f "$SDK_CONFIG" ]]; then
    echo "Packaging stopped: Garmin current-sdk.cfg was not found."
    exit 1
fi

SDK_ROOT="$(<"$SDK_CONFIG")"
COMPILER="$SDK_ROOT/bin/monkeybrains.jar"

if [[ ! -f "$COMPILER" ]]; then
    echo "Packaging stopped: Garmin compiler was not found at $COMPILER."
    exit 1
fi

if [[ ! -f "$DEVELOPER_KEY" ]]; then
    echo "Packaging stopped: Garmin developer key was not found."
    exit 1
fi

mkdir -p "$DIST_DIR"

java -Xms1g \
    -Dfile.encoding=UTF-8 \
    -Djava.awt.headless=true \
    -jar "$COMPILER" \
    -o "$OUTPUT" \
    -e \
    -f "$PROJECT_DIR/monkey.jungle" \
    -y "$DEVELOPER_KEY" \
    -w

shasum -a 256 "$OUTPUT" > "$CHECKSUM"

echo ""
echo "Beta package ready:"
echo "$OUTPUT"
echo "Checksum:"
cat "$CHECKSUM"
