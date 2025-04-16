kind: meson

build-depends:
- public-stacks/buildsystem-meson.bst

depends:
- bootstrap-import.bst
- components/gstreamer.bst
- components/gstreamer-plugins-base.bst
- components/orc.bst

variables:
  command-subdir: subprojects/gst-plugins-ugly

  meson-local: >-
    -Dauto_features=disabled
    -Dasfdemux=enabled
    -Ddvdlpcmdec=enabled
    -Ddvdsub=enabled
    -Drealmedia=enabled
    -Dorc=enabled
    -Dpackage-origin="freedesktop-sdk"

public:
  cpe:
    product: gstreamer
    patches:
    - CVE-2024-47537
    - CVE-2024-47538
    - CVE-2024-47540
    - CVE-2024-47606
    - CVE-2024-47607
    - CVE-2024-47613
    - CVE-2024-47615
    - CVE-2024-47597
    - CVE-2024-47598
    - CVE-2024-47600
    - CVE-2024-47774
    - CVE-2024-47775
    - CVE-2024-47776
    - CVE-2024-47777
    - CVE-2024-47834
    - CVE-2024-47539
    - CVE-2024-47541
    - CVE-2024-47542
    - CVE-2024-47543
    - CVE-2024-47544
    - CVE-2024-47545
    - CVE-2024-47546
    - CVE-2024-47596
    - CVE-2024-47599
    - CVE-2024-47601
    - CVE-2024-47602
    - CVE-2024-47603
    - CVE-2024-47778
    - CVE-2024-47835

(@):
- elements/include/gstreamer-source.yml
