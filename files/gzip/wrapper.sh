#!/bin/sh
# If SOURCE_DATE_EPOCH is set, default to --no-name for reproducibility.
# Pass --name explicitly to override.
if [ -n "$SOURCE_DATE_EPOCH" ]; then
    exec gzip.bin --no-name "$@"
else
    exec gzip.bin "$@"
fi
