#!/bin/bash

RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color

PACKAGES_FOLDER="Packages"

for PACKAGE in $PACKAGES_FOLDER/*; do
    if [ -d "$PACKAGE" ]; then
        PACKAGE_NAME=$(basename "$PACKAGE")

        (cd "$PACKAGE" && swift test)

        if [ $? -eq 0 ]; then
            echo -e "${GREEN}Tests for $PACKAGE_NAME ran successfully.${NC}"
        else
            echo -e "${RED}Tests for $PACKAGE_NAME failed.${NC}"
        fi
    fi
done
