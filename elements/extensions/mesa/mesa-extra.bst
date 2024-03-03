kind: meson

(@):
- elements/extensions/mesa/mesa.yml

variables:
  stripdir-suffix: extensions/mesa/mesa.bst # Allows file deduplication between the two extensions
  video_codecs: all
