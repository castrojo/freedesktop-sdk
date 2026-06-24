kind: make

(@): elements/extensions/include/app.yml

build-depends:
- components/mesa-headers.bst

variables:
  make-args: >-
    GLEW_DEST="%{install-root}%{prefix}"
    GLEW_PREFIX="%{prefix}"
    LIBDIR="%{install-root}%{libdir}"
    CFLAGS.EXTRA="${CFLAGS} -fPIC"
    LDFLAGS.EXTRA="${LDFLAGS}"
    STRIP=""

sources:
- kind: tar
  url: sourceforge:projects/glew/files/glew/2.3.1/glew-2.3.1.tgz
  ref: b64790f94b926acd7e8f84c5d6000a86cb43967bd1e688b03089079799c9e889
