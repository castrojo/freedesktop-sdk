# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: manual

build-depends:
- public-stacks/buildsystem-go.bst

depends:
- components/git.bst

variables:
  optimize-debug: "false"

config:
  build-commands:
  - |
    go build

  install-commands:
  - install -Dm755 -t "%{install-root}%{bindir}" git-lfs

  - |
    %{install-extra}

public:
  bst:
    integration-commands:
    - |
      cat << EOF >> %{sysconfdir}/gitconfig
      [filter "lfs"]
      	required = true
      	clean = git-lfs clean -- %f
      	smudge = git-lfs smudge -- %f
      	process = git-lfs filter-process
      EOF

sources:
- kind: git_repo
  url: github:git-lfs/git-lfs.git
  track: v*
  ref: v3.8.0-0-gaece9221f8c09221a14395d964806b956289bc07
- kind: go_mod_vendor
  ref:
  - module: github.com/alexbrainman/sspi
    version: v0.0.0-20210105120005-909beea2cc74
    explicit: True
    sha256sum: f094ecfc4554a9ca70f0ade41747123f3161a15fb1a6112305b99731befc8648
  - module: github.com/avast/retry-go
    version: v3.0.0+incompatible
    explicit: True
    sha256sum: fef922805a0c119535b556fcb210e89509e184645b64c5dd516aefeac6a4a944
  - module: github.com/davecgh/go-spew
    version: v1.1.1
    explicit: True
    sha256sum: 6b44a843951f371b7010c754ecc3cabefe815d5ced1c5b9409fb2d697e8a890d
  - module: github.com/dpotapov/go-spnego
    version: v0.0.0-20210315154721-298b63a54430
    explicit: True
    sha256sum: c0cd9b070a6dbeeeb64ea699cb799344f8bdd4db27f7e8d56547d566fa31d2b9
  - module: github.com/git-lfs/gitobj/v2
    version: v2.1.1
    explicit: True
    sha256sum: a3db7e0333198a034ec254d3bf39cc616f7788f9151e5c8388059cf36ea1c315
  - module: github.com/git-lfs/go-netrc
    version: v0.0.0-20250218165306-ba0029b43d11
    explicit: True
    sha256sum: 88471d8a25b6dc8632d4610a14b7ba4708b61e375e5d38c93fd54c95aed70311
  - module: github.com/git-lfs/pktline
    version: v0.0.0-20210330133718-06e9096e2825
    explicit: True
    sha256sum: b3fe495df730f006a8a5dc58c5d1a1d42bc07354f49f11fcb314a9225a3eb92f
  - module: github.com/git-lfs/wildmatch/v2
    version: v2.0.1
    explicit: True
    sha256sum: e9a32b3adb9e204768163644a5c8882e7ab934078c5be8014ca637cc2d731a64
  - module: github.com/golang/groupcache
    version: v0.0.0-20241129210726-2c02b8208cf8
    explicit: True
    sha256sum: 163367355442a630b12b0b452892cd98e99fcfdf7e40b68d358be73479cc1c23
  - module: github.com/gorilla/securecookie
    version: v1.1.1
    explicit: False
    sha256sum: dd83a4230e11568159756bbea4d343c88df0cd1415bbbc7cd5badad6cd2ed903
  - module: github.com/gorilla/sessions
    version: v1.2.1
    explicit: False
    sha256sum: 2c6aeebfef8062537fd7778067e5e99d4c13f79ac63114e905c97040a6e6b523
  - module: github.com/hashicorp/go-uuid
    version: v1.0.2
    explicit: True
    sha256sum: 30e419ebb4658e789be8ef1f5629faccc15d6571c6914a51afdcbaf74a5862b8
  - module: github.com/inconshreveable/mousetrap
    version: v1.1.0
    explicit: True
    sha256sum: 526674de624d7db108cfe7653ef110ccdfd97bc85026254224815567928ed243
  - module: github.com/jcmturner/aescts/v2
    version: v2.0.0
    explicit: True
    sha256sum: 717a211ad4aac248cf33cadde73059c13f8e9462123a0ab2fed5c5e61f7739d7
  - module: github.com/jcmturner/dnsutils/v2
    version: v2.0.0
    explicit: True
    sha256sum: f9188186b672e547cfaef66107aa62d65054c5d4f10d4dcd1ff157d6bf8c275d
  - module: github.com/jcmturner/gofork
    version: v1.0.0
    explicit: True
    sha256sum: 5e015dd9b038f1dded0b2ded77e529d2f6ba0bed228a98831af5a3610eefcb52
  - module: github.com/jcmturner/goidentity/v6
    version: v6.0.1
    explicit: True
    sha256sum: 243e6fd6ea9f3094eea32c55febade6d8aaa1b563db655b0c5327940e4719beb
  - module: github.com/jcmturner/gokrb5/v8
    version: v8.4.2
    explicit: True
    sha256sum: eecd7120363321bb6b58b015395089958720271b3211659d802447d417af5970
  - module: github.com/jcmturner/rpc/v2
    version: v2.0.3
    explicit: True
    sha256sum: 90c595355e5e2c9dc1e1ae71a88491a04c34d8791180098da103217cbf5f5574
  - module: github.com/jmhodges/clock
    version: v1.2.0
    explicit: True
    sha256sum: 25016f104de4e3312bb02b3cdfe7438b4acc2cc2f2c9be7614263fdd1c0829a4
  - module: github.com/klauspost/compress
    version: v1.19.1
    explicit: True
    sha256sum: a77e019f60dff8bdf00ad137985c808957cc657381daa4281824843bc6b46910
  - module: github.com/leonelquinteros/gotext
    version: v1.7.2
    explicit: True
    sha256sum: 4c01b94fd68ece10bea56ce49f37de834907ebff69a84b21e4b487511488859f
  - module: github.com/mattn/go-isatty
    version: v0.0.24
    explicit: True
    sha256sum: 4fcffec0bae0ad4af7bf96e2497a817d85de64af19ffe31d82bda362148234b8
  - module: github.com/olekukonko/ts
    version: v0.0.0-20171002115256-78ecb04241c0
    explicit: True
    sha256sum: b04eba3c4d1780c5c48d4ad47a6d5db2db5ee6f963e5a26f8d18dbbe70e74262
  - module: github.com/pkg/errors
    version: v0.9.1
    explicit: True
    sha256sum: d4c36b8bcd0616290a3913215e0f53b931bd6e00670596f2960df1b44af2bd07
  - module: github.com/pmezard/go-difflib
    version: v1.0.0
    explicit: True
    sha256sum: de04cecc1a4b8d53e4357051026794bcbc54f2e6a260cfac508ce69d5d6457a0
  - module: github.com/rubyist/tracerx
    version: v0.0.0-20170927163412-787959303086
    explicit: True
    sha256sum: ae49dd3f83e23528b599314dabfcc1464bce7259191f1021f35ba83942802267
  - module: github.com/spf13/cobra
    version: v1.10.2
    explicit: True
    sha256sum: a00aae6fcd631e0fde52c98604452ff70e1b73c3b8a560d68db15aff5e26872d
  - module: github.com/spf13/pflag
    version: v1.0.9
    explicit: True
    sha256sum: 83910188d8735f84a48a80ab78351edac0b569896f2b3a244c696a07da9aa5ed
  - module: github.com/ssgelm/cookiejarparser
    version: v1.0.1
    explicit: True
    sha256sum: 8db951b924aa3989664fd04b8627bfa5898fca9343c13b8cc3209aea4448a1de
  - module: github.com/stretchr/testify
    version: v1.11.1
    explicit: True
    sha256sum: b7325b561ead5304b72b9f32aebc871ff49b3823667d530a49fd6c8f3adfc96e
  - module: github.com/xeipuuv/gojsonpointer
    version: v0.0.0-20180127040702-4e3ac2762d5f
    explicit: True
    sha256sum: 5b1a4bcc8e003f214c92b3fa52959d9eb0e3af1c0c529efa55815db951146e48
  - module: github.com/xeipuuv/gojsonreference
    version: v0.0.0-20180127040603-bd5ef7bd5415
    explicit: True
    sha256sum: 7ec98f4df894413f4dc58c8df330ca8b24ff425b05a8e1074c3028c99f7e45e7
  - module: github.com/xeipuuv/gojsonschema
    version: v1.2.0
    explicit: True
    sha256sum: 55c8ce068257aa0d263aad7470113dafcd50f955ee754fc853c2fdcd31ad096f
  - module: golang.org/x/crypto
    version: v0.54.0
    explicit: True
    sha256sum: ecf4030c1c6b55b897826b95f01d7416cf2785b4675b0f9ac218ddf754a03abb
  - module: golang.org/x/net
    version: v0.57.0
    explicit: True
    sha256sum: f8d652c629374b43846ef4f2efd419e8d1c81779eb728306d09f0de1cc1bab80
  - module: golang.org/x/sync
    version: v0.22.0
    explicit: True
    sha256sum: 4bc67d258ce7867cfc1a43765c43d98b4c49b90c46dd0b86f896a5a4909fade0
  - module: golang.org/x/sys
    version: v0.47.0
    explicit: True
    sha256sum: cdac013ddced0262926ec29ffcda645da39670e61c7e5b761e572b6b1809bb1b
  - module: golang.org/x/text
    version: v0.40.0
    explicit: True
    sha256sum: 07757384728d0f52dd85c1f3f163405e6396b2b0fb7eb7d6b610f2a711d69ee3
  - module: gopkg.in/check.v1
    version: v0.0.0-20161208181325-20d25e280405
    explicit: False
    sha256sum: 4e1817f964ca34e545b81afda0325a5e89cf58de2e413d8207c0afddd0fdc15c
  - module: gopkg.in/yaml.v3
    version: v3.0.1
    explicit: True
    sha256sum: aab8fbc4e6300ea08e6afe1caea18a21c90c79f489f52c53e2f20431f1a9a015
