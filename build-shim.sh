#!/bin/bash 

# Redirect output to log file
rm build.log
exec > >(tee -i build.log)
exec 2>&1

CERT_FILE=matrix42.public.ev.cer
SBAT_FILE=sbat.egosecure.csv

SRC_DIR=shim-15.7

echo ===================================
echo         COPY SHIM 15.7 SOURCES
echo ===================================
wget https://github.com/rhboot/shim/releases/download/15.7/shim-15.7.tar.bz2
tar xjvf shim-15.7.tar.bz2
rm shim-15.7.tar.bz2


echo ======================================================================
echo         COPY CERTIFICATE AND SBAT FILES TO SHIM BUILD DIRECTORY
echo ======================================================================
cp $CERT_FILE $SRC_DIR/ -v
cp $SBAT_FILE $SRC_DIR/data/ -v

cd $SRC_DIR

echo ===================================
echo           APPLY PATCHES
echo ===================================
patch < ../patches/0001-Fix-failed-to-load-image-with-invalid-parameter.patch

echo ===================================
echo     BUILD SHIM-15.7 FROM SOURCES
echo ===================================
export VENDOR_CERT_FILE=$CERT_FILE
export DEFAULT_LOADER="\\\\\\\\esbootmg.efi"
make -j4

cd ..

cp $SRC_DIR/shimx64.efi shimx64.efi-docker -v

echo ===================================
echo         COMPARE SHIM FILES
echo ===================================
echo "shim.efi           - matrix42 binary shim"
echo "shimx64.efi-docker - reproduced shim build binary file"

echo "diff shim.efi shimx64.efi-docker -s"
diff shim.efi shimx64.efi-docker -s

echo "sha256sum shim.efi shimx64.efi-docker"
sha256sum shim.efi shimx64.efi-docker