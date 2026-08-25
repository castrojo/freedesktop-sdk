#!/usr/bin/env python3

# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

import os
import re
import sys

import gitlab

# 7903120 = freedesktop-sdk/infrastructure/freedesktop-sdk-docker-images
DOCKER_IMAGES_PROJECT = 7903120


with open(sys.argv[1], encoding="utf-8") as f:
    image_ids = {
        match.group(1)
        for line in f
        if (match := re.match(r"^\s*DOCKER_IMAGE_ID:\s*['\"]?([^'\"\s]+)", line))
    }

gl = gitlab.Gitlab("https://gitlab.com", job_token=os.environ["CI_JOB_TOKEN"])
project = gl.projects.get(DOCKER_IMAGES_PROJECT)

invalid = []

for image_id in sorted(image_ids):
    try:
        refs = project.commits.get(image_id).refs(type="branch")
        if not any(ref["name"] == "master" for ref in refs):
            invalid.append(image_id)
    except gitlab.exceptions.GitlabGetError:
        invalid.append(image_id)

if invalid:
    for image_id in invalid:
        print(
            f"ERROR: Docker image ID {image_id} is not a commit in docker-images/master"
        )
    sys.exit(1)
