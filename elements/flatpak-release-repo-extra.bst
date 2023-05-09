kind: flatpak_repo
description: Generates a flatpak repository with an extra set of flatpak image elements

build-depends:
- components/flatpak-minimal.bst
- flatpak-release-repo-extra-deps.bst

variables:
  branch: '%{branch-extra}'

config:
  arch: '%{flatpak_arch}' # This is the interface for flatpak-repo plugin
  repo-mode: bare-user-only

  environment:
  - components/flatpak-minimal.bst

  (?):
  - target_arch == 'i686':
      copy-refs:
      - src: runtime/org.freedesktop.Platform.GL.default/%{flatpak_arch}/%{branch}
        dest: runtime/org.freedesktop.Platform.GL32.default/x86_64/%{branch}
      - src: runtime/org.freedesktop.Platform.GL.Debug.default/%{flatpak_arch}/%{branch}
        dest: runtime/org.freedesktop.Platform.GL32.Debug.default/x86_64/%{branch}

  - target_arch == 'arm':
      copy-refs:
      - src: runtime/org.freedesktop.Platform.GL.default/%{flatpak_arch}/%{branch}
        dest: runtime/org.freedesktop.Platform.GL32.default/aarch64/%{branch}
      - src: runtime/org.freedesktop.Platform.GL.Debug.default/%{flatpak_arch}/%{branch}
        dest: runtime/org.freedesktop.Platform.GL32.Debug.default/aarch64/%{branch}
