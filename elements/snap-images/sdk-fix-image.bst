kind: script
build-depends:
- bootstrap-import.bst
- filename: snap-images/sdk-snap-image.bst
  config:
    location: "%{install-root}"

variables:
  install-root: /buildstream-install

  # Note: /app is only for flatpak application compatibility
  # so that applications can bind themselves to the path
  # The rest comes from Snap.
  required-dirs: >-
    /dev
    /etc
    /home
    /root
    /proc
    /sys
    /tmp
    /var/snap
    /var/lib/snapd
    /var/tmp
    /run
    /usr/src
    /var/log
    /media
    /usr/lib/snapd
    /lib/modules
    /mnt
    /usr/local/share/fonts
    /snap
    /var/app

config:
  commands:
    - |
      rm -rf "%{install-root}/etc"

    # Because snapd does not allow binding /app, then we need to mount it in /var/app
    - |
      ln -s var/app "%{install-root}/app"

    - |
      for dir in %{required-dirs}
      do
        mkdir -p "%{install-root}${dir}"
      done
