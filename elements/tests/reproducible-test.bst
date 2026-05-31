kind: stack
description: Collection of things that reproducible test should run with

depends:
# All components
- platform.bst
- sdk.bst
- components.bst

# Base elements:
- components/_private/avahi-base.bst
- components/_private/cryptsetup-base.bst
- components/_private/cups-base.bst
- components/_private/dbus-base.bst
- components/_private/flex-base.bst
- components/gstreamer-plugins-base.bst
- components/linux-pam-base.bst
- components/_private/pipewire-base.bst
- components/_private/systemd-base.bst
- components/_private/xdg-desktop-portal-base.bst

# Outputs
- flatpak-release-repo-deps.bst
- flatpak-release-repo-extra-deps.bst
- oci/platform-oci.bst
- oci/sdk-oci.bst
- oci/flatpak-oci.bst
- oci/toolbox-oci.bst
