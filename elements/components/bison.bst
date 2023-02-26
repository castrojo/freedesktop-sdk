kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/flex.bst
- components/git-minimal.bst
- components/gperf.bst
- components/help2man.bst
- components/texinfo.bst

depends:
- bootstrap-import.bst
- components/gettext.bst
- components/m4.bst
- components/perl.bst

variables:
  autogen: ./bootstrap --skip-po --no-git --gnulib-srcdir=%{build-root}/gnulib

config:
  install-commands:
    (>):
    - |
      rm "%{install-root}%{infodir}/dir"

    - |
      find "%{install-root}" -name "lib*.a" -exec rm {} ";"

sources:
- kind: git_repo
  url: savannah:bison.git
  track: v*
  ref: v3.8.2-0-g9beba1919cad5dd08b0cac277c27896808719e4b
- kind: git_module
  path: gnulib
  url: savannah:gnulib.git
  ref: 7818455627c5e54813ac89924b8b67d0bc869146
- kind: git_module
  path: submodules/autoconf
  url: savannah:autoconf.git
  ref: 66fdaea3cfb4e758212c1891913e9a59441d49af
