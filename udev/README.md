
### Configure the udev rule (Optional for FPGA export)
In order to be able to export your design on physical hardware, copy `60-openocd.rules` udev rule to `/etc/udev/rules.d`

Note: might need to have sudo rights.

```bash
sudo cp 60-openocd.rules /etc/udev/rules.d
```

Then either restart your machine, or apply changes this way:

```bash
sudo udevadm control --reload
sudo udevadm trigger
```