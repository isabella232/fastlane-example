#!/bin/bash

set -v
set -e

THIS_SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

#
# --- Setup
STARTTIME=$(date +%s)

gem install fastlane

# ImageMagick for FrameIt
# brew update && brew install imagemagick

ENDTIME=$(date +%s)
echo
echo " (i) Setup took $(($ENDTIME - $STARTTIME)) seconds to complete"
echo


#
# --- Fastlane

fastlane test_and_snapshot


#
# --- Move screenshots to the Deploy folder
rm -rf "${BITRISE_DEPLOY_DIR}/screenshots"
mkdir -p "${BITRISE_DEPLOY_DIR}/screenshots"
mv "${THIS_SCRIPT_DIR}/fastlane/screenshots" "${BITRISE_DEPLOY_DIR}/screenshots"
