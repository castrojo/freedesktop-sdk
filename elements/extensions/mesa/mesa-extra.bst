kind: meson

(@):
- elements/extensions/mesa/mesa.yml

variables:
  stripdir-suffix: extensions/mesa/mesa.bst # Allows file deduplication between the two extensions
  video_codecs: vc1dec,h264dec,h264enc,h265dec,h265enc
