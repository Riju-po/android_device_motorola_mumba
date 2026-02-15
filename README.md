# Device Tree for Motorola Moto G57 (mumba)

## PreBuilt Kernel
## How to Build
Extract Proprietary Blobs: Required to get the binary drivers (Audio, Sensors, Wifi, etc.) from your firmware dump.

bash
```
cd device/motorola/mumba
./extract-files.sh
```
# Sync
repo sync

# Build
```
source build/envsetup.sh
lunch lineage_mumba-userdebug
mka bacon
```
