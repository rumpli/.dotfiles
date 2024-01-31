# dotfiles

Dotfile Setup for Debian in WSL.

## Setup

Update APT.

```bash
sudo apt update && sudo apt upgrade -y
sudo apt install git
```

Switch to ``root`` and install nodejs.

```bash
sudo su -
curl -fsSL https://deb.nodesource.com/setup_20.x | bash - &&\
apt-get install -y nodejs
exit
```

Switch back to user and run install script.

```bash
git clone https://github.com/skmag9/.dotfiles ~/.dotfiles
cd .dotfiles
./init.sh
# Restart Shell
```

## Current TODOs

- [ ] Add Font Install to docker part in install script
- [ ] Add Install Dependencies to successfully install LSPs
- [ ] Add NeoTree Toggle map to show buffers
- [ ] Add Maps to operate buffers (open, close, etc.)

## Future Plans

- [ ] Writing to a log with the status of the script
- [ ] Make more interactive install with possibilities to chose specific things
- [ ] Finish Config Backup Function
- [ ] Remove need to include two parameters because of how paths are constructed
- [ ] Make ``backup_config()`` check the amount of arguments as failsafe
- [ ] Refactor ``backup_config()`` to accept multiple paths and backup all of them 
- [ ] Change NTP so it doesn't Require root
