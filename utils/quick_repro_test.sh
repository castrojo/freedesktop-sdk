#!/bin/bash

# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

set -euo pipefail

ELEMENT=$1
SHA="$(echo "$2" | xargs)" # Strip whitespace from sha
OUTPUT_LOCATION="./.repro-testing"
mkdir -p "$OUTPUT_LOCATION"
for x in $(seq 1 1000); do
  bst artifact delete "$ELEMENT"
  bst build --ignore-project-artifact-remotes --artifact-remote invalid "$ELEMENT"
  bst show --deps none --format "%{artifact-cas-digest}" "$ELEMENT" >"$OUTPUT_LOCATION/build_result_$x.txt"
  if [ "$(cat "$OUTPUT_LOCATION/build_result_$x.txt")" != "$SHA" ]; then
    bst artifact checkout --deps none --directory "$OUTPUT_LOCATION/checkout_$x" "$ELEMENT"
  fi
done
