kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: public-stacks/buildsystem-autotools.bst
  type: build

sources:
- kind: git_repo
  url: github:akheron/jansson.git
  track: v*
  ref: v2.15.1-0-gdbb5fb3636e155fccfce4cd215de752779bd6971
