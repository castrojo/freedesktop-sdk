kind: manual

build-depends:
  - components/go.bst

config:
  build-commands:
    - go build ./cmd/cosign

    - |
      %{install-extra}

sources:
  - kind: git_repo
    url: github:sigstore/cosign.git
    track: main
    ref: v3.1.2-4-g02389754144be1becf4e164a2d381e6dcacb18d1
  - kind: go_module
    url: github:ThalesIgnite/crypto11
    module: github.com/ThalesIgnite/crypto11
    ref:
      go-version: v1.2.5
      git-ref: v1.2.5-0-ga81014c7c41025fb5533c0c6b1b14bec016be695
      explicit: True
      # - kind: go_module
      #   module: cloud.google.com/go/compute/metadata
      #   url: git_https:cloud.google.com/go/compute/metadata
      # - kind: go_module
      #   module: cuelang.org/go
      #   url: git_https:https://pkg.go.dev/cuelang.org/go
  - kind: go_module
    module: github.com/awslabs/amazon-ecr-credential-helper/ecr-login
    url: github:awslabs/amazon-ecr-credential-helper
    ref:
      go-version: v0.12.0
      git-ref: ecr-login/v0.12.0-0-g7ff7d6bd7a06408ddb9646c9ebccf97dbd190d55
      explicit: True
      subdirectory: ecr-login
  - kind: go_module
    module: github.com/buildkite/agent/v3
    url: github:buildkite/agent
    ref:
      go-version: v3.130.0
      git-ref: v3.130.0-0-g65943b82b9d501e006b86ae99c3ae70490ccd844
      explicit: True
  - kind: go_module
    module: github.com/chrismellard/docker-credential-acr-env
    url: github:chrismellard/docker-credential-acr-env
    ref:
      go-version: v0.0.0-20230304212654-82a0ddb27589
      git-ref: 82a0ddb2758901b711d9d1614755b77e401598a1
      explicit: True
  - kind: go_module
    module: github.com/cyberphone/json-canonicalization
    url: github:cyberphone/json-canonicalization
    ref:
      go-version: v0.0.0-20241213102144-19d51d7fe467
      git-ref: 19d51d7fe467d4706a3ff08adf8a748f29fc21e0
      explicit: True
  - kind: go_module
    module: github.com/depcheck-test/depcheck-test
    url: github:depcheck-test/depcheck-test

    ref:
      go-version: v0.0.0-20220607135614-199033aaa936
      git-ref: 199033aaa936e0f816b7f88985a33587ebf13bdf
      explicit: True
  - kind: go_module
    module: github.com/digitorus/timestamp
    url: github:digitorus/timestamp
    ref:
      go-version: v0.0.0-20231217203849-220c5c2851b7
      git-ref: 220c5c2851b7435eea999de3daa773601a7ca126
      explicit: True
  - kind: go_module
    module: github.com/dustin/go-humanize
    url: github:dustin/go-humanize
    ref:
      go-version: v1.0.1
      git-ref: v1.0.1-0-g9ec74ab2f7a7161664182fd4e5e292fccffbc75f
      explicit: True
  - kind: go_module
    module: github.com/go-jose/go-jose/v4
    url: github:go-jose/go-jose
    ref:
      go-version: v4.1.4
      git-ref: v4.1.4-0-g0e59876635f3dbf46d7b5e97b52bb75a3f96e7d9
      explicit: True
  - kind: go_module
    module: github.com/go-openapi/runtime
    url: github:go-openapi/runtime
    ref:
      go-version: v0.32.4
      git-ref: v0.32.4-0-g908a0ff5afec66c0dedf8cdc8371c953924a3ec1
      explicit: True
  - kind: go_module
    module: github.com/go-openapi/strfmt
    url: github:go-openapi/strfmt
    ref:
      go-version: v0.26.4
      git-ref: v0.26.4-0-g09a3881eea5abd3a5b53284feafc018ddfde407e
      explicit: True
  - kind: go_module
    module: github.com/go-openapi/swag/conv
    url: github:go-openapi/swag
    ref:
      go-version: v0.27.0
      git-ref: conv/v0.27.0-0-g4f9e7187ef25684f32276959ae5341fc0455be8d
      explicit: True
      subdirectory: conv
  - kind: go_module
    module: github.com/go-piv/piv-go/v2
    url: github:go-piv/piv-go
    ref:
      go-version: v2.6.0
      git-ref: v2.6.0-0-g31dc15be0b15590817f12ce9cc9966ee9e6f43f9
      explicit: True
  - kind: go_module
    module: github.com/google/certificate-transparency-go
    url: github:google/certificate-transparency-go
    ref:
      go-version: v1.3.3
      git-ref: v1.3.3-0-ge8f93173135c7817ebd7133dab729c4576ce9a21
      explicit: True
  - kind: go_module
    module: github.com/google/go-cmp
    url: github:google/go-cmp
    ref:
      go-version: v0.7.0
      git-ref: v0.7.0-0-g9b12f366a942ebc7254abc7f32ca05068b455fb7
      explicit: True
  - kind: go_module
    module: github.com/google/go-containerregistry
    url: github:google/go-containerregistry
    ref:
      go-version: v0.21.7
      git-ref: v0.21.7-0-gc68d899782693b63b7549166812aa996f17a660c
      explicit: True
  - kind: go_module
    module: github.com/google/go-github/v88
    url: github:google/go-github
    ref:
      go-version: v88.0.0
      git-ref: v88.0.0-0-g0766356912a34cc51a71f81b108c9e53bd9404d4
      explicit: True
  - kind: go_module
    module: github.com/in-toto/attestation
    url: github:in-toto/attestation
    ref:
      go-version: v1.2.0
      git-ref: v1.2.0-0-gdf02077bf97218a8860a5c534eff1f1381f56984
      explicit: True
  - kind: go_module
    module: github.com/in-toto/in-toto-golang
    url: github:in-toto/in-toto-golang
    ref:
      go-version: v0.11.0
      git-ref: v0.11.0-0-g36d782ffb2ca3adbffcdce1fd971c23319dd4469
      explicit: True
  - kind: go_module
    module: github.com/kelseyhightower/envconfig
    url: github:kelseyhightower/envconfig
    ref:
      go-version: v1.4.0
      git-ref: v1.4.0-0-g0b417c4ec4a8a82eecc22a1459a504aa55163d61
      explicit: True
  - kind: go_module
    module: github.com/manifoldco/promptui
    url: github:manifoldco/promptui
    ref:
      go-version: v0.9.0
      git-ref: v0.9.0-0-gc2e487d3597f59bcf76b24c9e80679740a72212b
      explicit: True
  - kind: go_module
    module: github.com/miekg/pkcs11
    url: github:miekg/pkcs11
    ref:
      go-version: v1.1.2
      git-ref: v1.1.2-0-gb7c7893ab1a71197aabf7c9c9ff069644f1714c3
      explicit: True
  - kind: go_module
    module: github.com/mitchellh/go-wordwrap
    url: github:mitchellh/go-wordwrap
    ref:
      go-version: v1.0.1
      git-ref: v1.0.1-0-gecf0936a077a4bd73a1cc2ac5c370f2b55618d62
      explicit: True
  - kind: go_module
    module: github.com/moby/term
    url: github:moby/term
    ref:
      go-version: v0.5.2
      git-ref: v0.5.2-0-g6c1b69fecbac2753dcaf18718a7e9f9093c3760d
      explicit: True
  - kind: go_module
    module: github.com/mozillazg/docker-credential-acr-helper
    url: github:mozillazg/docker-credential-acr-helper
    ref:
      go-version: v0.4.0
      git-ref: v0.4.0-0-gb0f30d608689e111c37051fdfa43428d529f227c
      explicit: True
  - kind: go_module
    module: github.com/nozzle/throttler
    url: github:nozzle/throttler
    ref:
      go-version: v0.0.0-20180817012639-2ea982251481
      git-ref: 2ea982251481626167b7f83be1434b5c42540c1a
      explicit: True
  - kind: go_module
    module: github.com/open-policy-agent/opa
    url: github:open-policy-agent/opa
    ref:
      go-version: v1.17.1
      git-ref: v1.17.1-0-g187c696210c1d03a502f91c0c7217dfa1dee3eed
      explicit: True
  - kind: go_module
    module: github.com/secure-systems-lab/go-securesystemslib
    url: github:secure-systems-lab/go-securesystemslib
    ref:
      go-version: v0.11.0
      git-ref: v0.11.0-0-g1ce0aca0c8640e2b119fb8de53fb193759085c6a
      explicit: True
  - kind: go_module
    module: github.com/sigstore/protobuf-specs
    url: github:sigstore/protobuf-specs
    ref:
      go-version: v0.5.1
      git-ref: v0.5.1-0-g3001afe9102b15b04ca1b91efccd613976bdf514
      explicit: True
  - kind: go_module
    module: github.com/sigstore/rekor
    url: github:sigstore/rekor
    ref:
      go-version: v1.5.3
      git-ref: v1.5.3-0-g7d9dcffcc27c4912e7d17fc768db01aa2d5cf26c
      explicit: True
  - kind: go_module
    module: github.com/sigstore/rekor-tiles/v2
    url: github:sigstore/rekor-tiles
    ref:
      go-version: v2.3.0
      git-ref: v2.3.0-0-gfa390b1c17f9685f7a164da2c06e82dc295cfdca
      explicit: True
  - kind: go_module
    module: github.com/sigstore/sigstore
    url: github:sigstore/sigstore
    ref:
      go-version: v1.10.8
      git-ref: v1.10.8-0-gc761681120b37d9c4b1410cf5720571582ab090a
      explicit: True
  - kind: go_module
    module: github.com/sigstore/sigstore-go
    url: github:sigstore/sigstore-go
    ref:
      go-version: v1.2.2
      git-ref: v1.2.2-0-g55aa6240784677449a564e66a0fca7a6a3605ecd
      explicit: True
  - kind: go_module
    module: github.com/sigstore/sigstore/pkg/signature/kms/aws
    url: github:sigstore/sigstore
    ref:
      go-version: v1.10.8
      git-ref: pkg/signature/kms/aws/v1.10.8-0-gc761681120b37d9c4b1410cf5720571582ab090a
      explicit: True
      subdirectory: pkg/signature/kms/aws
  - kind: go_module
    module: github.com/sigstore/sigstore/pkg/signature/kms/azure
    url: github:sigstore/sigstore
    ref:
      go-version: v1.10.8
      git-ref: pkg/signature/kms/azure/v1.10.8-0-gc761681120b37d9c4b1410cf5720571582ab090a
      explicit: True
      subdirectory: pkg/signature/kms/azure
  - kind: go_module
    module: github.com/sigstore/sigstore/pkg/signature/kms/gcp
    url: github:sigstore/sigstore
    ref:
      go-version: v1.10.8
      git-ref: pkg/signature/kms/gcp/v1.10.8-0-gc761681120b37d9c4b1410cf5720571582ab090a
      explicit: True
      subdirectory: pkg/signature/kms/gcp
  - kind: go_module
    module: github.com/sigstore/sigstore/pkg/signature/kms/hashivault
    url: github:sigstore/sigstore
    ref:
      go-version: v1.10.8
      git-ref: pkg/signature/kms/hashivault/v1.10.8-0-gc761681120b37d9c4b1410cf5720571582ab090a
      explicit: True
      subdirectory: pkg/signature/kms/hashivault
  - kind: go_module
    module: github.com/sigstore/timestamp-authority/v2
    url: github:sigstore/timestamp-authority
    ref:
      go-version: v2.1.2
      git-ref: v2.1.2-0-g21dff8b84c13344aa4a931d9779c514e4b7f8538
      explicit: True
  - kind: go_module
    module: github.com/spf13/cobra
    url: github:spf13/cobra
    ref:
      go-version: v1.10.2
      git-ref: v1.10.2-0-g88b30ab89da2d0d0abb153818746c5a2d30eccec
      explicit: True
  - kind: go_module
    module: github.com/spf13/pflag
    url: github:spf13/pflag
    ref:
      go-version: v1.0.10
      git-ref: v1.0.10-0-g0491e5702ad2bb108bc519a5221bcc0f52aa9564
      explicit: True
  - kind: go_module
    module: github.com/spf13/viper
    url: github:spf13/viper
    ref:
      go-version: v1.21.0
      git-ref: v1.21.0-0-g394040caccbdf5821fa6839386a35f0fb1b1ee9e
      explicit: True
  - kind: go_module
    module: github.com/spiffe/go-spiffe/v2
    url: github:spiffe/go-spiffe
    ref:
      go-version: v2.7.0
      git-ref: v2.7.0-0-g76b14bd4140aac9bef74b27a77c81333c47feee1
      explicit: True
  - kind: go_module
    module: github.com/stretchr/testify
    url: github:stretchr/testify
    ref:
      go-version: v1.11.1
      git-ref: v1.11.1-0-g2a57335dc9cd6833daa820bc94d9b40c26a7917d
      explicit: True
  - kind: go_module
    module: github.com/theupdateframework/go-tuf/v2
    url: github:theupdateframework/go-tuf
    ref:
      go-version: v2.4.2
      git-ref: v2.4.2-0-gf5edbde31e5507f46db2069402dc38903fe6d9d4
      explicit: True
  - kind: go_module
    module: github.com/transparency-dev/merkle
    url: github:transparency-dev/merkle
    ref:
      go-version: v0.0.2
      git-ref: v0.0.2-0-g036047b5d2f7faf3b1ee643d391e60fe5b1defcf
      explicit: True
  - kind: go_module
    module: github.com/withfig/autocomplete-tools/integrations/cobra
    url: github:withfig/autocomplete-tools
    ref:
      go-version: v1.2.1
      git-ref: integrations/cobra/v1.2.1-0-g94f003f2ede44499f6160b4857167be99a26fe52
      explicit: True
      subdirectory: integrations/cobra
  - kind: go_module
    module: gitlab.com/gitlab-org/api/client-go
    url: gitlab:gitlab-org/api/client-go
    ref:
      go-version: v1.46.0
      git-ref: v1.46.0-0-gda7b8a72a07b41ac257b538fac02a6aaa49047fc
      explicit: True
  # - kind: go_module
  #   module: golang.org/x/crypto
  #   url: ""
  # - kind: go_module
  #   module: golang.org/x/oauth2
  #   url: ""
  # - kind: go_module
  #   module: golang.org/x/sync
  #   url: ""
  # - kind: go_module
  #   module: golang.org/x/term
  #   url: ""
  # - kind: go_module
  #   module: google.golang.org/api
  #   url: ""
  # - kind: go_module
  #   module: google.golang.org/protobuf
  #   url: ""
  # - kind: go_module
  #   module: k8s.io/api
  #   url: ""
  # - kind: go_module
  #   module: k8s.io/apimachinery
  #   url: ""
  # - kind: go_module
  #   module: k8s.io/client-go
  #   url: ""
  # - kind: go_module
  #   module: k8s.io/utils
  #   url: ""
  # - kind: go_module
  #   module: sigs.k8s.io/release-uti
