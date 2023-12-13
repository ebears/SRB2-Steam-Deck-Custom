#!/bin/bash

# placeholders
FLATPAK_APP_NAME="io.github.srb2.rphys"
ZIP_DOWNLOAD_LINK="https://github.com/ebears/SRB2-Steam-Deck-Custom/raw/main/SRB2-XZPY-V1.3-SD.zip"
ZIP_DOWNLOAD_NAME="SRB2-XZPY-V1.3-SD.zip"
EXTRACTION_LOCATION="$HOME/.var/app/io.github.srb2.rphys/.srb2"

# Install the Flatpak application
echo "Installing $FLATPAK_APP_NAME via Flatpak..."
flatpak install --user $FLATPAK_APP_NAME -y --noninteractive

# Download the zip file
echo "Downloading server custom content and models..."
wget $ZIP_DOWNLOAD_LINK -O $ZIP_DOWNLOAD_NAME

# Check if the extraction directory exists, and create it if necessary
if [ ! -d "$EXTRACTION_LOCATION" ]; then
  echo "Creating directory: $EXTRACTION_LOCATION"
  mkdir -p "$EXTRACTION_LOCATION"
fi

# Extract the zip file to the desired location
echo "Extracting to $EXTRACTION_LOCATION..."
unzip -jo $ZIP_DOWNLOAD_NAME -d $EXTRACTION_LOCATION

# Clean up the downloaded zip file
echo "Cleaning up..."
rm $ZIP_DOWNLOAD_NAME

echo "Downloaded and installed successfully."
