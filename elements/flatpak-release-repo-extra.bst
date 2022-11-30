kind: flatpak_repo
description: Generates a flatpak repository with an extra set of flatpak image elements

build-depends:
- components/flatpak-minimal-image.bst
- filename: flatpak-release-repo-extra-deps.bst
  config:
    flatpak-stack: True

variables:
  branch: '%{branch-extra}'

config:
  arch: '%{flatpak_arch}' # This is the interface for flatpak-repo plugin
  repo-mode: bare-user-only

  (?):
  - target_arch == 'i686':
      copy-refs:
      - src: runtime/org.freedesktop.Platform.GL.default/%{flatpak_arch}/%{branch}
        dest: runtime/org.freedesktop.Platform.GL32.default/x86_64/%{branch}

  - target_arch == 'arm':
      copy-refs:
      - src: runtime/org.freedesktop.Platform.GL.default/%{flatpak_arch}/%{branch}
        dest: runtime/org.freedesktop.Platform.GL32.default/aarch64/%{branch}
