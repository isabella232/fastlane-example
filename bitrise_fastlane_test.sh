#!/bin/bash

set -v
set -e

THIS_SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

gem install fastlane

# ImageMagick for FrameIt
# brew update && brew install imagemagick

fastlane test_and_snapshot

# move screenshots to the Deploy folder
rm -rf "${BITRISE_DEPLOY_DIR}/screenshots"
mkdir -p "${BITRISE_DEPLOY_DIR}/screenshots"
mv "${THIS_SCRIPT_DIR}/fastlane/screenshots" "${BITRISE_DEPLOY_DIR}/screenshots"
