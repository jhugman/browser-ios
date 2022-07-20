#!/bin/bash

# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

# Local modifications/additions can be made in `nimbus-fml-configuration.local.sh`

## Set the channel that is used to generate the Swift code.
## The `CONFIGURATION` to derive the channel used in the feature manifest.
CHANNEL=
case "${CONFIGURATION}" in
    Debug)
        CHANNEL="debug"
        ;;
    Release)
        CHANNEL="release"
        ;;
    *) # The channel must match up with the channels listed in APP_FML_FILE.
        CHANNEL="$CONFIGURATION"
        ;;
esac
export CHANNEL

## Set the name of the Swift module that contains the Nimbus SDK.
## Default: MozillaAppServices
export MOZ_APPSERVICES_MODULE=MozillaAppServices

## Set the list of directories to scan for *.fml.yaml files.
## Default: $PROJECT
# export MODULES=

## Set the directory where the generated files are placed.
## By default this is $MODULE/Generated
# export GENERATED_SRC_DIR=

## Set the root level nimbus.fml.yaml file. This is used to generate the experimenter file for the whole app.
## Default: $SOURCE_ROOT/$PROJECT/nimbus.fml.yaml
export APP_FML_FILE=$SOURCE_ROOT/$PROJECT/Resources/browser.fml.yaml

## Set the list of repo files.
## This gives the FML the branches/tags/locations for the dependencies that may have FML files in them.
## These can be absolute, relative to SOURCE_ROOT, a URL to a JSON/YAML file, or a URL shortcut.
## Default: is empty.
export REPO_FILES=$PROJECT/Resources/app-structure.yaml

## Set the directory where FMLs from other repos will be downloaded.
## Default: $SOURCE_ROOT/build/nimbus/fml-cache
# export CACHE_DIR=

## Set the path for where the experimenter manifest is generated. This can be json or yaml.
## Default: $SOURCE_ROOT/.experimenter.yaml
# export EXPERIMENTER_MANIFEST=

## Set the version of the Application Services' Nimbus FML is downloaded from. This version does includes the 'v'
## By default, this is derived from the Swift Package Manager.
# export AS_VERSION=

## Set the directory of the app-services directory. This is useful for local development of `nimbus-fml`.
## By default, this is empty, and a pre-built version of `nimbus-fml` will downloaded.
# export MOZ_APPSERVICES_LOCAL=
