#!/bin/bash

# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

PERL_FULL_VER="$(perl -e 'print substr($^V, 1);')"
PERL_ABI_VER="${PERL_FULL_VER%.*}"

echo "Found Perl version: $PERL_FULL_VER"
echo "Found Perl ABI version: $PERL_ABI_VER"

# We expect modules to be installed under sitelibdir which has
# ABI version, not the full version with subversion in it
JSON_PM_PATH="/app/lib/perl5/site_perl/$PERL_ABI_VER/JSON.pm"

if [ -f "$JSON_PM_PATH" ]; then
	echo "Found $JSON_PM_PATH"
else
	echo "Did not find $JSON_PM_PATH" && exit 1
fi

# Check that if some dist dir got compiled with the patch version
# then we should fix it to point to the ABI version
if perl -MConfig -E 'say for map { "$_: $Config{$_}" } sort keys %Config' | grep -E "\.?/[-A-Za-z0-9_.\/]*${PERL_FULL_VER}[-A-Za-z0-9_.\/]*"; then
  echo "$PERL_FULL_VER found in perl config" && exit 1
else
	echo "Did not find $PERL_FULL_VER in perl config"
fi

exit 0
