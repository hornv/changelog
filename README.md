# Changelog docker action

This action create output from all PR (title and url) that was merged since previous tag.

## Inputs

### No inputs required

## Outputs

## `changelog`

multistring result

## Example usage

uses: actions/changelog@v1

## usefull info
to fix GV_VERSION arg for Dockerfile is used. so if it is nessecery just change that arg.

v1 use hardcorder url fo GH_CLI 1.12.1
v2 use variable for GV_CLI (default is 1.12.1)