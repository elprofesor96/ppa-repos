#!/bin/bash

rm -rf Packages Packages.gz Release InRelease Release.gpg

dpkg-scanpackages --multiversion . > Packages
gzip -k -f Packages

echo "Origin: ppa.elprofesor.io" > Release
echo "Label: ppa.elprofesor.io" >> Release
echo "Suite: stable" >> Release
echo "Version: 1.0" >> Release
echo "MD5Sum: $(md5sum Packages)" >> Release
echo "SHA1: $(sha1sum Packages)" >> Release 
echo "SHA256: $(sha256sum Release)" >> Release
echo "SHA512: $(sha512sum Packages)" >> Release
echo "Date: $(date -R)" >> Release
echo "Codename: stable" >> Release
echo "Architectures: all" >> Release
echo "Components: main" >> Release
echo "Description: ppa.elprofesor.io" >> Release

gpg  -abs -o - Release > Release.gpg
gpg --clearsign -o - Release > InRelease

