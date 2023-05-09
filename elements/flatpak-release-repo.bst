kind: flatpak_repo
description: Generates a flatpak repository with all flatpak image elements

build-depends:
- components/flatpak-minimal-image.bst
- filename: flatpak-release-repo-deps.bst
  config:
    flatpak-stack: True
    branch: '%{branch}'
- filename: flatpak-release-repo-extra-deps.bst
  config:
    flatpak-stack: True
    branch: '%{branch-extra}'

config:
  arch: '%{flatpak_arch}' # This is the interface for flatpak-repo plugin
  repo-mode: bare-user-only

  (?):
  - target_arch == 'i686':
      copy-refs:
      - src: runtime/org.freedesktop.Platform.Compat.%{flatpak_arch}/%{flatpak_arch}/%{branch}
        dest: runtime/org.freedesktop.Platform.Compat.%{flatpak_arch}/x86_64/%{branch}
      - src: runtime/org.freedesktop.Platform.Compat.%{flatpak_arch}.Debug/%{flatpak_arch}/%{branch}
        dest: runtime/org.freedesktop.Platform.Compat.%{flatpak_arch}.Debug/x86_64/%{branch}
      - src: runtime/org.freedesktop.Platform.GL.default/%{flatpak_arch}/%{branch}
        dest: runtime/org.freedesktop.Platform.GL32.default/x86_64/%{branch}
      - src: runtime/org.freedesktop.Platform.GL.Debug.default/%{flatpak_arch}/%{branch}
        dest: runtime/org.freedesktop.Platform.GL32.Debug.default/x86_64/%{branch}
      - src: runtime/org.freedesktop.Sdk.Compat.%{flatpak_arch}/%{flatpak_arch}/%{branch}
        dest: runtime/org.freedesktop.Sdk.Compat.%{flatpak_arch}/x86_64/%{branch}
      - src: runtime/org.freedesktop.Sdk.Compat.%{flatpak_arch}.Debug/%{flatpak_arch}/%{branch}
        dest: runtime/org.freedesktop.Sdk.Compat.%{flatpak_arch}.Debug/x86_64/%{branch}
      - src: runtime/org.freedesktop.Platform.VAAPI.Intel/%{flatpak_arch}/%{branch}
        dest: runtime/org.freedesktop.Platform.VAAPI.Intel.%{flatpak_arch}/x86_64/%{branch}
      - src: runtime/org.freedesktop.Platform.ffmpeg-full/%{flatpak_arch}/%{branch}
        dest: runtime/org.freedesktop.Platform.ffmpeg_full.%{flatpak_arch}/x86_64/%{branch}

      - src: runtime/org.freedesktop.Platform.GL.default/%{flatpak_arch}/%{branch-extra}
        dest: runtime/org.freedesktop.Platform.GL32.default/x86_64/%{branch-extra}
      - src: runtime/org.freedesktop.Platform.GL.Debug.default/%{flatpak_arch}/%{branch-extra}
        dest: runtime/org.freedesktop.Platform.GL32.Debug.default/x86_64/%{branch-extra}

  - target_arch == 'arm':
      copy-refs:
      - src: runtime/org.freedesktop.Platform.Compat.%{flatpak_arch}/%{flatpak_arch}/%{branch}
        dest: runtime/org.freedesktop.Platform.Compat.%{flatpak_arch}/aarch64/%{branch}
      - src: runtime/org.freedesktop.Platform.Compat.%{flatpak_arch}.Debug/%{flatpak_arch}/%{branch}
        dest: runtime/org.freedesktop.Platform.Compat.%{flatpak_arch}.Debug/aarch64/%{branch}
      - src: runtime/org.freedesktop.Platform.GL.default/%{flatpak_arch}/%{branch}
        dest: runtime/org.freedesktop.Platform.GL32.default/aarch64/%{branch}
      - src: runtime/org.freedesktop.Platform.GL.Debug.default/%{flatpak_arch}/%{branch}
        dest: runtime/org.freedesktop.Platform.GL32.Debug.default/aarch64/%{branch}
      - src: runtime/org.freedesktop.Sdk.Compat.%{flatpak_arch}/%{flatpak_arch}/%{branch}
        dest: runtime/org.freedesktop.Sdk.Compat.%{flatpak_arch}/x86_64/%{branch}
      - src: runtime/org.freedesktop.Sdk.Compat.%{flatpak_arch}.Debug/%{flatpak_arch}/%{branch}
        dest: runtime/org.freedesktop.Sdk.Compat.%{flatpak_arch}.Debug/x86_64/%{branch}

      - src: runtime/org.freedesktop.Platform.GL.default/%{flatpak_arch}/%{branch-extra}
        dest: runtime/org.freedesktop.Platform.GL32.default/aarch64/%{branch-extra}
      - src: runtime/org.freedesktop.Platform.GL.Debug.default/%{flatpak_arch}/%{branch-extra}
        dest: runtime/org.freedesktop.Platform.GL32.Debug.default/aarch64/%{branch-extra}

  - target_arch == 'aarch64':
      copy-refs:
      - src: runtime/org.freedesktop.Sdk.Compat.%{flatpak_arch}/%{flatpak_arch}/%{branch}
        dest: runtime/org.freedesktop.Sdk.Compat.%{flatpak_arch}/x86_64/%{branch}
      - src: runtime/org.freedesktop.Sdk.Compat.%{flatpak_arch}.Debug/%{flatpak_arch}/%{branch}
        dest: runtime/org.freedesktop.Sdk.Compat.%{flatpak_arch}.Debug/x86_64/%{branch}
