#!/system/bin/sh
if ! applypatch --check EMMC:/dev/block/bootdevice/by-name/recovery:100663296:e918d592a20188ef704a73b6b3828509edbff5f9; then
  applypatch  \
          --patch /vendor/recovery-from-boot.p \
          --source EMMC:/dev/block/bootdevice/by-name/boot:67108864:253ddc7ddeae9e2be804506f30088b99a9e5d05c \
          --target EMMC:/dev/block/bootdevice/by-name/recovery:100663296:e918d592a20188ef704a73b6b3828509edbff5f9 && \
      log -t recovery "Installing new oppo recovery image: succeeded" && \
      setprop ro.recovery.updated true || \
      log -t recovery "Installing new oppo recovery image: failed" && \
      setprop ro.recovery.updated false
else
  log -t recovery "Recovery image already installed"
  setprop ro.recovery.updated true
fi
