# Klipper Ender 2 Pro

My clipper configuration for the ender 2 pro


## Hardware

- Ender 2 Pro (Purchased December 2021)
- Creality Silent board v4.2.3

## Features

### BLTOUCH

A BLTouch is installed.

**Warning**: There are 2 ways to install the BLTouch on a Creality silent board. This assumes using a single 5 pin header instead of separate 2 pin and 3 pin headers. If you don't know the difference, see [timestamp 7:24 in this youtube video by teaching tech](https://youtu.be/eF060dBEnfs?t=444)


##3 Fillament runout sensor

The following part plugs directly into the `Pre-srt Port` on creality board 4.2.2 / 4.2.3

![](https://m.media-amazon.com/images/I/6173cXfQq1L._SL1500_.jpg)


![](https://www.th3dstudio.com/wp-content/uploads/2020/11/v427_blurcpu-800x800.jpg)

- Part: https://www.amazon.com/gp/product/B08QJDP36R/ref=ppx_yo_dt_b_search_asin_title?ie=UTF8&psc=1

#### klipper runout sensor config

The following will just work on klipper, assuming you already have a 'pause' and 'resume' macro defined. 

As soon as the fillament runs out, it will pause the print. To resume, click the 'resume' macro in the gui

```
[filament_switch_sensor RunoutSensor]
pause_on_runout: True
switch_pin: !PA4
```

If you wish to override the runout sensor with your own macro, you can specify it like so
```
[filament_switch_sensor RunoutSensor]
pause_on_runout: True
switch_pin: !PA4
runout_gcode: PAUSE
insert_gcode: RESUME
```

### Bed Mesh

![](images/bedmesh1.png)

Run this command to run a bed mesh calibration, then save it for future use


```
BED_MESH_CALIBRATE PROFILE=PEI
SAVE_CONFIG
```

The mesh will then be saved to the printer.cfg. **Be sure to copy it back to this repo or changes will be lost**

Open the printer.cfg in fluidd/mainsail and look for lines that start with:
```
#*# <---------------------- SAVE_CONFIG ---------------------->
#*# DO NOT EDIT THIS BLOCK OR BELOW. The contents are auto-generated.
```

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

- Pinout: https://docs.google.com/spreadsheets/d/1DYhh9fwLnvZzuNvMoBen9Dl68KN-4TWkbO94lJ4iwe4/edit


- https://www.youtube.com/watch?v=MaUU8stsZPo
- https://www.youtube.com/watch?v=ABsdnkP4iwQ
- 4.2.7 pinout https://all3dp.com/2/klipper-ender-3-v2/
- 4.2.7 pinout https://3dprinting.stackexchange.com/questions/16078/steppers-stuck-with-klipper-but-work-with-marlin
- 4.2.7 klipper config https://github.com/Klipper3d/klipper/pull/3335/files
- Install on Ender 3 V2 https://www.youtube.com/watch?v=gfZ9Lbyh8qU
- Klipper Support https://github.com/spuder/klipper/pull/1/files

## Extruder Calibration

- https://3dprintbeginner.com/extruder-calibration-guide/

## Flow Calibration

- https://3dprintbeginner.com/flow-rate-calibration/


## Ansible

klipper config file is located at `/home/pi/klipper_config/printer.cfg`
This repo contains an ansible playbook that will copy the local printer.cfg to the printer and restart the klipper service if it changes. 

To use
1. Modify `inventory` to point at your raspberry pi
2. Run the following ansible commands (Or use the make shortcuts)


```
ansible-playbook --check playbook.yaml
ansible-playbook -i inventory playbook.yaml -c paramiko --ask-pass
```

```
make klipper    # run just the klipper playbook (default)
make moonraker  # run just the moonraker playbook
make webcam     # run just the webcam playbook
make all        # run all playbooks
make            # runs default (in this case klipper)
```