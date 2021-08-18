# ubuntu-dev-environment
**Creating ubuntu developer environment, with all programs I use (you can fork and use as well).**

*I don't like to use snap packs because I feel lower performance, so I just use apt and .deb methods, feel free to fork and change/add stuff if you want.*

# Index
- [How to use](#how-to-use)
- Downloading the script
  - [Just the script](#saving-only-the-script)
  - [Cloning the repository](#cloning-the-repository)
- [Gnome shell extensions](#gnome-shell-extensions)
- [Known issues](#known-issues)

---

## How to use
first, in your system, while its in beta: go to `Software and Updates` and change the server to primary server, not your country server

---
## Now you can choose one way

### Saving only the script
In your recently formatted ubuntu, go to the script in raw page:
[just click here](https://raw.githubusercontent.com/hfabio/ubuntu-dev-environment/master/ubuntu-dev-environment.sh)
Run directly
```bash
  wget -qO- https://raw.githubusercontent.com/hfabio/ubuntu-dev-environment/master/ubuntu-dev-environment.sh | bash
```
Or paste this url:
```bash
  https://raw.githubusercontent.com/hfabio/ubuntu-dev-environment/master/ubuntu-dev-environment.sh
```
or just download with wget:
```bash
wget https://raw.githubusercontent.com/hfabio/ubuntu-dev-environment/master/ubuntu-dev-environment.sh -O ubuntu-dev-environment.sh
```

Save the script whatever you want

Then give execution permission:
```bash
sudo chmod -x ubuntu-dev-environment.sh
```
  or
```bash
sudo chmod 775 ubuntu-dev-environment.sh
```

Now just execute the script as SU
```
sudo ./ubuntu-dev-environment.sh
```


### Cloning the repository
Then clone this repository
```bash
  git clone https://github.com/hfabio/ubuntu-dev-environment.git
```
go to the folder

```bash
cd ubuntu-dev-environment/
```
Then give execution permission:
```bash
sudo chmod -x ubuntu-dev-environment.sh
```
  or
```bash
sudo chmod 775 ubuntu-dev-environment.sh
```

Now just execute the script as SU
```bash
sudo ./ubuntu-dev-environment.sh
```

---
# Gnome shell extensions

- [TopIcons Plus](https://extensions.gnome.org/extension/1031/topicons/) - Add icons to tray
- [Places Status Indicator](https://extensions.gnome.org/extension/8/places-status-indicator/) - Add place folders to gnome shell
- [Removable Drive Menu](https://extensions.gnome.org/extension/7/removable-drive-menu/) - add handler for usb drivers
- [Clipboard indicator](https://extensions.gnome.org/extension/779/clipboard-indicator/)
- [ToDo txt](https://extensions.gnome.org/extension/570/todotxt/) - Add a to-do list
- [Sound Input & Output Device Chooser](https://extensions.gnome.org/extension/906/sound-output-device-chooser/) - not necessary anymore, but link still here
- [Status Area Horizontal Spacing](https://extensions.gnome.org/extension/355/status-area-horizontal-spacing/) - Reduce the horizontal spacing between icons in the top-right status area
- [SimpleTray](https://extensions.gnome.org/extension/1483/simpletray/) - Integrate the wine system tray to the gnome shell
---
# Known issues

### oh-my-zsh
Unfortunely we know the automatic oh-my-zsh instalation isn't working properly fine. (I'm trying to use my [Viniciusalopes/zsh-magic-install](https://github.com/Viniciusalopes/zsh-magic-install) fork removing the OS verification)
I hope some updates in this part soon.

**This installation part still inside the script by the way.**

### spotify and Insync
Even installing these packages via .deb they add PPAs which are not working, and it make the OS update got broken.

**These was removed from the script to avoid updates issues.**

### Mysql server 5.7 version
The mysql 5.7 packages wasn't found in ubuntu repositories, I think it's because wasn't populated all packages to the current OS version with the 18.04 version yet.
But the .deb can be downloaded [right here](https://dev.mysql.com/downloads/mysql/5.7.html). I just don't know if it's worth to implement right now.
