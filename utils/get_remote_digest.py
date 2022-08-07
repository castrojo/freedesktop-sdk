import urllib.request
import urllib.parse
import sys
import json
import os

registry = sys.argv[1]
tag = sys.argv[2]

data = {
    'service': 'registry.docker.io',
    'scope': f'repository:{registry}:pull',
    'grant_type': 'password',
    'client_id': 'script',
    'username': os.environ['DOCKER_HUB_USER'],
    'password': os.environ['DOCKER_HUB_PASSWORD']
}
encoded_data = urllib.parse.urlencode(data).encode('ascii')

req = urllib.request.Request('https://auth.docker.io/token?{urllib.parse.urlencode(data)}')
with urllib.request.urlopen(req) as resp:
    jresp = json.load(resp)
    token = jresp['access_token']

headers = {
    'Authorization': f'Bearer {token}',
    'Accept': 'application/vnd.docker.distribution.manifest.v2+json, application/vnd.docker.distribution.manifest.list.v2+json'
}
req = urllib.request.Request(f'https://registry.hub.docker.com/v2/{registry}/manifests/{tag}', headers=headers)

with urllib.request.urlopen(req) as resp:
    print(resp.headers['Docker-Content-Digest'])
