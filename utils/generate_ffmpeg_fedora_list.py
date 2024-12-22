import urllib.request


def get_fedora_file(url: str) -> str:
    req = urllib.request.Request(url)
    plugins = []
    with urllib.request.urlopen(req) as response:
        count = 0
        for line in response.readlines():
            line = line.decode()
            plugin = line.split("#")[0].strip()

            if plugin:
                # print(plugin.strip())
                # format the yaml so the final string doesn't end up a one liner
                if count >= 6:
                    plugin = f"\\\n    {plugin}"
                    count = 0

                plugins.append(plugin)
                count += 1

    # print(plugins)
    return ",".join(plugins)


def main():
    encoders = "https://src.fedoraproject.org/rpms/ffmpeg/raw/rawhide/f/enable_encoders"
    decoders = "https://src.fedoraproject.org/rpms/ffmpeg/raw/rawhide/f/enable_decoders"

    # Generate the final strings to copy paste into the yaml
    # They are pre-formatted
    print(
        "  encoders: |-\n" + f"    {get_fedora_file(encoders)}" + ",%{extra-encoders}"
    )
    print("")
    print(
        "  decoders: |-\n" + f"    {get_fedora_file(decoders)}" + ",%{extra-decoders}"
    )


main()
