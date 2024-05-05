#!/bin/bash

rm -rf Packages Packages.gz Release InRelease Release.gpg

dpkg-scanpackages --multiversion . > Packages
gzip -k -f Packages

echo "Origin: ppa.elprofesor.io" > Release
echo "Label: ppa.elprofesor.io" >> Release
echo "Suite: stable" >> Release
echo "Version: 1.0" >> Release
echo "Codename: stable" >> Release
echo "Architectures: all" >> Release
echo "Components: main" >> Release
echo "Description: ppa.elprofesor.io" >> Release
echo "Date: $(date -u +'%a, %d %b %Y %H:%M:%S %Z')" >> Release

echo "MD5Sum:" >> Release
echo " $(md5sum Packages | awk '{print $1}') $(wc -c < Packages) Packages" >> Release
echo " $(md5sum Packages.gz | awk '{print $1}') $(wc -c < Packages.gz) Packages.gz" >> Release
echo " $(md5sum Release | awk '{print $1}') $(wc -c < Release) Release" >> Release

echo "SHA1:" >> Release
echo " $(sha1sum Packages | awk '{print $1}') $(wc -c < Packages) Packages" >> Release
echo " $(sha1sum Packages.gz | awk '{print $1}') $(wc -c < Packages.gz) Packages.gz" >> Release
echo " $(sha1sum Release | awk '{print $1}') $(wc -c < Release) Release" >> Release

echo "SHA256:" >> Release
echo " $(sha256sum Packages | awk '{print $1}') $(wc -c < Packages) Packages" >> Release
echo " $(sha256sum Packages.gz | awk '{print $1}') $(wc -c < Packages.gz) Packages.gz" >> Release
echo " $(sha256sum Release | awk '{print $1}') $(wc -c < Release) Release" >> Release

echo "SHA512:" >> Release
echo " $(sha512sum Packages | awk '{print $1}') $(wc -c < Packages) Packages" >> Release
echo " $(sha512sum Packages.gz | awk '{print $1}') $(wc -c < Packages.gz) Packages.gz" >> Release
echo " $(sha512sum Release | awk '{print $1}') $(wc -c < Release) Release" >> Release


gpg  -abs -o - Release > Release.gpg
gpg --clearsign -o - Release > InRelease

