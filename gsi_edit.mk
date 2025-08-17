# 📦 Editing Android System Images (Loop Mount Method)

This guide explains how to mount, edit, and repack an Android `system.img` on Linux using loop devices. It includes modifying `build.prop` and replacing overlays if required.

---

## ✅ Install Required Packages

```bash
sudo apt update
sudo apt install -y libsparse-utils e2fsprogs erofs-utils
sudo apt install -y android-sdk-libsparse-utils
sudo apt install -y micro
```

## 📂 Mounting the System Image

```bash
mkdir system_mount
sudo mount -o loop,rw system.img system_mount/
```

## 🛠️ Editing build.prop

```bash
sudo micro system_mount/system/build.prop
sudo micro system_mount/system/product/etc/build.prop
sudo micro system_mount/system/system_ext/etc/build.prop
```

## 📑 Replacing Overlay APK (If Needed)
### Copy the overlay APK out of the image:
```bash
sudo cp system_mount/system/product/overlay/Settings__romname_gsi__auto_generated_rro_product.apk .
```

### Replace it back after modification:
```bash
sudo cp Settings__evox_gsi__auto_generated_rro_product.apk system_mount/system/product/overlay/Settings__evox_gsi__auto_generated_rro_product.apk
```

## ⏏️ Unmounting the System Image

```bash
sudo umount system_mount
```
