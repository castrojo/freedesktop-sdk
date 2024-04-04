kind: import

config:
  target: '%{sysconfdir}/flatpak/remotes.d'

sources:
- kind: remote
  url: tar_https:flathub.org/repo/flathub.flatpakrepo
  ref: 3371dd250e61d9e1633630073fefda153cd4426f72f4afa0c3373ae2e8fea03a
