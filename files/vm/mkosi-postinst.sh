#!/bin/sh
set -eu

# NOTE: mkosi+repart cannot set the filesystem UUID, only the partition UUID.
# The efi.bst boot config uses root=UUID=..., which refers to the filesystem
# UUID. To keep efi.bst unchanged for efi.bst whilst having bootable mkosi images,
# we rewrite root=UUID= -> root=PARTUUID= in the loader entries here.
# We can remove this workaround if we ever stop using non-mkosi-efi.bst or if
# systemd-repart ever gains a filesystem UUID setting.

if [ -d /boot/loader/entries ]; then
  for f in /boot/loader/entries/*.conf; do
    [ -e "$f" ] || continue
    sed -i 's/\<root=UUID=/root=PARTUUID=/' "$f"
  done
fi
