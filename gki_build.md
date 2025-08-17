# Android GKI (Generic Kernel Image) — Build Guide

This README walks you through building the **Android GKI kernel** from AOSP’s kernel sources on the `common-android13-5.15` branch, including tagging the kernel version with `-DevAyu` and where to find the build outputs.

---

## ✅ Quickstart (copy–paste)

> One-shot setup + build for Ubuntu/Debian:

```bash
# 1) Packages
sudo apt-get update
sudo apt-get install -y \
  micro repo git-core git curl gcc g++ build-essential bc \
  libssl-dev libncurses5-dev cpio bison flex \
  libelf-dev dwarves lz4 zstd rsync

# 2) Git identity (adjust if needed)
git config --global user.email "ayushkumar274549@gmail.com"
git config --global user.name  "DevAyu-Codes"

# 3) Source checkout
mkdir android-kernel && cd android-kernel
repo init -u https://android.googlesource.com/kernel/manifest -b common-android13-5.15
repo sync -c -j"$(nproc)"

# 4) Optional: append a custom tag to the kernel version string
#    (This sets EXTRAVERSION = -DevAyu in common/Makefile)
sed -i 's/^EXTRAVERSION.*/EXTRAVERSION = -DevAyu/' common/Makefile

# 5) Build (ARM64 GKI)
BUILD_CONFIG=common/build.config.gki.aarch64 build/build.sh
