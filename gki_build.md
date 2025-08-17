# Android GKI (Generic Kernel Image) — Build Guide

This README walks you through building the **Android GKI kernel** from AOSP’s kernel sources on the `common-android13-5.15` branch, including tagging the kernel version with `-DevAyu` and where to find the build outputs.

---

## ✅ Quickstart (copy–paste)

> One-shot setup + build for Ubuntu/Debian:

# 1) Packages
```bash
sudo apt-get update
sudo apt-get install -y \
  micro repo git-core git curl gcc g++ build-essential bc \
  libssl-dev libncurses5-dev cpio bison flex \
  libelf-dev dwarves lz4 zstd rsync
```

# 2) Git identity (adjust if needed)
```bash
git config --global user.email "ayushkumar274549@gmail.com"
git config --global user.name  "DevAyu-Codes"
```

# 3) Source checkout
```bash
mkdir android-kernel && cd android-kernel
repo init -u https://android.googlesource.com/kernel/manifest -b common-android13-5.15
repo sync -c -j"$(nproc)"
```

# 4) Optional: append a custom tag to the kernel version string
#    (This sets EXTRAVERSION = -DevAyu in common/Makefile)
```bash
sed -i 's/^EXTRAVERSION.*/EXTRAVERSION = -DevAyu/' common/Makefile
```

# 5) Build (ARM64 GKI)
```bash
BUILD_CONFIG=common/build.config.gki.aarch64 build/build.sh
```

# 6) Finding boot.img (KL8H supports only LZ4)
```bash
cd android-kernel/out/android13-5.15/dist/
```
