#!/usr/bin/env python3

import os
import sys


projects_path = "/home/dockerm1/compose"


def start_compose(project, argument):
    if "docker-compose.yml" not in os.listdir(f'{projects_path}/{project}'):
        sys.exit("Missing docker-compose.yml file")

    os.system(f'docker compose -f {projects_path}/{project}/docker-compose.yml {argument}')


projects = [project for project in os.listdir(projects_path)]


if len(sys.argv[1:]) > 3:
    sys.exit("Too many arguments")

if sys.argv[1] not in projects:
    sys.exit("Not an existing compose project")

if  (sys.argv[2] == "up") and (sys.argv[3] == "-d"):
    argument = f'{sys.argv[2]} {sys.argv[3]}'
    start_compose(sys.argv[1], argument)
elif (sys.argv[2] == "down") and (len(sys.argv[1:]) == 2):
    start_compose(sys.argv[1], sys.argv[2])
else:
    sys.exit("Wrong arguments")