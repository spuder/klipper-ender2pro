# Klipper Ender 2 Pro

My clipper configuration for the ender 2 pro


## Hardware

- Ender 2 Pro (Purchased December 2021)
- Creality Silent board v4.2.3

## Features

### BLTOUCH

A BLTouch is installed.

**Warning**: There are 2 ways to install the BLTouch on a Creality silent board. This assumes using a single 5 pin header instead of separate 2 pin and 3 pin headers. If you don't know the difference, see [timestamp 7:24 in this youtube video by teaching tech](https://youtu.be/eF060dBEnfs?t=444)

### Config

Based on the following configs

- [printer-creality-ender3-v2-2020.cfg](https://github.com/Klipper3d/klipper/blob/master/config/printer-creality-ender3-v2-2020.cfg)
- [printer-creality-ender2-2017.cfg](https://github.com/Klipper3d/klipper/blob/master/config/printer-creality-ender2-2017.cfg)


### Setup

The following settings are for a Creality Silent board v4.2.2
```
make menuconfig
# SM32F103
# 28KiB bootloader
# Disable usb for communication
make
# Then copy the .bin file off the raspberry pi and put it on a fresh SD Card.
# The .bin file must be named something unique (and it can't be firmware.bin, or the previous file name)
````

### Resources

- https://www.youtube.com/watch?v=MaUU8stsZPo
- https://www.youtube.com/watch?v=ABsdnkP4iwQ
- 4.2.7 pinout https://all3dp.com/2/klipper-ender-3-v2/
- 4.2.7 pinout https://3dprinting.stackexchange.com/questions/16078/steppers-stuck-with-klipper-but-work-with-marlin
- 4.2.7 klipper config https://github.com/Klipper3d/klipper/pull/3335/files
- Install on Ender 3 V2 https://www.youtube.com/watch?v=gfZ9Lbyh8qU
- Klipper Support https://github.com/spuder/klipper/pull/1/files


## Ansible

klipper config file is located at `/home/pi/klipper_config/printer.cfg`
This repo contains an ansible playbook that will copy the local printer.cfg to the printer and restart the klipper service if it changes. 

To use
1. Modify `inventory` to point at your raspberry pi
2. Run the following ansible commands

```
ansible-playbook --check playbook.yaml
ansible-playbook -i inventory playbook.yaml -c paramiko --ask-pass
```