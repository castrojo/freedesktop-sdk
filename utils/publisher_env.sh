#!/bin/bash

# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

# Keep variables and values in sync with utils/validate_repo.py

# flat-manager tokens to upload the releases
if ! grep -E "^BRANCH=.*beta$" Makefile
then
  export RELEASE_CHANNEL=stable
else
  export RELEASE_CHANNEL=beta
fi

if [ -n "$CI_COMMIT_TAG" ] && [ -n "$FLATHUB_REPO_TOKEN" ]; then
    export RELEASES_SERVER_ADDRESS=https://hub.flathub.org/
    export REPO_TOKEN="${FLATHUB_REPO_TOKEN}"
    case "${CI_COMMIT_TAG}" in
      *rc*) ;&
      *beta*)
        test "$RELEASE_CHANNEL" = "beta"
        ;;
        *)
        test "$RELEASE_CHANNEL" = "stable"
        # Check we have enabled stable ABI before we do any stable release
        [ "${STABLE_ABI}" = "true" ]
        ;;
    esac
elif [ -n "$RELEASES_REPO_TOKEN" ]; then
    export REPO_TOKEN=$RELEASES_REPO_TOKEN
    export RELEASES_SERVER_ADDRESS=https://releases.freedesktop-sdk.io/
    # We always use "stable" here. This is all beta on this server.
    export RELEASE_CHANNEL=stable
fi

if [ -n "$CI_COMMIT_TAG" ]; then
    case "${CI_COMMIT_TAG}" in
        *rc*) ;&
        *beta*)
            export DOCKER_VERSION="${RUNTIME_VERSION}-beta"
            ;;
        *)
            export DOCKER_VERSION="${RUNTIME_VERSION}"
            ;;
    esac
else
    export DOCKER_VERSION="${RUNTIME_VERSION}-devel"
fi
