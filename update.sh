#!/bin/bash

dpkg-scanpackages -m . /dev/null > Packages


echo "Origin: ppa.elprofesor.io" > Release
echo "Label: ppa.elprofesor.io" >> Release
echo "Suite: stable" >> Release
echo "Version: 1337" >> Release
echo "SHA256: $(sha256sum Release | awk '{print $1}')" >> Release
echo "Date: $(date -R)" >> Release
echo "Codename: elprofesor" >> Release
echo "Architectures: all" >> Release
echo "Components: main" >> Release
echo "Description: ppa.elprofesor.io" >> Release

rm -rf Release.gpg; gpg  -abs -o - Release > Release.gpg
rm -rf inRelease; gpg --clearsign -o InRelease Release

