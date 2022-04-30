#!/usr/bin/env python3

import os
import sys


projects_path = "/home/dockerm1/compose"


def start_compose(project, arguments):
    if "docker-compose.yml" not in os.listdir(f'{projects_path}/{project}'):
        sys.exit("Missing docker-compose.yml file")

    os.system(f'docker compose -f {projects_path}/{project}/docker-compose.yml {arguments}')


projects = [project for project in os.listdir(projects_path)]

project = sys.argv[1]

if project not in projects:
    sys.exit("Not an existing compose project")

args = " ".join(sys.argv[2:])

start_compose(sys.argv[1], args)