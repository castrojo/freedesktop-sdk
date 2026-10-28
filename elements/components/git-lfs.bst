# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: manual

build-depends:
- public-stacks/buildsystem-go.bst
- components/hermes.bst

depends:
- components/git.bst

variables:
  optimize-debug: "false"

config:
  configure-commands:
  - hermes shell
  - hermes serve --daemonize

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
  ref: v3.8.1-0-ga662a6dbfedf706cfa9fc7a5b7bcc7ba2e2c8a65
- kind: hermes
  ref:
  - kind: GoModule
    url: https://proxy.golang.org/github.com/alexbrainman/sspi/@v/v0.0.0-20210105120005-909beea2cc74.mod
    digest:
      kind: Sha256Sum
      value: 6ee7f15f38600c5014d87009e220752dd8497fa43fd20c5501470ac4ab1b08d2
  - kind: GoPackage
    url: https://proxy.golang.org/github.com/alexbrainman/sspi/@v/v0.0.0-20210105120005-909beea2cc74.zip
    digest:
      kind: Sha256Sum
      value: f094ecfc4554a9ca70f0ade41747123f3161a15fb1a6112305b99731befc8648
  - kind: GoModule
    url: https://proxy.golang.org/github.com/avast/retry-go/@v/v3.0.0+incompatible.mod
    digest:
      kind: Sha256Sum
      value: ef86f9f88b100febbbe877bd272cfd88073639f00ed0ca595afde6a34cb63139
  - kind: GoPackage
    url: https://proxy.golang.org/github.com/avast/retry-go/@v/v3.0.0+incompatible.zip
    digest:
      kind: Sha256Sum
      value: fef922805a0c119535b556fcb210e89509e184645b64c5dd516aefeac6a4a944
  - kind: GoModule
    url: https://proxy.golang.org/github.com/davecgh/go-spew/@v/v1.1.1.mod
    digest:
      kind: Sha256Sum
      value: bcb29393251237b79a17b6c19bf29134f43e8f438c3198988fcd461a1cdf05cc
  - kind: GoPackage
    url: https://proxy.golang.org/github.com/davecgh/go-spew/@v/v1.1.1.zip
    digest:
      kind: Sha256Sum
      value: 6b44a843951f371b7010c754ecc3cabefe815d5ced1c5b9409fb2d697e8a890d
  - kind: GoModule
    url: https://proxy.golang.org/github.com/dpotapov/go-spnego/@v/v0.0.0-20210315154721-298b63a54430.mod
    digest:
      kind: Sha256Sum
      value: 93c8fba0b05fe319742275cdae3a49791558a88daa37cf5a087d29c248e5f104
  - kind: GoPackage
    url: https://proxy.golang.org/github.com/dpotapov/go-spnego/@v/v0.0.0-20210315154721-298b63a54430.zip
    digest:
      kind: Sha256Sum
      value: c0cd9b070a6dbeeeb64ea699cb799344f8bdd4db27f7e8d56547d566fa31d2b9
  - kind: GoModule
    url: https://proxy.golang.org/github.com/git-lfs/gitobj/v2/@v/v2.1.1.mod
    digest:
      kind: Sha256Sum
      value: efe2df6ddf2561dc9d9ab66cb2bf3df388fee50d0d70091fc0772ca46bd0b9fc
  - kind: GoPackage
    url: https://proxy.golang.org/github.com/git-lfs/gitobj/v2/@v/v2.1.1.zip
    digest:
      kind: Sha256Sum
      value: a3db7e0333198a034ec254d3bf39cc616f7788f9151e5c8388059cf36ea1c315
  - kind: GoModule
    url: https://proxy.golang.org/github.com/git-lfs/go-netrc/@v/v0.0.0-20250218165306-ba0029b43d11.mod
    digest:
      kind: Sha256Sum
      value: 553b892526d6e08227a5fe713e211dcc21d2b50f8019a7ae3d8f2bf87d5608e6
  - kind: GoPackage
    url: https://proxy.golang.org/github.com/git-lfs/go-netrc/@v/v0.0.0-20250218165306-ba0029b43d11.zip
    digest:
      kind: Sha256Sum
      value: 88471d8a25b6dc8632d4610a14b7ba4708b61e375e5d38c93fd54c95aed70311
  - kind: GoModule
    url: https://proxy.golang.org/github.com/git-lfs/pktline/@v/v0.0.0-20210330133718-06e9096e2825.mod
    digest:
      kind: Sha256Sum
      value: 0c3746951c7d569d6f1b39b3505c405d456412154fba2af8d8986302ff21ad7f
  - kind: GoPackage
    url: https://proxy.golang.org/github.com/git-lfs/pktline/@v/v0.0.0-20210330133718-06e9096e2825.zip
    digest:
      kind: Sha256Sum
      value: b3fe495df730f006a8a5dc58c5d1a1d42bc07354f49f11fcb314a9225a3eb92f
  - kind: GoModule
    url: https://proxy.golang.org/github.com/git-lfs/wildmatch/v2/@v/v2.0.1.mod
    digest:
      kind: Sha256Sum
      value: 65a599702b1a12a238e0090bad5bca76f5d772e86e21293f89a4745a32d05683
  - kind: GoPackage
    url: https://proxy.golang.org/github.com/git-lfs/wildmatch/v2/@v/v2.0.1.zip
    digest:
      kind: Sha256Sum
      value: e9a32b3adb9e204768163644a5c8882e7ab934078c5be8014ca637cc2d731a64
  - kind: GoModule
    url: https://proxy.golang.org/github.com/golang/groupcache/@v/v0.0.0-20241129210726-2c02b8208cf8.mod
    digest:
      kind: Sha256Sum
      value: 4e019acbe58a7af43d2316b6f825797636072cb48c31ea6ff7aae7d75ad51a89
  - kind: GoPackage
    url: https://proxy.golang.org/github.com/golang/groupcache/@v/v0.0.0-20241129210726-2c02b8208cf8.zip
    digest:
      kind: Sha256Sum
      value: 163367355442a630b12b0b452892cd98e99fcfdf7e40b68d358be73479cc1c23
  - kind: GoModule
    url: https://proxy.golang.org/github.com/google/shlex/@v/v0.0.0-20191202100458-e7afc7fbc510.mod
    digest:
      kind: Sha256Sum
      value: 84c69808d21bc6848e1ad78d6b64965433b5baaba665548338b7daa39faa70be
  - kind: GoPackage
    url: https://proxy.golang.org/github.com/google/shlex/@v/v0.0.0-20191202100458-e7afc7fbc510.zip
    digest:
      kind: Sha256Sum
      value: 1bf70bdb4c889b47b1976370832da79060c36cad282f278f279603200623775c
  - kind: GoModule
    url: https://proxy.golang.org/github.com/hashicorp/go-uuid/@v/v1.0.2.mod
    digest:
      kind: Sha256Sum
      value: 1c4a96ad155de1eab04062a5be4010bb9aaa371252aed524217c2e69c14adecf
  - kind: GoPackage
    url: https://proxy.golang.org/github.com/hashicorp/go-uuid/@v/v1.0.2.zip
    digest:
      kind: Sha256Sum
      value: 30e419ebb4658e789be8ef1f5629faccc15d6571c6914a51afdcbaf74a5862b8
  - kind: GoModule
    url: https://proxy.golang.org/github.com/inconshreveable/mousetrap/@v/v1.1.0.mod
    digest:
      kind: Sha256Sum
      value: 1c1b15911aa8a0bd5cd0f6670ec23d1086496f3615fdf53306aff2b476ce9be1
  - kind: GoPackage
    url: https://proxy.golang.org/github.com/inconshreveable/mousetrap/@v/v1.1.0.zip
    digest:
      kind: Sha256Sum
      value: 526674de624d7db108cfe7653ef110ccdfd97bc85026254224815567928ed243
  - kind: GoModule
    url: https://proxy.golang.org/github.com/jcmturner/aescts/v2/@v/v2.0.0.mod
    digest:
      kind: Sha256Sum
      value: 8ff1ffa1a39fb2f0c055334d7e03efff5cc77caff61126872f1c7afe8b8cd036
  - kind: GoPackage
    url: https://proxy.golang.org/github.com/jcmturner/aescts/v2/@v/v2.0.0.zip
    digest:
      kind: Sha256Sum
      value: 717a211ad4aac248cf33cadde73059c13f8e9462123a0ab2fed5c5e61f7739d7
  - kind: GoModule
    url: https://proxy.golang.org/github.com/jcmturner/dnsutils/v2/@v/v2.0.0.mod
    digest:
      kind: Sha256Sum
      value: d5f377f2851165f37c99b4f592f7daa1300b3a7b1d3b4dfe57bcf2f39bb1e737
  - kind: GoPackage
    url: https://proxy.golang.org/github.com/jcmturner/dnsutils/v2/@v/v2.0.0.zip
    digest:
      kind: Sha256Sum
      value: f9188186b672e547cfaef66107aa62d65054c5d4f10d4dcd1ff157d6bf8c275d
  - kind: GoModule
    url: https://proxy.golang.org/github.com/jcmturner/gofork/@v/v1.0.0.mod
    digest:
      kind: Sha256Sum
      value: cc630d2f100a681d03e24122e0603134e84e651a6319e9e0ed784d88a5b9015c
  - kind: GoPackage
    url: https://proxy.golang.org/github.com/jcmturner/gofork/@v/v1.0.0.zip
    digest:
      kind: Sha256Sum
      value: 5e015dd9b038f1dded0b2ded77e529d2f6ba0bed228a98831af5a3610eefcb52
  - kind: GoModule
    url: https://proxy.golang.org/github.com/jcmturner/goidentity/v6/@v/v6.0.1.mod
    digest:
      kind: Sha256Sum
      value: 8d1eaf4e8431a92c2a1b6b721bf315c0cd418de568fe4c08a3b5eda19784d8a0
  - kind: GoPackage
    url: https://proxy.golang.org/github.com/jcmturner/goidentity/v6/@v/v6.0.1.zip
    digest:
      kind: Sha256Sum
      value: 243e6fd6ea9f3094eea32c55febade6d8aaa1b563db655b0c5327940e4719beb
  - kind: GoModule
    url: https://proxy.golang.org/github.com/jcmturner/gokrb5/v8/@v/v8.4.2.mod
    digest:
      kind: Sha256Sum
      value: e36f65a3f4b4ab0f99b3ae594f39f6c7b2627f322c24c64d6bb109f13406cd51
  - kind: GoPackage
    url: https://proxy.golang.org/github.com/jcmturner/gokrb5/v8/@v/v8.4.2.zip
    digest:
      kind: Sha256Sum
      value: eecd7120363321bb6b58b015395089958720271b3211659d802447d417af5970
  - kind: GoModule
    url: https://proxy.golang.org/github.com/jcmturner/rpc/v2/@v/v2.0.3.mod
    digest:
      kind: Sha256Sum
      value: d452409b03caa7add0d5180d925564d8473fc4cdcb1de20ef486e2c82a1ed175
  - kind: GoPackage
    url: https://proxy.golang.org/github.com/jcmturner/rpc/v2/@v/v2.0.3.zip
    digest:
      kind: Sha256Sum
      value: 90c595355e5e2c9dc1e1ae71a88491a04c34d8791180098da103217cbf5f5574
  - kind: GoModule
    url: https://proxy.golang.org/github.com/jmhodges/clock/@v/v1.2.0.mod
    digest:
      kind: Sha256Sum
      value: e49253f8c45e34360f4441a5098e9244a4f8d3df1fad5964be690c1cf57ba94b
  - kind: GoPackage
    url: https://proxy.golang.org/github.com/jmhodges/clock/@v/v1.2.0.zip
    digest:
      kind: Sha256Sum
      value: 25016f104de4e3312bb02b3cdfe7438b4acc2cc2f2c9be7614263fdd1c0829a4
  - kind: GoModule
    url: https://proxy.golang.org/github.com/klauspost/compress/@v/v1.19.1.mod
    digest:
      kind: Sha256Sum
      value: 0d66d6069d9e2fb875c5b464d15b2c80232cfc8991e6f88336ce461ca810e0cf
  - kind: GoPackage
    url: https://proxy.golang.org/github.com/klauspost/compress/@v/v1.19.1.zip
    digest:
      kind: Sha256Sum
      value: a77e019f60dff8bdf00ad137985c808957cc657381daa4281824843bc6b46910
  - kind: GoModule
    url: https://proxy.golang.org/github.com/leonelquinteros/gotext/@v/v1.7.2.mod
    digest:
      kind: Sha256Sum
      value: 545ea7a44f1b9165058278918dcd540e58964422a9e1d4ee94e97cd3447e49a0
  - kind: GoPackage
    url: https://proxy.golang.org/github.com/leonelquinteros/gotext/@v/v1.7.2.zip
    digest:
      kind: Sha256Sum
      value: 4c01b94fd68ece10bea56ce49f37de834907ebff69a84b21e4b487511488859f
  - kind: GoModule
    url: https://proxy.golang.org/github.com/mattn/go-isatty/@v/v0.0.24.mod
    digest:
      kind: Sha256Sum
      value: 41b885f68c2fa4dfb26a8ffa30d095a931b27699b6b2b1974af3949400dc060f
  - kind: GoPackage
    url: https://proxy.golang.org/github.com/mattn/go-isatty/@v/v0.0.24.zip
    digest:
      kind: Sha256Sum
      value: 4fcffec0bae0ad4af7bf96e2497a817d85de64af19ffe31d82bda362148234b8
  - kind: GoModule
    url: https://proxy.golang.org/github.com/olekukonko/ts/@v/v0.0.0-20171002115256-78ecb04241c0.mod
    digest:
      kind: Sha256Sum
      value: 96277e14c15135bf8308351ed0f9acbe137d6de54d8c95080ae93f71adf5a8b5
  - kind: GoPackage
    url: https://proxy.golang.org/github.com/olekukonko/ts/@v/v0.0.0-20171002115256-78ecb04241c0.zip
    digest:
      kind: Sha256Sum
      value: b04eba3c4d1780c5c48d4ad47a6d5db2db5ee6f963e5a26f8d18dbbe70e74262
  - kind: GoModule
    url: https://proxy.golang.org/github.com/pkg/errors/@v/v0.9.1.mod
    digest:
      kind: Sha256Sum
      value: df28c6a823f181d76179697177c0c5943c6ffb38f3c10b2dc53be360ee7d4589
  - kind: GoPackage
    url: https://proxy.golang.org/github.com/pkg/errors/@v/v0.9.1.zip
    digest:
      kind: Sha256Sum
      value: d4c36b8bcd0616290a3913215e0f53b931bd6e00670596f2960df1b44af2bd07
  - kind: GoModule
    url: https://proxy.golang.org/github.com/pmezard/go-difflib/@v/v1.0.0.mod
    digest:
      kind: Sha256Sum
      value: 74b2e766eb215377864d587badf57e95521f692d2a7860b3c7759093f9c9bec2
  - kind: GoPackage
    url: https://proxy.golang.org/github.com/pmezard/go-difflib/@v/v1.0.0.zip
    digest:
      kind: Sha256Sum
      value: de04cecc1a4b8d53e4357051026794bcbc54f2e6a260cfac508ce69d5d6457a0
  - kind: GoModule
    url: https://proxy.golang.org/github.com/rubyist/tracerx/@v/v0.0.0-20170927163412-787959303086.mod
    digest:
      kind: Sha256Sum
      value: d77cb66dc1faa6617dcac0fc2d03a61078ee8937ae58ae03337208695d0ef295
  - kind: GoPackage
    url: https://proxy.golang.org/github.com/rubyist/tracerx/@v/v0.0.0-20170927163412-787959303086.zip
    digest:
      kind: Sha256Sum
      value: ae49dd3f83e23528b599314dabfcc1464bce7259191f1021f35ba83942802267
  - kind: GoModule
    url: https://proxy.golang.org/github.com/spf13/cobra/@v/v1.10.2.mod
    digest:
      kind: Sha256Sum
      value: cc6098fd1118fb3bb349c72bcd6e9c665d3a1b2a516ea9807ee24521ad2ddf8c
  - kind: GoPackage
    url: https://proxy.golang.org/github.com/spf13/cobra/@v/v1.10.2.zip
    digest:
      kind: Sha256Sum
      value: a00aae6fcd631e0fde52c98604452ff70e1b73c3b8a560d68db15aff5e26872d
  - kind: GoModule
    url: https://proxy.golang.org/github.com/spf13/pflag/@v/v1.0.9.mod
    digest:
      kind: Sha256Sum
      value: 16c6dfc0eb58eb3c9113ce197d460c6725c647e4688ac26d31c8ed69f1ebbc68
  - kind: GoPackage
    url: https://proxy.golang.org/github.com/spf13/pflag/@v/v1.0.9.zip
    digest:
      kind: Sha256Sum
      value: 83910188d8735f84a48a80ab78351edac0b569896f2b3a244c696a07da9aa5ed
  - kind: GoModule
    url: https://proxy.golang.org/github.com/ssgelm/cookiejarparser/@v/v1.0.1.mod
    digest:
      kind: Sha256Sum
      value: 52fdf96349bf900a90f51ee404da332cc20244e2ec21ea6290df89b084d793b7
  - kind: GoPackage
    url: https://proxy.golang.org/github.com/ssgelm/cookiejarparser/@v/v1.0.1.zip
    digest:
      kind: Sha256Sum
      value: 8db951b924aa3989664fd04b8627bfa5898fca9343c13b8cc3209aea4448a1de
  - kind: GoModule
    url: https://proxy.golang.org/github.com/stretchr/testify/@v/v1.11.1.mod
    digest:
      kind: Sha256Sum
      value: 5846af204043f29df285026109bf32db6519c3d7e1d5c3a65fefb174f9d81d33
  - kind: GoPackage
    url: https://proxy.golang.org/github.com/stretchr/testify/@v/v1.11.1.zip
    digest:
      kind: Sha256Sum
      value: b7325b561ead5304b72b9f32aebc871ff49b3823667d530a49fd6c8f3adfc96e
  - kind: GoModule
    url: https://proxy.golang.org/github.com/xeipuuv/gojsonpointer/@v/v0.0.0-20180127040702-4e3ac2762d5f.mod
    digest:
      kind: Sha256Sum
      value: a97ded77d2029dcadd1f696ba09a2eda15f129a1bea5194274bcb61aee75b5d9
  - kind: GoPackage
    url: https://proxy.golang.org/github.com/xeipuuv/gojsonpointer/@v/v0.0.0-20180127040702-4e3ac2762d5f.zip
    digest:
      kind: Sha256Sum
      value: 5b1a4bcc8e003f214c92b3fa52959d9eb0e3af1c0c529efa55815db951146e48
  - kind: GoModule
    url: https://proxy.golang.org/github.com/xeipuuv/gojsonreference/@v/v0.0.0-20180127040603-bd5ef7bd5415.mod
    digest:
      kind: Sha256Sum
      value: 2970656211ecb91988833502dbe64c5f375f31b2f8bb6daa6fc71ee5c0855044
  - kind: GoPackage
    url: https://proxy.golang.org/github.com/xeipuuv/gojsonreference/@v/v0.0.0-20180127040603-bd5ef7bd5415.zip
    digest:
      kind: Sha256Sum
      value: 7ec98f4df894413f4dc58c8df330ca8b24ff425b05a8e1074c3028c99f7e45e7
  - kind: GoModule
    url: https://proxy.golang.org/github.com/xeipuuv/gojsonschema/@v/v1.2.0.mod
    digest:
      kind: Sha256Sum
      value: b41c940caaab3bb3c1af6d275ccb4716989084a1f3c5c5fe4757f8651de5afc2
  - kind: GoPackage
    url: https://proxy.golang.org/github.com/xeipuuv/gojsonschema/@v/v1.2.0.zip
    digest:
      kind: Sha256Sum
      value: 55c8ce068257aa0d263aad7470113dafcd50f955ee754fc853c2fdcd31ad096f
  - kind: GoModule
    url: https://proxy.golang.org/golang.org/x/crypto/@v/v0.54.0.mod
    digest:
      kind: Sha256Sum
      value: d852b93b93f9cd911708ffd45409439956d4e9c8497c5b87f348fc83d0adc577
  - kind: GoPackage
    url: https://proxy.golang.org/golang.org/x/crypto/@v/v0.54.0.zip
    digest:
      kind: Sha256Sum
      value: ecf4030c1c6b55b897826b95f01d7416cf2785b4675b0f9ac218ddf754a03abb
  - kind: GoModule
    url: https://proxy.golang.org/golang.org/x/net/@v/v0.57.0.mod
    digest:
      kind: Sha256Sum
      value: bfc4c34b9fa5d70e4837542577560e92f743e24f584a39877850650c19a444a1
  - kind: GoPackage
    url: https://proxy.golang.org/golang.org/x/net/@v/v0.57.0.zip
    digest:
      kind: Sha256Sum
      value: f8d652c629374b43846ef4f2efd419e8d1c81779eb728306d09f0de1cc1bab80
  - kind: GoModule
    url: https://proxy.golang.org/golang.org/x/sync/@v/v0.22.0.mod
    digest:
      kind: Sha256Sum
      value: a3e29e76060bd561060454b1fa2bdcd66674f60c9ca93833b8106355e34c603c
  - kind: GoPackage
    url: https://proxy.golang.org/golang.org/x/sync/@v/v0.22.0.zip
    digest:
      kind: Sha256Sum
      value: 4bc67d258ce7867cfc1a43765c43d98b4c49b90c46dd0b86f896a5a4909fade0
  - kind: GoModule
    url: https://proxy.golang.org/golang.org/x/sys/@v/v0.47.0.mod
    digest:
      kind: Sha256Sum
      value: 57f4393ea18d5446a12363b35c23a616d843fa1669c7121a70a2bc3a9677d665
  - kind: GoPackage
    url: https://proxy.golang.org/golang.org/x/sys/@v/v0.47.0.zip
    digest:
      kind: Sha256Sum
      value: cdac013ddced0262926ec29ffcda645da39670e61c7e5b761e572b6b1809bb1b
  - kind: GoModule
    url: https://proxy.golang.org/golang.org/x/text/@v/v0.40.0.mod
    digest:
      kind: Sha256Sum
      value: e69fb09b14637cab6245a1253c22d80121b79d9fe3ddd19b558629e15baadaf3
  - kind: GoPackage
    url: https://proxy.golang.org/golang.org/x/text/@v/v0.40.0.zip
    digest:
      kind: Sha256Sum
      value: 07757384728d0f52dd85c1f3f163405e6396b2b0fb7eb7d6b610f2a711d69ee3
  - kind: GoModule
    url: https://proxy.golang.org/gopkg.in/yaml.v3/@v/v3.0.1.mod
    digest:
      kind: Sha256Sum
      value: 21579860a20306fcf43b1bd234d1fba319499c77611b71c05f9bf3ba90dab939
  - kind: GoPackage
    url: https://proxy.golang.org/gopkg.in/yaml.v3/@v/v3.0.1.zip
    digest:
      kind: Sha256Sum
      value: aab8fbc4e6300ea08e6afe1caea18a21c90c79f489f52c53e2f20431f1a9a015
