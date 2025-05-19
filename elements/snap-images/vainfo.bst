kind: snap_image

variables:
  lib: lib
  prefix: /app

config:
  directory: "/"
  include:
    - app
  exclude:
    - debug
    - devel
    - tests
    - shells
  include-orphans: False

  metadata:
    name: "freedesktop-sdk-vainfo-%{freedesktop-sdk-snap-branch}"
    version: "%{freedesktop-sdk-snap-branch}"
    summary: "vainfo for Freedesktop SDK %{freedesktop-sdk-snap-branch}"
    description: >-
      vainfo provides information from VA-API drivers
      This is targeted to run on Freedesktop SDK runtime.
      This application is meant for troubleshooting issues with VA-API
      when using Freedesktop SDK runtime.
    type: app
    base: "freedesktop-sdk-runtime-%{freedesktop-sdk-snap-branch}"
    architectures:
      - "%{snap_arch}"
    confinement: strict
    grade: "%{snap_grade}"
    apps:
      vainfo:
        command: vainfo-wrapper
        plugs:
          - x11
          - opengl
          - wayland
    layout:
      /var/app:
        bind: $SNAP/app

depends:
  - filename: extensions/vainfo/libva-utils.bst
    type: build
  - filename: snap-images/vainfo-wrapper.bst
    type: build
