#!/bin/bash

# Definitions
FLATPAK_APP_DOWNLOAD="https://xyz.xzpy.xyz/Sonic-Robo-Blast-2-Kart-Saturn-Saturn-443905ff-x86_64.flatpak"
FLATPAK_APP_NAME="Sonic-Robo-Blast-2-Kart-Saturn-Saturn-443905ff-x86_64.flatpak"
ZIP_DOWNLOAD_LINK="https://xyz.xzpy.xyz/SRB2Kart-full.zip"
ZIP_DOWNLOAD_NAME="SRB2Kart-full.zip"
ZIP_FOLDER_NAME="SRB2Kart-full"
EXTRACTION_LOCATION="$HOME/.var/app/org.srb2bld.srb2_kart_saturn/.srb2kart/"

# Download Flatpak
echo "Downloading Flatpak..."
wget $FLATPAK_APP_DOWNLOAD -O $FLATPAK_APP_NAME

# Install Flatpak
echo "Installing $FLATPAK_APP_NAME via Flatpak..."
flatpak install --user $FLATPAK_APP_NAME -y --noninteractive

# Download zip file
echo "Downloading custom content and models..."
wget $ZIP_DOWNLOAD_LINK -O $ZIP_DOWNLOAD_NAME

# Check if the extraction directory exists, create it if necessary
echo "Checking if $EXTRACTION_LOCATION exists..."
if [ ! -d "$EXTRACTION_LOCATION" ]; then
  echo "Creating directory: $EXTRACTION_LOCATION"
  mkdir -p "$EXTRACTION_LOCATION"
else
  echo "$EXTRACTION_LOCATION already exists, skipping..."
fi

# Create a temporary directory for extraction
temp_dir=$(mktemp -d)

# Extract the zip file to the temporary directory
echo "Extracting to temporary directory: $temp_dir"
unzip -o $ZIP_DOWNLOAD_NAME -d $temp_dir

# Copy the contents to the desired location
cp -R $temp_dir/$ZIP_FOLDER_NAME/* $EXTRACTION_LOCATION

echo "Cleaning up..."
rm -r $temp_dir # Clean up the temporary directory
rm $ZIP_DOWNLOAD_NAME # Clean up the downloaded zip file

echo "Done"
