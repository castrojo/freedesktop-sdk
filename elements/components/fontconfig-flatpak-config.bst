kind: import

config:
  target: "%{sysconfdir}/fonts/conf.d"

sources:
- kind: local
  path: files/fontconfig/50-flatpak.conf
- kind: local
  path: files/fontconfig/05-flatpak-fontpath.conf
