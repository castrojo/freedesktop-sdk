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
  ref: v3.1.4-35-g0743bfcff5f81ec49ffcea2f61b98938f6ba70ec
- kind: go_mod_vendor
  ref:
  - module: cloud.google.com/go
    version: v0.123.0
    sha256sum: e9c9509cf75beb9516795eeb113d01a20e2a71496a66ed736b6ed2a516878d52
  - module: cloud.google.com/go/auth
    version: v0.24.1
    sha256sum: a04d4683890bf0ee87412052fbf3714f269ec32610e2af10e3c2d8613966aec6
  - module: cloud.google.com/go/auth/oauth2adapt
    version: v0.3.0
    sha256sum: 4c991104cea02fe9f2aba1d177a691b57f5988ecf63aee4aefa05b77b0fd405a
  - module: cloud.google.com/go/compute/metadata
    version: v0.10.0
    sha256sum: 5814f9cc62d49d73e213091485cf977037ec4c219d1d831422c24f2f40735346
  - module: cloud.google.com/go/iam
    version: v1.14.0
    sha256sum: db617c9374fbb4f468019e621de3ec4c1cd9c6f8374a2719d9fcc7c9d54be5a5
  - module: cloud.google.com/go/kms
    version: v1.35.0
    sha256sum: 3675e0e88b1a9a8118a92937a4ec8e3af3b931cb82a4e46b67ca4ffa6c4b44d8
  - module: cloud.google.com/go/longrunning
    version: v1.2.0
    sha256sum: fd66688ea2a5828626a3efa71614d9cf0d16be6011adc2bf3de7da1c29a547ba
  - module: connectrpc.com/connect
    version: v1.21.1
    sha256sum: 50b30919e494d802370aa89607791c415332ccd12c7fc1a8f40665051a4e0f0e
  - module: cuelabs.dev/go/oci/ociregistry
    version: v0.0.0-20260601085548-328ff8e2c943
    sha256sum: 8484816b1166006af6337971b4d7b7539349921da640c37e5dda05c8de554f11
  - module: cuelang.org/go
    version: v0.17.1
    sha256sum: 8a259e7c9c7aec06cd1391a3976fafe573042745fe5bb0f0e1da5cadc6c2a0ec
  - module: filippo.io/edwards25519
    version: v1.2.0
    sha256sum: 98f2d3ca9b88daa031b0fb2fb521b7ea386af1fed61b6f445a20bef7fa381c17
  - module: filippo.io/mldsa
    version: v0.0.0-20260215214346-43d0283efc3e
    sha256sum: c9e5675b68b2276cf10331d651a1b182a5ad7753906b1ac7dc314684b29e9902
  - module: github.com/AdamKorcz/go-fuzz-headers-1
    version: v0.0.0-20230919221257-8b5d3ce2d11d
    sha256sum: c5e2177eb7378b44d0a94e48ef95f3157050ecfdfaf839eb4fc496c25e8386cc
  - module: github.com/AliyunContainerService/ack-ram-tool/pkg/credentials/provider
    version: v0.18.1
    sha256sum: a3cde58bda49be23af5a21b956007647e805247d19f839c03978e6759517e5e3
  - module: github.com/AliyunContainerService/ack-ram-tool/pkg/ecsmetadata
    version: v0.0.9
    sha256sum: e06512bd1fc18a9f1f28237a1a9b0b8cce6b3831331bc0c98a95cd0653a2e7e6
  - module: github.com/Azure/azure-sdk-for-go
    version: v68.0.0+incompatible
    sha256sum: c40d67ce49f8e2bbf4ca4091cbfc05bd3d50117f21d789e32cfa19bdb11ec50c
  - module: github.com/Azure/azure-sdk-for-go/sdk/azcore
    version: v1.24.0
    sha256sum: 436f1ce6f8eefdc1d56082abe7a7c85d107609e535ded6371f4c182100dfe74a
  - module: github.com/Azure/azure-sdk-for-go/sdk/azidentity
    version: v1.15.0
    sha256sum: 818f833ae8f19c24b0f5f8c34f31ef910c5d4280802dda1f43a8a60cc07a6ae4
  - module: github.com/Azure/azure-sdk-for-go/sdk/azidentity/cache
    version: v0.4.0
    sha256sum: 29a59f8fb8be3065e081a3bd8ec67658e97d396204f3a9f84a4724d89f13c150
  - module: github.com/Azure/azure-sdk-for-go/sdk/containers/azcontainerregistry
    version: v0.2.3
    sha256sum: 6ae9ea0c3bd4db6b25d681d16dbdbfb159893cd901cf8de17b34d43fcadc2f8c
  - module: github.com/Azure/azure-sdk-for-go/sdk/internal
    version: v1.13.0
    sha256sum: 206818577e4ffcc34cbd55da36e52194226dc3a561817b4df422f42870506113
  - module: github.com/Azure/azure-sdk-for-go/sdk/security/keyvault/azkeys
    version: v1.5.0
    sha256sum: 957dd5a34b39bacf0503b17a3ecfd77d77ce3f90cce3da443e14daeb863ee7bf
  - module: github.com/Azure/azure-sdk-for-go/sdk/security/keyvault/internal
    version: v1.2.0
    sha256sum: fea8b9a6517633da1b023698f9be20868fa21ef5886847bc9a939fbac89c7dee
  - module: github.com/Azure/go-ansiterm
    version: v0.0.0-20250102033503-faa5f7b0171c
    sha256sum: 53babc36db77d2d8af41cf86bddcf6203747335054c26b44165a6725c5455c34
  - module: github.com/Azure/go-autorest
    version: v14.2.0+incompatible
    sha256sum: 89ac786da5b108e594bb1fbbf8f39a822fc1d994be1ff7cc6e860e8b45f3d80c
  - module: github.com/Azure/go-autorest/autorest
    version: v0.11.30
    sha256sum: 06d6428682506f7febcac2d1c3919f9350393124b82dbdc9320e6690c12aff23
  - module: github.com/Azure/go-autorest/autorest/adal
    version: v0.9.24
    sha256sum: 610f3610856de519a028a6023039df0f9807485132bf56b8c3d4d3326991d4bf
  - module: github.com/Azure/go-autorest/autorest/azure/auth
    version: v0.5.13
    sha256sum: b42a1285d8efb316cfade5041a6a3eb9ab34c89318952424ced3c06687539c74
  - module: github.com/Azure/go-autorest/autorest/azure/cli
    version: v0.4.7
    sha256sum: a7e7f17e7fa18253269b7d1388ce7edf3c676ad20dfa91ac2c4e2ac7a24fde62
  - module: github.com/Azure/go-autorest/autorest/date
    version: v0.3.1
    sha256sum: b9ee63371acb0f7ed8fc8f5f90afdaee0a138c4b3c9e1163e293384961713656
  - module: github.com/Azure/go-autorest/autorest/mocks
    version: v0.4.2
    sha256sum: d5baa29298c10ef714a41f8d2b9741a7a0bba8caf163efeb0471296b9af1b516
  - module: github.com/Azure/go-autorest/logger
    version: v0.2.2
    sha256sum: 8c336dc5a6436e8e3be9db03768b709e2299448b90212dd736ee570f4b82e0bf
  - module: github.com/Azure/go-autorest/tracing
    version: v0.6.1
    sha256sum: bec59e5170331f2406d2363275d66078ee5ea65653bb8577be8494ae4014cb1c
  - module: github.com/AzureAD/microsoft-authentication-extensions-for-go/cache
    version: v0.1.1
    sha256sum: de8edfcf96b8879307ea318c939dd4a07d666137e1bdf87733072a6c160e9e1a
  - module: github.com/AzureAD/microsoft-authentication-library-for-go
    version: v1.10.1
    sha256sum: adc8dd050c3f5b194f49b40ff9c9138da3e67b112f76c1fb77d8ce650def4e41
  - module: github.com/Microsoft/go-winio
    version: v0.6.2
    sha256sum: cd007bdb877a578efde2780bf5dd2f57dd557b5b08c3614597b820d0369ebb0f
  - module: github.com/ProtonMail/go-crypto
    version: v1.4.1
    sha256sum: 70bbdc0f9e926738193aed968f7901efab41493752277c4c94c9b751aa55c42a
  - module: github.com/agnivade/levenshtein
    version: v1.2.2
    sha256sum: fddc7fe6b25f8cdc331f62477aa12dd7890903f312ea6e3a1def965dd5f74053
  - module: github.com/alibabacloud-go/alibabacloud-gateway-pop
    version: v0.0.6
    sha256sum: 6dce638dcb323a28e7f8a044c1265746142f90a31b081609c83e59921876791e
  - module: github.com/alibabacloud-go/alibabacloud-gateway-spi
    version: v0.0.5
    sha256sum: 07560eb169150c9a98368e1a5363fa1a484768b3369aea209df692c0e3601580
  - module: github.com/alibabacloud-go/cr-20160607/v2
    version: v2.0.0
    sha256sum: 7b62f407c0c3dfec503344b47a59c1069b5956b908b89127486d5a8fa6290076
  - module: github.com/alibabacloud-go/cr-20181201/v3
    version: v3.2.3
    sha256sum: e3c62a09aed27b24d9cf1005eb45357f0408c148e71b2eb2d4916ed9a0fc888a
  - module: github.com/alibabacloud-go/darabonba-array
    version: v0.1.0
    sha256sum: af7cd9fd67d65aa0d355900de0a0f96ae9fa50e9b30ffcd305dda087ab939138
  - module: github.com/alibabacloud-go/darabonba-encode-util
    version: v0.0.2
    sha256sum: 4884db5539d686ffcab6b55bef4a633083b2c55d6287eef49c47fc36fa3c66cb
  - module: github.com/alibabacloud-go/darabonba-map
    version: v0.0.2
    sha256sum: 7fa54b74116cae80d681bd88d0255d0a9dfa7e7525d5a4991b2818ddd7622288
  - module: github.com/alibabacloud-go/darabonba-openapi/v2
    version: v2.2.4
    sha256sum: 32e7e29768b0a2909b23179c1e10a931608224211d6188a97499731e675f4587
  - module: github.com/alibabacloud-go/darabonba-signature-util
    version: v0.0.7
    sha256sum: 77adfa0cb229cefb51624b8a43cbc2c3324fe38d14b65c934c9bbb5cad4b7713
  - module: github.com/alibabacloud-go/darabonba-string
    version: v1.0.2
    sha256sum: e34968affc9c3cfb6c221df37734dc6c3f717bac6ca51c9c5bd57e716e98f8aa
  - module: github.com/alibabacloud-go/debug
    version: v1.0.1
    sha256sum: 7d6ebb77ce35399654eceb82eccbc544861f0ab8e7a6e22a792b738d630bc140
  - module: github.com/alibabacloud-go/endpoint-util
    version: v1.1.1
    sha256sum: 0711665f45c66ad2051ee9c08eb0cc59a9c77baacafeea8b791b8eb782c7fa6f
  - module: github.com/alibabacloud-go/openapi-util
    version: v0.1.0
    sha256sum: 117c207e8e301207ab029cc33fc60e7724ed988ff959935510ee45b1ccf7ee62
  - module: github.com/alibabacloud-go/tea
    version: v1.5.3
    sha256sum: bc2c55021b76ce43684f8dab87eb8da6e324d04e2cbd45e567b3cf93b24ca68d
  - module: github.com/alibabacloud-go/tea-utils
    version: v1.4.5
    sha256sum: 1390da07d391ce5e34ce7d01b32e44283cd82c52c30cc8e3a694b0e2f3d08ddb
  - module: github.com/alibabacloud-go/tea-utils/v2
    version: v2.0.9
    sha256sum: c3b1235d86b84e422d8c471ddb9a5f9a0fc3ad81ffe247f6b012e369f89c80ba
  - module: github.com/aliyun/credentials-go
    version: v1.4.7
    sha256sum: bec81fe48df750ce22586f02c27e1ea7c637fb7b134a4cf1371f90604e097586
  - module: github.com/arbovm/levenshtein
    version: v0.0.0-20160628152529-48b4e1c0c4d0
    sha256sum: 6541e823caaa51234899a38aa0a80180968741fc7d8f31b2561a29d9232e3612
  - module: github.com/asaskevich/govalidator
    version: v0.0.0-20230301143203-a9d515a09cc2
    sha256sum: 0f8ec67bbc585d29ec115c0885cef6f2431a422cc1cc10008e466ebe8be5dc37
  - module: github.com/aws/aws-sdk-go-v2
    version: v1.47.5
    sha256sum: 586beecd9a9546e74afae343991ceec70be412bf8333bd20d265a95d0a65bc3b
  - module: github.com/aws/aws-sdk-go-v2/config
    version: v1.33.12
    sha256sum: 16ce0953209837da7d604d77b3df23b0fabec39d7175bc2a90ae51c50b85ae5a
  - module: github.com/aws/aws-sdk-go-v2/credentials
    version: v1.20.12
    sha256sum: 2e2b750195af348094b09262c12ebc08d815d7bc294587890cb47c78ce043349
  - module: github.com/aws/aws-sdk-go-v2/feature/ec2/imds
    version: v1.20.5
    sha256sum: c3c0d2e16219530b33d1d507d8f73d83a843d351c61607f0a988c1c1f56c5407
  - module: github.com/aws/aws-sdk-go-v2/internal/configsources
    version: v1.5.8
    sha256sum: 545852f29780df3bc0bb366adb6303921c6801cd5348c847e196ef71460644bb
  - module: github.com/aws/aws-sdk-go-v2/internal/endpoints/v2
    version: v2.8.8
    sha256sum: a95d0b86a52687b0db638e7595ed6b399f06664f16cbef78956dce5be3210b7f
  - module: github.com/aws/aws-sdk-go-v2/internal/v4a
    version: v1.5.8
    sha256sum: e2a5c526808b8afa7e0973cfb0dbe0716726fdd1d337bca49f1839aea0947c20
  - module: github.com/aws/aws-sdk-go-v2/service/ecr
    version: v1.55.3
    sha256sum: 1080996028df7bb2e17ce1c1511b5587e8e6522ec4ad73e1e431abe558009d25
  - module: github.com/aws/aws-sdk-go-v2/service/ecrpublic
    version: v1.38.10
    sha256sum: 07284fd1309ae2351c22bbe7153ef7f24a128d6197d11b5d747d3ce9c441fd78
  - module: github.com/aws/aws-sdk-go-v2/service/internal/accept-encoding
    version: v1.13.23
    sha256sum: 40bc2073cff29fda941d9b9f5dfb0179987ff1aaef33351258bff85eb38fb665
  - module: github.com/aws/aws-sdk-go-v2/service/internal/presigned-url
    version: v1.14.8
    sha256sum: 7c8fd7fa87c8d2c7e5b837f079a4e80f8ca4746d7625e49d0a4ce85e2efa842f
  - module: github.com/aws/aws-sdk-go-v2/service/kms
    version: v1.62.2
    sha256sum: 04ecded339206361ce9361f859b6effb940dff519f8c0a9ac3521098e8b22444
  - module: github.com/aws/aws-sdk-go-v2/service/signin
    version: v1.12.0
    sha256sum: f4a74883cf226819fd980bed0e8dc1572109bd33f64f47e4b1f4cbb604be5663
  - module: github.com/aws/aws-sdk-go-v2/service/sso
    version: v1.39.0
    sha256sum: efa45b245eb40aeffd5b3f975c5da3ceeb97ce7fa3d31350c9b4f7417ee5ab4d
  - module: github.com/aws/aws-sdk-go-v2/service/ssooidc
    version: v1.44.0
    sha256sum: 53dad17f6eec9e165387a29d250c8382a76eed577852e6fca6810084b2dd6773
  - module: github.com/aws/aws-sdk-go-v2/service/sts
    version: v1.51.6
    sha256sum: 66cfdb68e115c695a130a8c13cdc07a98eb5783188394dabb7e038d029c99b59
  - module: github.com/aws/smithy-go
    version: v1.28.7
    sha256sum: 04df02bb1d501c45e403f552bebc94cb0c20057cbc9af9cd0de060ed164c27c2
  - module: github.com/awslabs/amazon-ecr-credential-helper/ecr-login
    version: v0.12.0
    sha256sum: 4502354101353d12ef87a27db3afc568865eb10d43c4c5b36b5e172ffb75829a
  - module: github.com/beorn7/perks
    version: v1.0.1
    sha256sum: 25bd9e2d94aca770e6dbc1f53725f84f6af4432f631d35dd2c46f96ef0512f1a
  - module: github.com/buildkite/agent/v3
    version: v3.138.2
    sha256sum: 661ae81803ad796c151db83c66b922caa860aa677a1da5cbb89fbe0d837221c5
  - module: github.com/buildkite/go-pipeline
    version: v0.18.0
    sha256sum: 941d4860b5f65885ae5cf78fe01892332cd2ec41f9b996bcd8b287bf1050c393
  - module: github.com/buildkite/interpolate
    version: v0.1.5
    sha256sum: f7f46fd8fa141675b86e663841f649242422e61f29c86ce8831bdf53ecbd3683
  - module: github.com/buildkite/roko
    version: v1.4.0
    sha256sum: e875911054813654014a84a90317927a5e6a248f3fd2b0d56a6c3b815c610e0a
  - module: github.com/c2sp/wycheproof
    version: v0.0.0-20260105152342-fca0d3ba9f12
    sha256sum: a7f6eaa29b2705080930a7d96b867bd5ed6fe31e1531bc4b6d526a6b3bf4a149
  - module: github.com/cenkalti/backoff/v4
    version: v4.3.0
    sha256sum: ef220b1ebf3bff4c46bbad5b2e123030e812b722b9e9dc88bc35956f9c622c2a
  - module: github.com/cenkalti/backoff/v5
    version: v5.0.3
    sha256sum: 58e4d9014277bc1c5c7ab64539137923964cc3920303a4f771d02a532939bedb
  - module: github.com/cespare/xxhash/v2
    version: v2.3.0
    sha256sum: 145a26cdc7c49db566017b807c4989ee7f7ddeb569423e9cb99f995fac3621d3
  - module: github.com/chzyer/logex
    version: v1.2.1
    sha256sum: 8bc36e064d4f53348c25a5745bd3a9030e3710c7083407da632905114d878bae
  - module: github.com/chzyer/readline
    version: v1.5.1
    sha256sum: ce25854a8beae5c20bdde840d5142e6fbd1f86f0e58442705b8fb21dfce48501
  - module: github.com/chzyer/test
    version: v1.0.0
    sha256sum: 4025a598a01e950ee44ba078b493e61e527dad8171b6ba10b7ae30371dbc630a
  - module: github.com/clbanning/mxj/v2
    version: v2.7.0
    sha256sum: 4451f64589cac692c9caa68be16551d6391949379a5bceae5455070198dd0918
  - module: github.com/cloudflare/circl
    version: v1.6.3
    sha256sum: 9aed6385d52ccd66e0a3b8cc093b5f0e7744640485405dd08c8ef89ef6bbeb06
  - module: github.com/cncf/xds/go
    version: v0.0.0-20260202195803-dba9d589def2
    sha256sum: 6f1b8ceaaa6e773dba2595bfe7b75f54d98f901c8f1340d420138095b36778fa
  - module: github.com/cockroachdb/apd/v3
    version: v3.2.3
    sha256sum: b71d9ca85316db743c8c2e9547f25bbb9c04cdff16871a36161e57ad87fb232d
  - module: github.com/codahale/rfc6979
    version: v0.0.0-20141003034818-6a90f24967eb
    sha256sum: b15238554e2e66e045df44125055b8cf57fad45a0321b25b47c9fca48ecc8e32
  - module: github.com/common-nighthawk/go-figure
    version: v0.0.0-20210622060536-734e95fb86be
    sha256sum: d0e1080f421d295735e6084ca0879bcf00b059d2af2246679be96a230b71c456
  - module: github.com/coreos/go-oidc/v3
    version: v3.21.0
    sha256sum: cb2ec6d0b1e492fe1090e181bac867dfb3ad32a9b8e51add807c1d29d42bbc16
  - module: github.com/cpuguy83/go-md2man/v2
    version: v2.0.7
    sha256sum: 9ad5f2cbc644c0bb648a9b182d6b70f92e7ac4dfab5cf0ef746bbeef944fda59
  - module: github.com/creack/pty
    version: v1.1.24
    sha256sum: 754e25253e76a5583b80d57d3add3afe68fc4d9f2a490968a9d1eda8c8fd8815
  - module: github.com/cyberphone/json-canonicalization
    version: v0.0.0-20241213102144-19d51d7fe467
    sha256sum: 9492fa89d9f2543890346672d239c494ccba4073be51f338b50e8f749792e25a
  - module: github.com/danieljoos/wincred
    version: v1.2.3
    sha256sum: a24ece3a299344e6c6cb45da1b5c147e6b14d074a8cfedd7d66488a63ca9dbd5
  - module: github.com/davecgh/go-spew
    version: v1.1.2-0.20180830191138-d8f796af33cc
    sha256sum: b4d0923b169b194f0016ec46f3df1ab0c68e27999743e43fe2de59ecb2484128
  - module: github.com/decred/dcrd/dcrec/secp256k1/v4
    version: v4.4.1
    sha256sum: 00ff35756d77aff4be22487a4b35819ff235371745b30475264ea8dcb04c37ca
  - module: github.com/depcheck-test/depcheck-test
    version: v0.0.0-20220607135614-199033aaa936
    sha256sum: 1bda3cad623715c5a138efec52c0388b1fb33b7b5c61a9440b4287b4151ff3fe
  - module: github.com/dgraph-io/badger/v4
    version: v4.9.6
    sha256sum: f1b41e7c0114195c44ac816fba9d17dcbaf20a0587c1216e0d7ebe499a647bce
  - module: github.com/dgraph-io/ristretto/v2
    version: v2.2.0
    sha256sum: a556ffc80401dfaad3ae2420e6bd9e2ecc36dc28cd50717bf74c7caa4ada1af0
  - module: github.com/dgryski/trifles
    version: v0.0.0-20230903005119-f50d829f2e54
    sha256sum: 685448e350e2d0dbb88b7087a32edbba3645134ec257bb57f33ea96c98b9067c
  - module: github.com/digitorus/pkcs7
    version: v0.0.0-20260821105541-05f79448fa77
    sha256sum: 8f613831b9cb8fd21a01a941e6cacf01177f84e0a9e12e1556d9507898e30a1e
  - module: github.com/digitorus/timestamp
    version: v0.0.0-20231217203849-220c5c2851b7
    sha256sum: 0e79eb53bb9d500f26e33a58bb0cced31d72f91b3205c7685e6126cce267c683
  - module: github.com/dimchansky/utfbom
    version: v1.2.0
    sha256sum: d44a7a0c2f3407ac735089e8f1aeb0b3d6fad150dcd413fedf377e9a3c1fa00c
  - module: github.com/docker/cli
    version: v29.9.3+incompatible
    sha256sum: ecdee197c312b3dfb29d6de9c9c3a27d39bfd2dc2063b8d23dadecce76e92d79
  - module: github.com/docker/docker-credential-helpers
    version: v0.9.12
    sha256sum: f7a68c228fa9734cd037d14db1d9e87508625bb3d478d7ec731504845eb86411
  - module: github.com/docker/go-units
    version: v0.5.0
    sha256sum: 039d53ebe64af1aefa0be94ce42c621a17a3052c58ad15e5b3f357529beeaff6
  - module: github.com/dustin/go-humanize
    version: v1.1.0
    sha256sum: b87af6613bff30e9b4f7e7b8e740eabcd921dee3bf0bda563af2278e1be9aaed
  - module: github.com/eclipse-keypont/crypto11
    version: v1.6.8
    sha256sum: 8ae404acd6a9ccd4d0b41015a7a7dda5569e783710b3dc9947f7ae8480c239aa
  - module: github.com/emicklei/go-restful/v3
    version: v3.13.0
    sha256sum: 06bd60484b324de0b8e4366d4ed326db2e1dc730459b46e19a5306a108439c77
  - module: github.com/emicklei/proto
    version: v1.14.3
    sha256sum: bb06405e5df4c1b41a7f962866e9d50866f9f9bd6b7e2282938b3b57bcaf556e
  - module: github.com/envoyproxy/go-control-plane
    version: v0.14.0
    sha256sum: 79424a75c005ee0981601e44449347c62a3f35b3b2ea57af79a89c1f31d80906
  - module: github.com/envoyproxy/go-control-plane/envoy
    version: v1.39.1-0.20260819172001-e6e3fd93e4be
    sha256sum: 04f56d99c45c2e94c4e9ad77bc39d1e0258859ce344df463bdd5443f02e778e2
  - module: github.com/envoyproxy/protoc-gen-validate
    version: v1.3.3
    sha256sum: 83a909ec95b94609da1f610a866e0553dd4ac3a7b485f7dc5c734692fa326754
  - module: github.com/fatih/color
    version: v1.18.0
    sha256sum: 4dc6907b7f6807b37c21ad527d966437d398f03472115f471eaa8fe5875363d3
  - module: github.com/felixge/httpsnoop
    version: v1.1.0
    sha256sum: e3405a361843f8e69f64e41b523512925cd50fd5ea108b7912534922c31b00e7
  - module: github.com/fortytw2/leaktest
    version: v1.3.0
    sha256sum: 867e6d131510751ba6055c51e7746b0056a6b3dcb1a1b2dfdc694251cd7eb8b3
  - module: github.com/foxcpp/go-mockdns
    version: v1.3.0
    sha256sum: 821141045648b8f56d70549398abff7b7a421f0743acd53d45604b6c2dcaf907
  - module: github.com/frankban/quicktest
    version: v1.14.6
    sha256sum: 8c7377023523780b2a6508f3c06bd3bbefd3dda064533ad6ff6724986234988d
  - module: github.com/fsnotify/fsnotify
    version: v1.10.1
    sha256sum: b2c6a334e0d518da2e046066bdd9da34cb26bad6df9f17701802d3de522ab016
  - module: github.com/fxamacker/cbor/v2
    version: v2.9.1
    sha256sum: e1e319f75e5565aab662a6afd7ddc1565ab415bd46ee82ff4958fde909da20eb
  - module: github.com/go-chi/chi/v5
    version: v5.5.0
    sha256sum: 39f8416f36d5b177b0ce5d48cf21b3f460df9260feafab1fb8c1410fde0901dc
  - module: github.com/go-jose/go-jose/v4
    version: v4.1.9
    sha256sum: 75f13f1140b91aba36857582c12b72292de849cddc7ae326eb70a055946e3810
  - module: github.com/go-logr/logr
    version: v1.4.4
    sha256sum: 3ab107c1d280ce798eaa744efd595982fa709d4023f3f38d24189827483c1710
  - module: github.com/go-logr/stdr
    version: v1.2.2
    sha256sum: 9dd6893bf700198485ae699640b49bc1efbc6c73b37cb5792a0476e1fd8f7fef
  - module: github.com/go-openapi/analysis
    version: v1.0.1
    sha256sum: 21bfff84474eac2116e6cf50aab288c4dbb9755787bd6bb8603b88fd47228328
  - module: github.com/go-openapi/errors
    version: v0.22.9
    sha256sum: 051d8685c61791cb57083da18eff3639f0a00dc4357c28b1598b675cf29bcc59
  - module: github.com/go-openapi/jsonpointer
    version: v1.0.2
    sha256sum: 17f1ac86597f72014e1f6d4757b9c05163f7ad5eed211a1144704662e1ea5dd4
  - module: github.com/go-openapi/jsonreference
    version: v1.0.3
    sha256sum: 1adc237e7a6db50c84463be19e172add5b9a89228c3a2af946ff53520e647cf1
  - module: github.com/go-openapi/loads
    version: v0.25.3
    sha256sum: 0fd6f6fb6c7368fdbd9a90dab3186ac034a666f55c85d75eaa98869014d69fd4
  - module: github.com/go-openapi/runtime
    version: v0.33.4
    sha256sum: c18d4b38499d6fa3d96577ef67933f1015ff1248d230d018aec40d742b70e60e
  - module: github.com/go-openapi/runtime/server-middleware
    version: v0.33.4
    sha256sum: 90d8c019e389dcc9d352dbd182836e5ac61ffbfbe3487fb8b1892da4309faeab
  - module: github.com/go-openapi/spec
    version: v1.0.1
    sha256sum: ca3c4cbdb2db4b86609e3ce26d7c52e64eb5b871c545936e9a133531a0251b86
  - module: github.com/go-openapi/strfmt
    version: v0.27.4
    sha256sum: cf7554bea11e3dc0d276d20cf6b040656e4e327a0041880517d538990128f58c
  - module: github.com/go-openapi/swag
    version: v0.29.2
    sha256sum: 7eb932c6e8d2c65399cb0ce05ac07ed6890e8be8f89f0e14c3633c13b9e6b5c1
  - module: github.com/go-openapi/swag/cmdutils
    version: v0.29.2
    sha256sum: 9d3718108fe466f6939a02798e77610850bd3972b26bb4be767277b80a74491a
  - module: github.com/go-openapi/swag/conv
    version: v0.29.2
    sha256sum: 40f074336f5332566d1e591fef0213e1f5b66a056c529f23a742f00c48e9a98b
  - module: github.com/go-openapi/swag/fileutils
    version: v0.29.2
    sha256sum: 0df6e2bf0df5203870aefb951288b75edae2982c5ce7c74847e3f4ecfbe288b2
  - module: github.com/go-openapi/swag/jsonutils
    version: v0.29.2
    sha256sum: 9501519560dd16e45329d8347494818cfaabae577a12a465a15a97690b870429
  - module: github.com/go-openapi/swag/jsonutils/fixtures_test
    version: v0.29.2
    sha256sum: 7fc9d8bd9e8945a401cd2ba9f7a59560a77db2ba2ca08faf735265089cd08161
  - module: github.com/go-openapi/swag/loading
    version: v0.29.2
    sha256sum: cda07b9e0b9a53015118fac77ca11c733bac26e7bbb3b89089cef24f1e3c5271
  - module: github.com/go-openapi/swag/mangling
    version: v0.29.2
    sha256sum: ac4e040b22930aec1a70d099192a6fbbf68c9c7b624d50ab8f6faf08fb8859b8
  - module: github.com/go-openapi/swag/netutils
    version: v0.29.2
    sha256sum: e5cfc45406c88b20b54481afd011685bb2419a74ed7032348f9fea15d034e3bd
  - module: github.com/go-openapi/swag/pools
    version: v0.29.2
    sha256sum: 896d9fd8b6d08753fcadd1f6f3e064068c8a5c0d7a9af58d4ecdbdfbf07afa0c
  - module: github.com/go-openapi/swag/stringutils
    version: v0.29.2
    sha256sum: f48ab90eedafb4059e96fcb9bb63c9bf47b6a7a03f2c191dcf9d5698e2c9700e
  - module: github.com/go-openapi/swag/typeutils
    version: v0.29.2
    sha256sum: 3029ba8a7894271a67db1bb24ebfb8e4945b960234167f0fa9c2fcd3fb13ac8d
  - module: github.com/go-openapi/swag/yamlutils
    version: v0.29.2
    sha256sum: d2dd896648b99f6bd5c09e95c15002da7cedc36339cd53875e8ff1f70429109c
  - module: github.com/go-openapi/testify/enable/yaml/v2
    version: v2.8.0
    sha256sum: a5e70a4189c68268a07460828ef8c74be4b133a8ee5aa25b00ea7c9bf5abf8c4
  - module: github.com/go-openapi/testify/v2
    version: v2.8.0
    sha256sum: 5e0a75713f4998ca45ba997bfeefe3ca2f27e2ca9e754aca33e16beabf131c4f
  - module: github.com/go-openapi/validate
    version: v1.0.1
    sha256sum: 846c4f6680e5448f284c3a1cae73f0d6b6a111250abd36ff7ff3dac50b5563e0
  - module: github.com/go-piv/piv-go/v2
    version: v2.6.0
    sha256sum: 31f852e91d6c35be18d7d282f6555e74e3aac2ba6077992455baf281fc0d293c
  - module: github.com/go-quicktest/qt
    version: v1.102.0
    sha256sum: cbcd567d482081f6379d844c6a75137f2bf9a89defd06046659951ca03a44134
  - module: github.com/go-rod/rod
    version: v0.116.2
    sha256sum: 985245a8535cc24da8bb91cff4f10ece3daa7b4a25eb5df1800f04287c3e64de
  - module: github.com/go-test/deep
    version: v1.1.2
    sha256sum: 7c9734656e0e0d74dd86df45037c6b2b71e2a58ad067649f0229c8612677bf16
  - module: github.com/go-viper/mapstructure/v2
    version: v2.5.0
    sha256sum: 326f8e00f648af4ae8e6e18c606325e4206a92d6ed42f486dc2f4da8e1897547
  - module: github.com/gobwas/glob
    version: v1.1.0
    sha256sum: 64b6adb1ee7fc22b74fa1d132e4c57f5bd3730f77948b174fe5f51e60394dd88
  - module: github.com/goccy/go-json
    version: v0.11.2
    sha256sum: 74950d7475e8a68137688472f468bf7756cbd0a171f47a4ce4dba88fe57e60e2
  - module: github.com/godbus/dbus/v5
    version: v5.2.2
    sha256sum: 5c6f37c725a481fb0f1e7866ae273429525d8cc6a6cace87da28e53370f5596a
  - module: github.com/golang-jwt/jwt/v4
    version: v4.5.2
    sha256sum: ec5ee69a31fd478fc197fddce7c06dad1abe7543095a55c4ee6546ae79d99a0f
  - module: github.com/golang-jwt/jwt/v5
    version: v5.3.1
    sha256sum: 5c9a74494e2bc746cee56558b5473252af5767f7ea4044caa9ea0fa2a056fec7
  - module: github.com/golang/protobuf
    version: v1.5.4
    sha256sum: 9a2f43d3eac8ceda506ebbeb4f229254b87235ce90346692a0e233614182190b
  - module: github.com/golang/snappy
    version: v1.0.0
    sha256sum: d712fef567e361d17e879f80ea53ebfdf529185a6bc74a2aa1996133ddd0a930
  - module: github.com/google/certificate-transparency-go
    version: v1.4.0
    sha256sum: 43ea6cccbab18a9e08881ffac8b86a1d5631b1ad8b57ee3fd2e5d301f4973726
  - module: github.com/google/flatbuffers
    version: v25.2.10+incompatible
    sha256sum: 5f740234a99d0975da38a3c3647c51a5cc8a1991041d6e807f34046331671de6
  - module: github.com/google/gnostic-models
    version: v0.7.0
    sha256sum: 797a05cd73a30624ece79633c4db4631676adc1f30f07a0a7051ab39beca96c8
  - module: github.com/google/go-cmp
    version: v0.7.0
    sha256sum: 64a9ce046f2c320e3783fba0d1f4a15f8a18f0b009b67bf27f7630919db3f539
  - module: github.com/google/go-containerregistry
    version: v0.22.1
    sha256sum: 74b381e8f3ea910c74bc20ec2524978fbb2cf5b4115bc58b12767eea55dec73b
  - module: github.com/google/go-github/v88
    version: v88.0.0
    sha256sum: ef4fd211dcff617c1406bc6bc9893745d7879c6d5f5a44e8aea90b8754d04b74
  - module: github.com/google/go-querystring
    version: v1.2.0
    sha256sum: 57b7ce2b82b33c68f59a224c6dd1305753e5ee3eecbefd09d43423a14f541e31
  - module: github.com/google/gofuzz
    version: v1.2.0
    sha256sum: 5948f40af1923d8f98dc1d4191311030e40e0057fb255df19ebc0360f2faac16
  - module: github.com/google/s2a-go
    version: v0.1.11
    sha256sum: ee48fb249912b3e655080ad30d938d6b8f9864e1d16242879a69f51519745f86
  - module: github.com/google/trillian
    version: v1.8.0
    sha256sum: d8d77fd29d1cb84322590e725348550f4ca7690ec8a6ce7e3b39c2ad95b365a9
  - module: github.com/google/uuid
    version: v1.6.0
    sha256sum: d0f02f377217f42702e259684e06441edbf5140dddcc34ba9bea56038b38a6ed
  - module: github.com/googleapis/enterprise-certificate-proxy
    version: v0.3.23
    sha256sum: 32ff02358b87b237ed6eb6edb7e76aa6b1ade05fbd3c6cd88426323ea72a23a6
  - module: github.com/googleapis/gax-go/v2
    version: v2.26.2
    sha256sum: 97c16d0f59fa00739d6ec77c6e21337f25c93162fc3e232b50173476579c8d0d
  - module: github.com/gorilla/websocket
    version: v1.5.4-0.20250319132907-e064f32e3674
    sha256sum: 81809e9741b37f386c8d28c9c6a23511f4a2465fd024a690a4c44a439e32e832
  - module: github.com/grpc-ecosystem/go-grpc-middleware
    version: v1.4.0
    sha256sum: e4e1845280f93ea81648d0e48d3c17e6610c7916a49171f73c150fbde8fa9bc0
  - module: github.com/grpc-ecosystem/go-grpc-middleware/v2
    version: v2.3.4
    sha256sum: 10ffaa39d2c571c4b279b303a37e78c1f297a8f090c7e1de15d64054c2ec7ef0
  - module: github.com/grpc-ecosystem/grpc-gateway/v2
    version: v2.33.0
    sha256sum: 37dcc2ca4d3be63b766803ac1c077d4acf7ea6591ec7997070f9df4481066a1d
  - module: github.com/hashicorp/errwrap
    version: v1.1.0
    sha256sum: 209ae99bc039443e28e4d6bb66517d1756d9468b7578d31f1b63a28103d8e18c
  - module: github.com/hashicorp/go-cleanhttp
    version: v0.5.2
    sha256sum: e9f3dcfcb33172ba499b4f8e888169252d7f1e072082182124a6e2053523f7df
  - module: github.com/hashicorp/go-hclog
    version: v1.6.3
    sha256sum: ebab3136e5327ad17606485f633c2d033c61eadb843b2f3629b6d65d6fbb1400
  - module: github.com/hashicorp/go-multierror
    version: v1.1.1
    sha256sum: 972cd841ee51fdeac69c5a301e57f8ea27aebf15fddd7f621d5c240f28c3000c
  - module: github.com/hashicorp/go-retryablehttp
    version: v0.7.8
    sha256sum: 9e2c175e4af37cdfeba28ed89250ad1fd691eda0fab167fafa9928222646b71e
  - module: github.com/hashicorp/go-rootcerts
    version: v1.0.2
    sha256sum: 864a48e642e87a273fb5ef60bb3575bd74a7090510f93143163fa6700be31948
  - module: github.com/hashicorp/go-secure-stdlib/parseutil
    version: v0.2.0
    sha256sum: 715aecec5d925467704774d3ab4bd3c4eead5ddb525a4bceb06c6f1e697ddba8
  - module: github.com/hashicorp/go-secure-stdlib/strutil
    version: v0.1.2
    sha256sum: 8070c67bc97e15488b99b172ddb6631412dca0fcb8cea90e37fe55d95e1af00a
  - module: github.com/hashicorp/go-sockaddr
    version: v1.0.7
    sha256sum: 53ea8d77b68056fe7f40a53338aa73ed6ddca9558fe1156804070a060f1a930f
  - module: github.com/hashicorp/hcl
    version: v1.0.1-vault-7
    sha256sum: 84fea514e70253c65e3caf90a8d9f366808bdfb4099914d1e6ab0d1fdba976b7
  - module: github.com/hashicorp/vault/api
    version: v1.23.0
    sha256sum: 475fa3034ee78afd44ea82a1098424b172672bba26b10a3d8dd636cdefaa077b
  - module: github.com/howeyc/gopass
    version: v0.0.0-20210920133722-c8aef6fb66ef
    sha256sum: 00098a455d6323b0124492626ce50bfa4552d3fcccffb5b85232f795d76eb8cf
  - module: github.com/in-toto/attestation
    version: v1.2.0
    sha256sum: 755f95c2361aed959041c47cb145c3e98130c7b038506c2c9206a72f6f0a1f6a
  - module: github.com/in-toto/in-toto-golang
    version: v0.11.0
    sha256sum: eb4aa5358ed3ffc9ce44e82bb04fe03d1d8af6ae8e441b82c2b8bf64be78b2aa
  - module: github.com/inconshreveable/mousetrap
    version: v1.1.0
    sha256sum: 526674de624d7db108cfe7653ef110ccdfd97bc85026254224815567928ed243
  - module: github.com/jedisct1/go-minisign
    version: v0.0.0-20230811132847-661be99b8267
    sha256sum: 5c8c88dd60cd9c2214a38f5ce42d39c05aafb58a92909c2bc1f49e430d59b1d5
  - module: github.com/jellydator/ttlcache/v3
    version: v3.4.1
    sha256sum: 486223b9991aa002512e87b68f2db74fad86aff9002bf2ee04b19f19446ce31b
  - module: github.com/json-iterator/go
    version: v1.1.12
    sha256sum: d001ea57081afd0e378467c8f4a9b6a51259996bb8bb763f78107eaf12f99501
  - module: github.com/kelseyhightower/envconfig
    version: v1.4.0
    sha256sum: af674112c38290862e5f59fc2867b81f7b0e623ec2fd1465cd3812e538b351d3
  - module: github.com/keybase/go-keychain
    version: v0.0.1
    sha256sum: 9514a68da08d39d60a47640bef049e44c829aab5dbbddd03d272e9252039a5c7
  - module: github.com/klauspost/compress
    version: v1.20.3
    sha256sum: 1eb710a814c44bf21332a512a19f496fb5c489ca8eb72244bb9c49f80900848f
  - module: github.com/kr/pretty
    version: v0.3.1
    sha256sum: ecf5a4af24826c3ad758ce06410ca08e2d58e4d95053be3b9dde2e14852c0cdc
  - module: github.com/kr/text
    version: v0.2.0
    sha256sum: 368eb318f91a5b67be905c47032ab5c31a1d49a97848b1011a0d0a2122b30ba4
  - module: github.com/kylelemons/godebug
    version: v1.1.0
    sha256sum: dbbd0ce8c2f4932bb03704d73026b21af12bd68d5b8f4798dbf10a487a2b6d13
  - module: github.com/lestrrat-go/blackmagic
    version: v1.0.4
    sha256sum: 4775ca8eab443a882cc1772c25716810a889d478746c6a405f559750de42dce6
  - module: github.com/lestrrat-go/dsig
    version: v1.4.0
    sha256sum: 5ffb0bd56d8ee6a472cf7ff21472b792a3679c8c76934c58661ef05ca2ec692a
  - module: github.com/lestrrat-go/dsig-secp256k1
    version: v1.0.0
    sha256sum: 1d1dbde8d45f731b491fe1de12eeb18ceea0b3bb32592c29f2f545f81cdcf364
  - module: github.com/lestrrat-go/httpcc
    version: v1.0.1
    sha256sum: d75132f805ea5cf6275d9af02a5ff3c116ad92ac7fc28e2a22b8fd2e029a3f4c
  - module: github.com/lestrrat-go/httprc/v3
    version: v3.0.6
    sha256sum: e9c724825002e7c25c54fbd1d7379d653dff4a7425cf0bf08814d864795ec664
  - module: github.com/lestrrat-go/jwx/v3
    version: v3.4.0
    sha256sum: ca3227fdf4c5610177d690a248d10ad5dd2d1ce1cc06d39200a166a2ecb9c4dd
  - module: github.com/lestrrat-go/option/v2
    version: v2.0.0
    sha256sum: 3456bd01638c67da62570123f3d12f5996d0a01ed521959c2fc85aa83d3ee94a
  - module: github.com/lib/pq
    version: v1.12.0
    sha256sum: 9f73a63fe5708c2339a0102d11a6783ab15cd4acc9edc415ea54922e51de9e89
  - module: github.com/manifoldco/promptui
    version: v0.9.0
    sha256sum: f8cb9d2dee31b12b2e25aad0b427aae602f608f840856667756f9531faa373b8
  - module: github.com/mattn/go-colorable
    version: v0.1.14
    sha256sum: 5e0e7925a070bb5bd11b4097e1a7b608167f0217ee83901b44c135f6e5e85c78
  - module: github.com/mattn/go-isatty
    version: v0.0.20
    sha256sum: f2d5f89ca451577e17464b9bb596dc0d0ecececb5eaa63622c41b57cd0b7b8cc
  - module: github.com/miekg/dns
    version: v1.1.62
    sha256sum: 468b7ffd2c69396ba98f1266d43f75251aaf8c6371b059c345611d63f4c5cd62
  - module: github.com/miekg/pkcs11
    version: v1.1.2
    sha256sum: fdd9780e272879ab80ce306d31c0bea3b72c5c39167b788ac93ee32d4842ce46
  - module: github.com/mitchellh/go-homedir
    version: v1.1.0
    sha256sum: fffec361fc7e776bb71433560c285ee2982d2c140b8f5bfba0db6033c0ade184
  - module: github.com/mitchellh/go-wordwrap
    version: v1.0.1
    sha256sum: 5f96426c4b3b3e90a9b7471568cb1d61d6a306744f5d4765a30fa8a61e1c0b47
  - module: github.com/mitchellh/mapstructure
    version: v1.5.1-0.20231216201459-8508981c8b6c
    sha256sum: 1cc37cf0bb7849d0fb29daabe5597450c565e334564ed28eabf3f0602259733b
  - module: github.com/moby/term
    version: v0.5.2
    sha256sum: f8d6e5c53992c640512ee45a9b6147a765bebe3d8d50e3bfe1e4ec3e052cd688
  - module: github.com/modern-go/concurrent
    version: v0.0.0-20180306012644-bacd9c7ef1dd
    sha256sum: 91ef49599bec459869d94ff3dec128871ab66bd2dfa61041f1e1169f9b4a8073
  - module: github.com/modern-go/reflect2
    version: v1.0.3-0.20250322232337-35a7c28c31ee
    sha256sum: 49f3fb0f76b1b98b52b5e6e8eab2a48454eab33904b937625941c28138a7fea4
  - module: github.com/mozillazg/docker-credential-acr-helper
    version: v0.4.2
    sha256sum: 783532ae042562917ad413772f1955f7fca7687ef43a05b54a37a192c9b7c979
  - module: github.com/mozillazg/docker-credential-acr-helper/pkg/acr
    version: v0.2.3
    sha256sum: f772c8f5f3d05c3f3b6d91c1510e79e673e139ac25ee2ea08812f403721e339d
  - module: github.com/munnerz/goautoneg
    version: v0.0.0-20191010083416-a7dc8b61c822
    sha256sum: 3d7ce17916779890be02ea6b3dd6345c3c30c1df502ad9d8b5b9b310e636afd9
  - module: github.com/natefinch/atomic
    version: v1.0.1
    sha256sum: 25df4a9727bd8750557a848d9066503c2e0b1788821be4db87377fd202254ed4
  - module: github.com/nozzle/throttler
    version: v0.0.0-20180817012639-2ea982251481
    sha256sum: 660c8605727fc99ef3c71706592138b59cc6cd4d63be978b2371887626499b75
  - module: github.com/nxadm/tail
    version: v1.4.11
    sha256sum: c42a7b1a10a9b31f61806742e7be99e524a2885c9180f18403be48a703b5667a
  - module: github.com/oklog/ulid/v2
    version: v2.1.2
    sha256sum: 0af1a4847c9dcf0084230afbe6d9265f433d9f45e2507ce155e3dbbd312aa7c3
  - module: github.com/oleiade/reflections
    version: v1.1.0
    sha256sum: f8e70604f64ac56c843f2b5f7d97546d23a94db198f031c0d23962c4d2b8bce5
  - module: github.com/onsi/ginkgo
    version: v1.16.5
    sha256sum: e23fc33b0affa73a4f4c63410af931bf1f8d5b9db266b3461177036d725eacc5
  - module: github.com/onsi/gomega
    version: v1.19.0
    sha256sum: 7bf1156d06ae5e5a98e354be53980029bb19f27d84f1a7046ef9be036b96aa38
  - module: github.com/open-policy-agent/opa
    version: v1.22.4
    sha256sum: 27b9423fb67b29665778fd366af83a9d1523bcf1eca2b118e29a1a69d2eb25f8
  - module: github.com/opencontainers/go-digest
    version: v1.0.0
    sha256sum: 615efb31ff6cd71035b8aa38c3659d8b4da46f3cd92ac807cb50449adfe37c86
  - module: github.com/opencontainers/image-spec
    version: v1.1.1
    sha256sum: 3a32eeb459719172947c20be78b5b7293c6ea84f4039184e846f6b676bc19574
  - module: github.com/osscontainertools/docker-credential-acr
    version: v1.0.1
    sha256sum: fd589bcb079ffefa0a4d83b5252e6303380940576c075d4490ecf76331bcf651
  - module: github.com/pborman/uuid
    version: v1.2.1
    sha256sum: 3699aef3b9e0a97863a4a90bf26254d1a6ba03a2b1d4f4d2a5061c4d29d9dd7f
  - module: github.com/pelletier/go-toml/v2
    version: v2.4.3
    sha256sum: bc0de16d4942df8503be13bde0447e0b7ce1694f3bb1b840f485ce839f8974cf
  - module: github.com/phuslu/lru
    version: v1.0.18
    sha256sum: adaae1ac7b8117d1642d46c6209973e5ddf03e7293210bf766c59b862167288b
  - module: github.com/pkg/browser
    version: v0.0.0-20240102092130-5ac0b6a4141c
    sha256sum: 8524ae36d809564d1f218978593b5c565cf3ee8dccd035d66b336ad0c56e60d1
  - module: github.com/pkg/errors
    version: v0.9.1
    sha256sum: d4c36b8bcd0616290a3913215e0f53b931bd6e00670596f2960df1b44af2bd07
  - module: github.com/planetscale/vtprotobuf
    version: v0.6.1-0.20240319094008-0393e58bdf10
    sha256sum: 6fdbac53c6ace58d732be8ec29c1aae928639eb12960cc4c52a9f7a25395ca05
  - module: github.com/pmezard/go-difflib
    version: v1.0.1-0.20181226105442-5d4384ee4fb2
    sha256sum: 24ff45e356f638a53bd0c89fff961fbeaecfdb0dc5e482ceed0a2230e0e5f3b7
  - module: github.com/prometheus/client_golang
    version: v1.25.0
    sha256sum: 677986b15218e6e5f740fd0801a6024726e71bf909ca1a504417eae281df4519
  - module: github.com/prometheus/client_model
    version: v0.6.3
    sha256sum: 92f5d9a39b75bdc3f6733563934438148a3c3661420a8f742fea8cbf40d39abe
  - module: github.com/prometheus/common
    version: v0.72.1
    sha256sum: 4bc895838ac3416153ab67a1459400ca32dfaf8d19220c1bda6133481bcecefd
  - module: github.com/prometheus/procfs
    version: v0.22.0
    sha256sum: e13d43da4a9773cecdfa8b86e745bbd8efda07b005402c673a1e882b6dbb6804
  - module: github.com/protocolbuffers/txtpbfmt
    version: v0.0.0-20260420112717-c39628bde8b5
    sha256sum: 46a4b9ab576d8ffb0c209638c6254b3a98fc94b76c56afd7a8c2a33002bdb66d
  - module: github.com/rogpeppe/go-internal
    version: v1.16.0
    sha256sum: 02048d8a3aee2ad0f9bcde5ae6659a19b68c24483d2358cb2a5f0f41d42db5c6
  - module: github.com/rs/cors
    version: v1.11.1
    sha256sum: 0555d9d0c18079e1d472d83044bf9fb2517626f1027d3d9d527c7a4294978500
  - module: github.com/russross/blackfriday/v2
    version: v2.1.0
    sha256sum: 7852750d58a053ce38b01f2c203208817564f552ebf371b2b630081d7004c6ae
  - module: github.com/ryanuber/go-glob
    version: v1.0.0
    sha256sum: 2084f36ead38a505489fdb46329502fb627f568224dcc22ef11ec173b61fc2cf
  - module: github.com/sagikazarmark/locafero
    version: v0.11.0
    sha256sum: 6c2a9bdf9567f63caebf47694d94acd4350b1d4d69f13c3188f4e7e82939f6a5
  - module: github.com/sassoftware/relic/v8
    version: v8.2.0
    sha256sum: 7da98c9a58c012aff44c136a6f7fadd89f20a55fcf00ac63995bce88d7f29fb1
  - module: github.com/secure-systems-lab/go-securesystemslib
    version: v0.11.1
    sha256sum: d7329cfb01e5957fd7d3703b8ef584bb69b01095a0f78f62a3dc9ffa410e1b9b
  - module: github.com/segmentio/asm
    version: v1.2.1
    sha256sum: 04ee03ed0972329c3c8fa1cd57a30397be37b82f3e2ba2251d56ba9c6fbc1d99
  - module: github.com/sergi/go-diff
    version: v1.4.0
    sha256sum: 63aef1860b251af1421ba0a014a6bb08a60833f13f948f3d88d66754bb484f53
  - module: github.com/shibumi/go-pathspec
    version: v1.3.0
    sha256sum: 1ac9091ebe9ff4154ddc39b2b3436c5b6b268d5cdc1e8462c9790485cd76a58f
  - module: github.com/sigstore/protobuf-specs
    version: v0.5.2
    sha256sum: 5596deaa95e6cac342e4fb88c74f6ee110c508e1d46ef46d7b4337f8aa101fc5
  - module: github.com/sigstore/rekor
    version: v1.5.5
    sha256sum: 3ba898722df4893357e88f5c8b8491579c22b174a72371467e6a5072194e0c59
  - module: github.com/sigstore/rekor-tiles/v2
    version: v2.4.2
    sha256sum: 7c19a7dc421f9d501cd0623cb0fc15fd319ade20044af6df5ea842719448ca36
  - module: github.com/sigstore/sigstore
    version: v1.11.3
    sha256sum: d0e08f3e54403340c503e7c6a6841166b4103ffd2fbf9f471e63e58f7cf0fde3
  - module: github.com/sigstore/sigstore-go
    version: v1.4.0
    sha256sum: 4cfa6ccf31c5e6ae8c32da0d50debb7bcdf2af8cd1195b78cdc499b223e77b37
  - module: github.com/sigstore/sigstore/pkg/signature/kms/aws
    version: v1.11.3
    sha256sum: 2f0b0a3ddd5f7d14a49245276ac8edad9132f043930ff0582ded53fdf0ac72f2
  - module: github.com/sigstore/sigstore/pkg/signature/kms/azure
    version: v1.11.3
    sha256sum: d4b5740f767fdf7ea37ce8801b6fe5f378cae9df4ad1e23e64bcc85a3d9837c3
  - module: github.com/sigstore/sigstore/pkg/signature/kms/gcp
    version: v1.11.2
    sha256sum: 160de6122c8016a219745fd5cbe7b93ac150007c2d77ae460f5633fdc1bd4a54
  - module: github.com/sigstore/sigstore/pkg/signature/kms/hashivault
    version: v1.11.3
    sha256sum: 852019475241b45c351dc2b51ef9e07d80fa81a333acac587dd8cbbb17d5f804
  - module: github.com/sigstore/timestamp-authority/v2
    version: v2.2.0
    sha256sum: b82dce922319c53ead8460030a6ad5b1ef27d41e4ef9d45cbd473ee315cc35aa
  - module: github.com/sirupsen/logrus
    version: v1.10.2
    sha256sum: 73a40737da86682dd536ec2c87dff0f589eeeed81873362b08ed009818747b52
  - module: github.com/sourcegraph/conc
    version: v0.3.1-0.20240121214520-5f936abd7ae8
    sha256sum: 6db56fe285f78ba994a77d676d790b1db85a47cc8948a42d4c2f6ca6200b9413
  - module: github.com/spf13/afero
    version: v1.15.0
    sha256sum: d03a0bbce87eeaa1c23f0c0276707bb2d59f46efee875d7d7f1d570201be6e1f
  - module: github.com/spf13/cast
    version: v1.10.0
    sha256sum: 7c7ba27f9979ada980c2a69f6b2fdf7b4ce1f2b766e245c0a4716f546ad7ddce
  - module: github.com/spf13/cobra
    version: v1.10.2
    sha256sum: a00aae6fcd631e0fde52c98604452ff70e1b73c3b8a560d68db15aff5e26872d
  - module: github.com/spf13/pflag
    version: v1.1.0
    sha256sum: 041f4b3813dc90681ef0d976b607a6f40a360acdd00e5dfe4111fd85f82bae46
  - module: github.com/spf13/viper
    version: v1.21.0
    sha256sum: 4096e4ccdbb74027c49f0dfede6d67193053b0d1c1ecce57543cf3dacc7b249e
  - module: github.com/spiffe/go-spiffe/v2
    version: v2.9.0
    sha256sum: ab0cd28d8ab340ee644e2608eebe7392a40d8196a4cf1b7676a2b66fb7d3f56c
  - module: github.com/stretchr/objx
    version: v0.5.3
    sha256sum: cdc804051b06efceea75ee9b0b6349d2f92f17cd46c6193c4a8dfb0f51465a44
  - module: github.com/stretchr/testify
    version: v1.12.1
    sha256sum: 6874ed1c4b0b7e9feb27989b16c179b36590020633436ae260cefc5f5565589f
  - module: github.com/subosito/gotenv
    version: v1.6.0
    sha256sum: 142db3dd2328e744c157e85cf3291d027013b79f92a45984f860fe38bc0f1f8d
  - module: github.com/syndtr/goleveldb
    version: v1.0.1-0.20220721030215-126854af5e6d
    sha256sum: 68a0e0b2969ac85b591fa083b202852bf0eb8a60b303581a4bd68bc0b69d77d8
  - module: github.com/tetratelabs/wazero
    version: v1.12.0
    sha256sum: dcee360162e809d1273c685d20f6faf6df7ae0d925a73bf8f1af1a4756bfe587
  - module: github.com/thales-e-security/pool
    version: v0.0.2
    sha256sum: f6e219a784150ac94a6eca8740d42ceae68428ce8f6367361ca9498bffcde41b
  - module: github.com/theupdateframework/go-tuf
    version: v0.7.0
    sha256sum: 5c2c631a720e3c4225cfff085bd080acabd4308d0e4e6244e4cc180e019b8eaa
  - module: github.com/theupdateframework/go-tuf/v2
    version: v2.4.2
    sha256sum: 2dbb43998311a484bac172503b6c62df8bb7c7e5a6333c7b63356ca3aadf0a8d
  - module: github.com/tink-crypto/tink-go-awskms/v3
    version: v3.0.0
    sha256sum: 01478890990389f90caecdf0f45fe1b78b017579e023f7a3db6893c463cf1cd6
  - module: github.com/tink-crypto/tink-go-gcpkms/v2
    version: v2.4.0
    sha256sum: f0d148ed9889ba654a7e260adbfb61dd620015f9a4c4af20482ec5fb4ff7612d
  - module: github.com/tink-crypto/tink-go-hcvault/v2
    version: v2.5.0
    sha256sum: a77e7e748f391e7b35ac37663bf80332eb6d06f6d8830d3c9215ab8d167bf60c
  - module: github.com/tink-crypto/tink-go/v2
    version: v2.9.0
    sha256sum: 3667c89a2ba66b865233b791d8f093adaf441dedd37e528ff2207a07b322f25c
  - module: github.com/tjfoc/gmsm
    version: v1.4.1
    sha256sum: ba1f3ccf698a62bcb28c594d995f21587021ad759e777aa64367c8a7332cc10b
  - module: github.com/transparency-dev/formats
    version: v0.1.1
    sha256sum: badaeecbae532b3e8f23bc07b4b4e40b1a80951b62f69e0ac0523aab0da4a5ec
  - module: github.com/transparency-dev/merkle
    version: v0.0.2
    sha256sum: bff8072eb052d166df4f8f3d144451ca83b98f1c0382995167008c44abc383fd
  - module: github.com/urfave/negroni
    version: v1.0.0
    sha256sum: 7b50615961d34d748866565b8885edd7013e33812acdbaed47502d7cc73a4bbd
  - module: github.com/valyala/fastjson
    version: v1.6.10
    sha256sum: 9b4ec65a79a668f4948baf45f53d127f6c36cd37f78c1f5cfee672bd377afce7
  - module: github.com/vektah/gqlparser/v2
    version: v2.5.64
    sha256sum: 2bbe0e723f6ca822530bb183e5c9c632105e1da02fe69b2bae468f67a9447900
  - module: github.com/withfig/autocomplete-tools/integrations/cobra
    version: v1.2.1
    sha256sum: b2a47ab2313e49e37073c93dec8d010dc9a44a846a08d87133e574cb9fad10f6
  - module: github.com/x448/float16
    version: v0.8.4
    sha256sum: 73b24a41037ea999ab66851e3798a0973dbb1f214925915b01f0820f7b2f1500
  - module: github.com/xeipuuv/gojsonpointer
    version: v0.0.0-20190905194746-02993c407bfb
    sha256sum: 11b54f0bc358b09261075c3e15cd14d57102f3ab1ba88c345c53eab6aaf228de
  - module: github.com/xeipuuv/gojsonreference
    version: v0.0.0-20180127040603-bd5ef7bd5415
    sha256sum: 7ec98f4df894413f4dc58c8df330ca8b24ff425b05a8e1074c3028c99f7e45e7
  - module: github.com/yashtewari/glob-intersection
    version: v0.2.0
    sha256sum: bc999bc9a3bcce0ed7c06180320d2236a5c32aa61def5a7c79963faa6bcf2fd0
  - module: github.com/youmark/pkcs8
    version: v0.0.0-20240726163527-a2c0da244d78
    sha256sum: cdcf5e96850f9f60bc96ab512e4bd06ee19dd2dbe855260c3589c6c79a1bcfb5
  - module: github.com/ysmood/fetchup
    version: v0.3.0
    sha256sum: 1238932028c075abe54449668dd00bc9adb3cf8490bc90cb0b3a4ed1d2c99ea2
  - module: github.com/ysmood/goob
    version: v0.4.0
    sha256sum: 451f378a78f5b4b7bc2f5684bbb74a3d25483d38b4a4370cd1da8f9d35213d8d
  - module: github.com/ysmood/got
    version: v0.42.0
    sha256sum: 62cd5e55cd211ffec0016d36cd2c1f502a88271f3b6fcff9bab6246c55269574
  - module: github.com/ysmood/gson
    version: v0.7.3
    sha256sum: 5d7373d14cc7df141722b031a16983e78964995462120c05a83d811fcd3b1b0a
  - module: github.com/ysmood/leakless
    version: v0.9.0
    sha256sum: 2c1d73d95434697af7c7997a89cb23d1b5161db401b88b006c3f843d0cabcf42
  - module: github.com/zalando/go-keyring
    version: v0.2.8
    sha256sum: af9d1310d6e1eaadb6c975f2f9b1c22c8a2d1ea2497645f5ee62eac26472c97a
  - module: gitlab.com/gitlab-org/api/client-go/v3
    version: v3.46.0
    sha256sum: 7d576b8a2b51ef140d3db0c2abd353085d14fcf77ed39026d876fb8a01c066f7
  - module: go.opentelemetry.io/auto/sdk
    version: v1.2.1
    sha256sum: a08a16fc0a7041cdb875f47a260a56000632212c85f65a302a043c76380c8335
  - module: go.opentelemetry.io/contrib/instrumentation/google.golang.org/grpc/otelgrpc
    version: v0.72.0
    sha256sum: 4a714fcf1be92ca6233ec6a719e2565f43ec6960fedbdb1195cb7cd112f1ca28
  - module: go.opentelemetry.io/contrib/instrumentation/net/http/otelhttp
    version: v0.72.0
    sha256sum: e9e9f34bc563d5114bc6c2760cf2b3d15ae82b0bbd635cd534ae3ccce2ac3300
  - module: go.opentelemetry.io/otel
    version: v1.47.0
    sha256sum: 275ce19c11b3f26830a4b3d884e6a59f3e4ef51e519ef3fc3bcbcc5e71f9b37d
  - module: go.opentelemetry.io/otel/log
    version: v1.47.0
    sha256sum: 6f99ff1e779241c778d62872f651ea7bafce80246b5cfac321aa133f196ad811
  - module: go.opentelemetry.io/otel/metric
    version: v1.47.0
    sha256sum: cfa35ad1f540114d39a381cf8773ba7d2aab47f0fa42040d409e86dee9ab27f6
  - module: go.opentelemetry.io/otel/sdk
    version: v1.47.0
    sha256sum: c01b323e4173c1700ee0352533bdc26816d1e4fa33fb15a0c24b35f9978c4918
  - module: go.opentelemetry.io/otel/sdk/metric
    version: v1.47.0
    sha256sum: 0d63b5fa4f373296a54137ed76e74dfc0b267bb5e579f313d1e76eb1bd919c37
  - module: go.opentelemetry.io/otel/trace
    version: v1.47.0
    sha256sum: dfffa6cb848954b5d3413007b6553ad3e508a9fc992a81ab4bd9026c236229be
  - module: go.step.sm/crypto
    version: v0.91.0
    sha256sum: dd78cfb183acb48614e084cde593ccc0b99fbe47eed0912ff3522ee16e1bec68
  - module: go.uber.org/goleak
    version: v1.3.0
    sha256sum: 70edef0ce7d830d992f024e527fd3452069b884f94a27787a718bd68dd620702
  - module: go.uber.org/multierr
    version: v1.11.0
    sha256sum: 2249b5d2fdce61f6ee661a679d8552599af084a761cbbc871da77641bddce0c3
  - module: go.uber.org/zap
    version: v1.28.0
    sha256sum: 49d6287497537480c2e9330e3dee9c38ac793fbf9fd2257dbc4fa5697818919c
  - module: go.yaml.in/yaml/v2
    version: v2.4.4
    sha256sum: 1b98a6a498cf255c5f2982d32c74633bc7969770957e98103ac1e14345aa4576
  - module: go.yaml.in/yaml/v3
    version: v3.0.6
    sha256sum: 5ec6b154ced05b5fe8b15aef1287d647a70c9a53f43aa14e42d2bb5aee6cffac
  - module: golang.org/x/crypto
    version: v0.59.0
    sha256sum: b5cff645013a39d6b3348dce3c53eb452de71309f9a6831c5b12b3f8d6caf1d2
  - module: golang.org/x/mod
    version: v0.42.0
    sha256sum: 2770e372e42c30dd498d63bb094fe257edfad6882c611f8e0d82925feac159f3
  - module: golang.org/x/net
    version: v0.62.0
    sha256sum: 50e869800f4921e910eb6550369f937c7187d130a7f7f78a26ef9b589a7071a6
  - module: golang.org/x/oauth2
    version: v0.37.0
    sha256sum: 82b0472ff31d57867bfb95e28c2906acd54764949a215b6a01bda40f4ae4c3bd
  - module: golang.org/x/sync
    version: v0.25.0
    sha256sum: c27da17d7e217dec0c2f8c715e5ce2b92815fa76fc08da13c41a73dd6a67dfe0
  - module: golang.org/x/sys
    version: v0.50.0
    sha256sum: b115e8a144a7c9d1df3ffb8af20b283e162844b5b624a97ee342955cca69b9e6
  - module: golang.org/x/term
    version: v0.48.0
    sha256sum: 3f6dfe1b6031005d556ad54027c191636299aa4496fd631d1b1dcd23ada8bec7
  - module: golang.org/x/text
    version: v0.44.0
    sha256sum: e51c60a7d121a493048b1638023983ce183bd5d70df1db495423ce1415663202
  - module: golang.org/x/time
    version: v0.16.0
    sha256sum: ac27777be8088859ba3b1bea3648064dc95ff8bac3023b1b059d1ab126dc729e
  - module: golang.org/x/tools
    version: v0.52.0
    sha256sum: 90b2a941aa5f2fe87564b8e38c3f03796de2e3597b7f4c52a9a6a53201b32c48
  - module: gonum.org/v1/gonum
    version: v0.17.0
    sha256sum: dadeb3d260548de27375f7188bdfd5a175110120fd8ee8085a63b0dff2cae501
  - module: google.golang.org/api
    version: v0.308.0
    sha256sum: 9b93d50b7b06522fc5133979554646f247bae90002b6e996740a1615814be2a7
  - module: google.golang.org/genproto
    version: v0.0.0-20260715232425-e75dac1f907d
    sha256sum: 2bb3944dd73d398fb40cf3e7cbc3ccfaec83e9e37ec2e4fa5e516989ee74d0a0
  - module: google.golang.org/genproto/googleapis/api
    version: v0.0.0-20261026165753-2ffab32bce7e
    sha256sum: 6d872eef1873405e3684d392ba85bda1a928f30626989860d902643ab3224033
  - module: google.golang.org/genproto/googleapis/rpc
    version: v0.0.0-20261019180522-ce908d29299b
    sha256sum: ebb3873bd63f34cf4d2af26f50bb671546c8ea2aff6ced0f4661c2d7e50c2719
  - module: google.golang.org/grpc
    version: v1.85.0
    sha256sum: bd1ce651075f55e5bad492f9e1ee7cc013f1b96770981556d2a9cb5ee2c31e1e
  - module: google.golang.org/protobuf
    version: v1.36.12
    sha256sum: 68f8a3174aff42950fd9bd02c11b45c6986eb8060508d124d1c3dd6bf86b9be6
  - module: gopkg.in/check.v1
    version: v1.0.0-20201130134442-10cb98267c6c
    sha256sum: f555684e5c5dacc2850dddb345fef1b8f93f546b72685589789da6d2b062710e
  - module: gopkg.in/evanphx/json-patch.v4
    version: v4.13.0
    sha256sum: de94747c5023a2c83909845c76acc6b4bfe28b44994207394b5e057f3085625a
  - module: gopkg.in/inf.v0
    version: v0.9.1
    sha256sum: 08abac18c95cc43b725d4925f63309398d618beab68b4669659b61255e5374a0
  - module: gopkg.in/ini.v1
    version: v1.67.3
    sha256sum: 20ab7e3150a9d0a098b5f642cc2a1ba1886da48ae0ec4080240bf33f7a7086c2
  - module: gopkg.in/tomb.v1
    version: v1.0.0-20141024135613-dd632973f1e7
    sha256sum: 34898dc0e38ba7a792ab74a3e0fa113116313fd9142ffb444b011fd392762186
  - module: gopkg.in/yaml.v2
    version: v2.4.0
    sha256sum: ede49e27c4cca6cdd2ec719aed8ea4d363710cceb3d411e7a786fbdec0d391fd
  - module: gopkg.in/yaml.v3
    version: v3.0.1
    sha256sum: aab8fbc4e6300ea08e6afe1caea18a21c90c79f489f52c53e2f20431f1a9a015
  - module: gotest.tools/v3
    version: v3.5.2
    sha256sum: d7c40ae135e4a34dee9ca4847ad18208f138847721e693647b897259287a1d4b
  - module: k8s.io/api
    version: v0.37.2
    sha256sum: 0ed015a8674e49bb21626ef5d9b465e047b9ad29bbd8e27f3d932bb0161a9fbd
  - module: k8s.io/apimachinery
    version: v0.37.2
    sha256sum: 3d50f66b5a226c5c079af9eb49c4bfd94566ccfd728a32658c438f6df1c7bba5
  - module: k8s.io/client-go
    version: v0.37.2
    sha256sum: 00cb5490cbc296aee416dd6d9c8f5c8ffeeb8cbb5ff3c838f90559bdc8b31ac7
  - module: k8s.io/klog/v2
    version: v2.140.0
    sha256sum: 46fab8686139b04c42f1b44e84c5a162667fbf22628216d5061d95206625a886
  - module: k8s.io/kube-openapi
    version: v0.0.0-20260721132016-d427ff9ee9ad
    sha256sum: d49441d035de2e04140f634bc3e4055d0ac59a05cd095cbb0717c3e36e16ed4c
  - module: k8s.io/utils
    version: v0.0.0-20260626114624-be93311217bd
    sha256sum: 11b292d2a6f02494c4d543c726426c307ad3901a7a781ab3fabeae40fd647840
  - module: sigs.k8s.io/json
    version: v0.0.0-20250730193827-2d320260d730
    sha256sum: 7cec6eae3e4e4c9c1e0a009eef200740990fafbcb9cab081eb18ce32f6e7a7b9
  - module: sigs.k8s.io/randfill
    version: v1.0.0
    sha256sum: 31dbbfc44ce12f78f1b68d6bbeed8526aa73c53243353d44d50b2532c828f5f1
  - module: sigs.k8s.io/release-utils
    version: v0.12.5
    sha256sum: 2da512a585f56c0c1de00486ee846eb9210064f45820434ea6ab1ca58daaa17b
  - module: sigs.k8s.io/structured-merge-diff/v6
    version: v6.4.2
    sha256sum: 9af2aa83a0a0ddb17f658ee8aad2a1b187450b8c0cac5687f7cc94d27d63112d
  - module: sigs.k8s.io/yaml
    version: v1.6.0
    sha256sum: cf88648a471581817b00a42ee8d24fd73eb0e3503998cf46d8e63787e11e5052
  - module: software.sslmate.com/src/go-pkcs12
    version: v0.5.0
    sha256sum: 3ced9a081e6da4c5910288f24c99df10cfb2e1baec1b5b60327301179896ad00
