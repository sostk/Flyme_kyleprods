#!/system/bin/sh
if [ -f /system/etc/recovery-transform.sh ]; then
  exec sh /system/etc/recovery-transform.sh 8642560 0951d9168d4e8f316ab4a306e492d361ddb9b0e0 6078464 dd5b84b70e422a096fc011c5a8c2c4252ab0c6ad
fi

if ! applypatch -c EMMC:/dev/block/platform/sdhci.1/by-name/RECOVERY:8642560:0951d9168d4e8f316ab4a306e492d361ddb9b0e0; then
  applypatch -b /system/etc/recovery-resource.dat EMMC:/dev/block/platform/sdhci.1/by-name/KERNEL:6078464:dd5b84b70e422a096fc011c5a8c2c4252ab0c6ad EMMC:/dev/block/platform/sdhci.1/by-name/RECOVERY 0951d9168d4e8f316ab4a306e492d361ddb9b0e0 8642560 dd5b84b70e422a096fc011c5a8c2c4252ab0c6ad:/system/recovery-from-boot.p && log -t recovery "Installing new recovery image: succeeded" || log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
