#!/bin/bash

dpkg-scanpackages -m . /dev/null > Packages

echo "Origin: ppa.elprofesor.io" > Release
echo "Label: ppa.elprofesor.io" >> Release
echo "Suite: stable" >> Release
echo "Version: 1337" >> Release
echo "Codename: elprofesor" >> Release
echo "Architectures: all" >> Release
echo "Components: main" >> Release
echo "Description: ppa.elprofesor.io" >> Release

gpg  -abs -o - Release > Release.gpg


