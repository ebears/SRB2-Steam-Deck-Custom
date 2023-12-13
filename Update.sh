#!/bin/bash

# Definitions
FLATPAK_APP_NAME="io.github.srb2.rphys"
ZIP_DOWNLOAD_LINK="https://github.com/ebears/SRB2-Steam-Deck-Custom/raw/main/SRB2-XZPY-V1.3-SD.zip"
ZIP_DOWNLOAD_NAME="SRB2-XZPY-V1.3-SD.zip"
ZIP_FOLDER_NAME="SRB2-XZPY-V1.3-SD"
EXTRACTION_LOCATION="$HOME/.var/app/io.github.srb2.rphys/.srb2/models"

# Install SRB2rphys Flatpak
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

# Clean up the temporary directory
rm -r $temp_dir

# Clean up the downloaded zip file
echo "Cleaning up..."
rm $ZIP_DOWNLOAD_NAME

echo "Downloaded and installed successfully."
