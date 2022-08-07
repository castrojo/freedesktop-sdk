import csv

def add_delim(value):
    numdelims = int((24 - len(value) - 1) / 8)
    numdelims = max(numdelims, 1)
    delims = '\t' * numdelims
    return value+delims

with open('service-names-port-numbers.csv', 'r', encoding="utf-8") as f:
    reader = csv.reader(f)
    next(reader)
    ports = {}
    for row in reader:
        name, port, protocol, description = tuple(row[:4])
        if not name or not port or not protocol:
            continue
        prot = f'{port}/{protocol}'
        if prot not in ports:
            ports[prot] = (name, [], description)
        else:
            ports[prot][1].append(name)

with open('services', 'w', encoding="utf-8") as out:
    for port, values in ports.items():
        name, aliases, description = values

        description = description.splitlines()
        if description:
            description = '# {description[0]}'
        else:
            description = ''

        aliases = ' '.join(aliases)

        out.write(
            f'{add_delim(name)}'
            f'{add_delim(port)}'
            f'{add_delim(aliases)}'
            f'{description}\n'
        )

with open('protocols', 'w', encoding="utf-8") as out:
    with open('protocol-numbers-1.csv', 'r', encoding="utf-8") as f:
        reader = csv.reader(f)
        next(reader)
        # TODO check if PORTS is same as above
        ports = {}
        for row in reader:
            number, keyword, description = tuple(row[:3])
            if not keyword:
                name = '#'
            else:
                name = keyword.lower()

            if keyword.endswith(' (deprecated)'):
                name = '#'

            description = description.splitlines()
            if description:
                description = f'# {description[0]}'
            else:
                description = ''

            out.write(
                f'{add_delim(name)}'
                f'{add_delim(number)}'
                f'{add_delim(keyword)}'
                f'{description}\n'
            )
