kind: snap_image

(@):
- snap-version.yml

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
    name: "freedesktop-sdk-vulkaninfo-%{snap-branch}"
    version: "%{runtime-version}"
    summary: "vulkaninfo for Freedesktop SDK %{branch}"
    description: >-
      vulkaninfo provides information on available Vulkan
      devices. This is targeted to run on Freedesktop SDK runtime.
      This application is meant for troubleshooting issues with Vulkan
      when using Freedesktop SDK runtime.
    type: app
    base: "freedesktop-sdk-runtime-%{snap-branch}"
    architectures:
      - "%{snap_arch}"
    confinement: strict
    grade: "%{snap_grade}"
    apps:
      vulkaninfo:
        command: vulkaninfo-wrapper
        plugs:
          - x11
          - opengl
          - wayland
    layout:
      /var/app:
        bind: $SNAP/app

depends:
  - filename: extensions/vulkaninfo/vulkan-tools.bst
    type: build
  - filename: snap-images/vulkaninfo-wrapper.bst
    type: build
