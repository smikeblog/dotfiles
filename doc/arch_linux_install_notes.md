##---- Arch Linux Base Install Setup ----##
## ver 0.12 ##
# Date 12-12-18 #

## Internet Setup ##
dhcpcd (Desktop only)
wifi-menu (Laptop or Netbook)

## Internet Test ##
ping -c 3 1.1.1.1

## Disk Check ##
lsblk
lsblk -f

## Partition ##
cfdisk

## Filesystem Setup ##
mkfs.ext4 /dev/sda#(#letter drive)
mount /dev/sda2 /mnt

## pre-mirror update ##
vi /etc/pacman.d/mirrorlist
(remove other countries until you reach United States)

## Mirror Update ##
pacman -Syy (update mirror)
pacman -S reflector
reflector --verbose --country 'United States' -f 20 -l 20 -p http --sort rate 
--save /etc/pacman.d/mirrorlist

## Pacman update ##
pacman -Syy (update mirror again)

## Install Base Packages ##
pacstrap -i /mnt base base-devel

## Update Pacman Keys ##
pacman-key --init
pacman-key --populate archlinux

## fstab Setup ##
genfstab -U /mnt >> /mnt/etc/fstab
vi /mnt/etc/fstab
(add "discard" at the end and then save)

## Change Root ##
arch-chroot /mnt /bin/bash

## Locale Setup ##
vi /etc/locale.gen
locale-gen
vi /etc/locale.conf
(add in the file: LANG=en_US.UTF-8)

## Time Setup ##
tzselect
ln -sf /usr/share/zoneinfo/American/Chicago /etc/localtime
pacman -S ntp
ntpdate -s pool.ntp.org
date
hwclock --systohc (--localtime if windows install) (--utc if linux is only install)

## Initramfs ##
mkinitcpio -p linux

## Bootloader ##
pacman -S grub os-prober
grub-install --recheck /dev/sda (or sdb if is in an other drive)
grub-mkconfig -o /boot/grub/grub.cfg

## Hostname Setup ##
vi /etc/hostname
(add a hostname in the file)

## Wired Network Setup ##
systemctl enable dhcpcd.service

## Wireless Network Setup ##
pacman -S iw wpa_supplicant dialog
(after reboot, run wifi-menu in root)

## Password Setup ##
passwd

## Exit of Chroot ##
exit

## Umount ##
umount -R /mnt

## Finish ##
reboot

##---- Arch Linux Openbox Install Setup ----##
## ver 0.6 ##
# Date 12-31-18 #

## Wifi Setup ##
wifi-menu
(select router and enter password)

## Test Internet ##
ping -c 3 1.1.1.1

## Add User ##
useradd -m -G wheel -s /bin/bash georgeb
passwd georgeb (user password setup)

## Sudoers Setup ##
vi /etc/sudoers
(add after root username "georgeb ALL=(ALL) ALL",
remove hashmark after wheel ALL=(ALL) NOPASSWD: ALL)

## Exit Root ##
exit

## Login into User ##
georgeb
(and password)

## vi Config ##
sudo vi /etc/virc

## Update Mirrors ##
sudo pacman -Syy

## Config Pacman Config ##
sudo vi /etc/pacman.conf
(remove hashmark after color, multilib)

## Update Mirrors Again ##
sudo pacman -Syy

## Install Git ##
sudo pacman -S git subversion

## Yay Install (AUR) Helper ##
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd ..

## Install Xorg ##
sudo pacman -S xorg (nvidia nvidia-libgl lib32-nvidia-libgl if desktop),
(xf86-video-intel mesa-libgl lib32-mesa-libgl if on netbook),
(virtualbox-guest-ulits and pick virtualbox-guest-modules-arch 
if virtualbox) xorg-drivers xorg-xinit xorg-twm xorg-xclock xterm
sudo systemctl enable vboxservice
sudo systemctl start vboxservice
startx (to test)

## ALSA Pulseaudio ##
sudo pacman -S alsa-utils alsa-plugins alsa-oss pulseaudio
pulseaudio-alsa pavucontrol lib32-libpulse lib32-alsa-plugins
alsamixer
(unmute all channels)
speaker-test -c 2

## Other Misc Programs ##
sudo pacman -S mlocate ttf-dejavu ttf-liberation ttf-droid dmidecode 
hddtemp lm_sensors mesa-demos net-tools

## inxi install ##
yay -S inxi

## Install Openbox Apps ##
sudo pacman -S openbox python2-xdg obconf obmenu openbox-themes dmenu 
thunar geany glances lxappearance lxappearance-obconf lxinput lxrandr 
nitrogen rofi firefox polkit-gnome networkmanager network-manager-applet 
xdg-user-dirs archlinux-wallpaper htop lxdm bash-completion numix-gtk-theme 
arc-gtk-theme papirus-icon-theme volumeicon gsimplecal gufw 
xfce4-power-manager ranger oblogout dunst powerline powerline-fonts 
tint2 viewnior plank zsh zsh-theme-powerlevel9k zsh-completions jgmenu 
lxmenu-data

## Openbox Config ##
cp -R /etc/xdg/openbox ~/.config/

## Yay Additional Apps ##
yay -S libgksu gksu obkey ob-autostart obapps obmenu-generator gtk2-perl

## File Management and Commpresion ##
sudo pacman -S gvfs gvfs-mtp gvfs-gphoto2 gvfs-smb sshfs ntfs-3g 
tumbler poppler-glib ffmpegthumbnailer freetype2(if needed) 
raw-thumbnailer evince zip unzip unrar p7zip xarchiver

## Printer cups install ##
sudo pacman -S cups ghostscript gsfonts cups-pdf foomatic-db-engine 
foomatic-db foomatic-db-nonfree hplip system-config-printer
enable service for cups: sudo systemctl enable org.cups.cupsd.service

## Yay Themes and Utilities ##
yay -S xcursor-breeze pamac-aur compton comptray compton-conf-git 
nvidia-setting solaar oranchelo-icon-theme

## Systemd Setup ##
sudo systemctl enable NetworkManager
sudo systemctl enable lxdm

## Edit Lxdm Config ##
sudo vi /etc/lxdm/lxdm.conf
(remove hashmark in autologin and add username,
remove hashmark in numlock and put 1)

## Autostart ##
tint2 &
volumeicon &
nm-applet &
compton -b &
comptray &
pamac-tray &
nitrogen --restore &
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
plank &
