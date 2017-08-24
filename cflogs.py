#!/usr/bin/env python

from yaml import load
from sys import argv
import subprocess


recentFlag = False


def print_output(messages):
    for message in messages:
        print message


def read_manifest(parameter, space):
    manifest_filename = 'manifest-' + space
    try:
        with open(manifest_filename + '.yml', 'r') as content_file:
            yaml_file = content_file.read()

        manifest_config = load(yaml_file)['applications']
        return manifest_config[0][parameter]
    except IOError:
        print_output(["Manifest.yml file does not exist in current directory.",
                           "Please move to valid directory and try again.", "Exiting Script..."])
        exit(1)


def shell(shell_command):
    response = subprocess.call(shell_command, shell=True)
    return response


def validate_app_exists_in_org(appName):
    result = shell("cf app {0}".format(appName))
    if result == 1:
        return False
    else:
        return True


def find_correct_org(appName, space):
    shell("cf target -o logisticsIT -s {0}".format(space))
    print_output(["Checking LogisticsIT"])
    if validate_app_exists_in_org(appName):
        return True
    else:
        print_output(["Checking LogisticsIT-saw"])
        shell("cf target -o logisticsIT-saw -s {0}".format(space))
    if validate_app_exists_in_org(appName):
        return True
    else:
        print_output(["Checking LogisticsIT-drill"])
        shell("cf target -o logisticsIT-drill -s {0}".format(space))
    if validate_app_exists_in_org(appName):
        return True
    else:
        print_output(["Checking LogisticsIT-hammer"])
        shell("cf target -o logisticsIT-hammer -s {0}".format(space))
    if validate_app_exists_in_org(appName):
        return True
    return False


def main():
    appName = read_manifest("name", "uat")
    print(appName)

    if validate_app_exists_in_org(appName):
        print_output(["App Exists in Org"])
    else:
        print_output(["App Does not in Org"])
        if find_correct_org(appName, "uat"):
            print_output(["App Found"])
        else:
            print_output(["App Does not exist in integration"])
            exit(1)
    print(len(argv))
    if len(argv) > 1:
        if argv[1] == '-r':
            shell("cf logs " + appName + " --recent")
    else:
        print_output(["here"])
        shell("cf logs " + appName)

main()

