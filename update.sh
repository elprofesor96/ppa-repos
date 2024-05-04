#!/bin/bash

rm -rf Packages Packages.gz Release InRelease Release.gpg

dpkg-scanpackages --multiversion . > Packages
gzip -k -f Packages

echo "Origin: ppa.elprofesor.io" > Release
echo "Label: ppa.elprofesor.io" >> Release
echo "Suite: stable" >> Release
echo "Version: 1" >> Release
echo "SHA256: $(sha256sum Release | awk '{print $1}')" >> Release
echo "SHA1: $(sha1sum Packages | awk '{print $1}')" >> Release 
echo "MD5: $(md5sum Packages | awk '{print $1}')" >> Release
echo "Date: $(date -R)" >> Release
echo "Codename: stable" >> Release
echo "Architectures: all" >> Release
echo "Components: main" >> Release
echo "Description: ppa.elprofesor.io" >> Release

gpg  -abs -o - Release > Release.gpg
gpg --clearsign -o - Release > InRelease

