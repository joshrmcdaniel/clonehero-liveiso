# clonehero-liveiso

Create a Debiam live ISO to boot directly into clone hero. The intended purpose is to mount a network storage device during boot and store relevant clone hero data there. The ISO is stateless.

## Usage

Run this as root, and ensure `live-boot` is installed on your system.
```shell
git clone https://github.com/joshrmcdaniel/clonehero-liveiso.git
cd clonehero-liveiso

# If not executable
chmod +x build.sh

sudo su
./build.sh
```

## TODO:
- proper usage
- implement NAS mounting
- fix x11