# DRM Nvidia Script (drm-nvidia.sh)

## Overview

The `drm-nvidia.sh` script is designed to manage the Direct Rendering Manager (DRM) kernel mode
setting for Nvidia graphics cards on Linux systems.

### Why Use This Script?

Using this script simplifies the process of checking, installing, and uninstalling the Nvidia DRM
kernel mode setting. It's particularly useful to new users of the Arch Linux system.

## Prerequisites

- Root or sudo privileges

## Reference

For more information about Nvidia DRM kernel mode setting, visit
the [Arch Linux Wiki](https://wiki.archlinux.org/title/NVIDIA#DRM_kernel_mode_setting).

## Usage Tutorial

### Checking Nvidia DRM Status

To check if Nvidia DRM is enabled:

1. Run the script: `sudo ./drm-nvidia.sh`
2. Choose option `1` from the menu.

### Installing Nvidia DRM

To install Nvidia DRM:

1. Run the script: `sudo ./drm-nvidia.sh`
2. Choose option `2` from the menu.
3. Reboot your system to apply changes.

### Uninstalling Nvidia DRM

To uninstall Nvidia DRM:

1. Run the script: `sudo ./drm-nvidia.sh`
2. Choose option `3` from the menu.
3. Reboot your system to apply changes.
