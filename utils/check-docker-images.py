#!/usr/bin/env python3

# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

import os
import sys

import gitlab
import yaml


# 7903120 = freedesktop-sdk/infrastructure/freedesktop-sdk-docker-images
DOCKER_IMAGES_PROJECT = 7903120


def find_image_ids(value):
    if isinstance(value, dict):
        for key, item in value.items():
            if key == "DOCKER_IMAGE_ID":
                yield item
            yield from find_image_ids(item)
    elif isinstance(value, list):
        for item in value:
            yield from find_image_ids(item)


with open(sys.argv[1], encoding="utf-8") as f:
    config = yaml.safe_load(f)

gl = gitlab.Gitlab("https://gitlab.com", job_token=os.environ["CI_JOB_TOKEN"])
project = gl.projects.get(DOCKER_IMAGES_PROJECT)

invalid = []

for image_id in sorted(set(find_image_ids(config))):
    try:
        refs = project.commits.get(image_id).refs(type="branch")
        if not any(ref.name == "master" for ref in refs):
            invalid.append(image_id)
    except gitlab.exceptions.GitlabGetError:
        invalid.append(image_id)

if invalid:
    for image_id in invalid:
        print(
            f"ERROR: Docker image ID {image_id} is not a commit in docker-images/master"
        )
    sys.exit(1)
