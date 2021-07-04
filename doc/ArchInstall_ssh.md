ArchInstall

High level overview
from : https://www.youtube.com/watch?v=rUEnS1zj1DM

0.  Download iso
1.  Boot from the .iso (either in VirtualBox or by making a bootable USB)
2.  Partition your disks
3.  Format your disks (ext4 for boot and root)
4.  Mount your disks
5.  pacstrap /mnt base base-devel linux linux-firmware vim
6.  Generate your fstab file genfstab -U /mnt export to /mnt/etc/fstab
7.  Chroot into Arch arch-chroot /mnt

8.  Install grub and network manager pacman -S networkmanager grub
9.  Make network manager run at startup systemctl enable NetworkManager
10. Configure Grub grub-install /dev/sda && grub-mkconfig -o /boot/grub/grub.cfg
11. set password for root user
12. Configure local and timezone

13. exit chroot, unmount, and reboot into your arch environment
14. Enjoy a feeling of superiority and bully people who use Linux.

===============================================================================


# XX. Preparation
https://www.youtube.com/watch?v=315qks3HoFk&list=PLIXhUtjbeUQtsEwCGkSvE4xRX68SokKJS&index=5
*Through ssh (video5:36)*
--------

## 01. Boot from installation media
###    a) check WWW connection
      $ ip addr 
####    aa) if wifi card then connect
        $ wifi-menu
###    b) create a root password to be able to start sshd.service
        $ passwd
###    c) start sshd.service
        $ systemctl start sshd.service
####    cc) verify service status
        $ systemctl status sshd.service
###    d) find ip address of the computer
        $ ip addr
###    e) from other computer ssh into the instalation computer(my local at install time was 192.168.0.3)
        $ ssh root@192.168.0.3 # 192.168.0.3
   *NOTE: if connection error - check ~/.ssh/known_hosts file and delete old ip entry*
   *NOTE: ssh finished - logged as root on instalation computer*
--------

## 02. (NON-EFI) Partition (usually I use root home swap(swap not always) partitions)
   *NOTE: EFI section is at the end of this file*
###    a) list the available partitions
        $ fdisk -l
###    b) root and home is recommended to format using EXT4 file system
        $ mkfs.ext4 /dev/sdxx   # sdxx is drive name i.e sda1, sda2 ... from fdisk -l or lsblk
###    c)  setup swap
        $ free -m  # check sys memory
        $ mkswap /dev/sdxx # sdxx is drive for swap
        $ swapon /dev/sdxx # activate swap
        $ free -m  # check swap and sys memory
## 03. Mount created partitions (mine on current install are: root - sda1 and home -sda5 no swap)
        $ mount /dev/sda1 /mnt
        $ mkdir /mnt/home
        $ mount /dev/sda5 /mnt/home
###    d) check mounting points
        $ lsblk   # or
        $ gdisk -l /dev/sda
## 04. Start the installation process
###    a)  time setup
        $ timedatectl set-ntp true
###    b) install base system
        $ pacstrap -i /mnt base base-devel linux linux-firmware linux-headers vim
###    c) generate the fstab file
        $ genfstab -U -p /mnt >> /mnt/etc/fstab
####    cc) check
        $ cat /mnt/etc/fstab
## 05. Chroot using the BASH environment
        $ arch-chroot /mnt /bin/bash
###    a) set the localization
        $ vim /etc/locale.gen
###    b) generate the locale
        $ locale-gen
###    c) set the time zone
        $ ln -sf /usr/share/zoneinfo/Europe/Chisinau /etc/localtime
###    d) set the time on your PC
        $ hwclock --systohc --utc
## 06. Set hostname - let it be smarch
        $ echo smarch > /etc/hostname
###    a) add this name to the hosts file
        $ echo '127.0.01    localhost' >> /etc/hosts
        $ echo '::1 localhost' >> /etc/hosts
        $ echo '127.0.1.1 smarch.localdomain smarch' >> /etc/hosts
###    b)check
        $ cat /etc/hosts
## 07. Mirrorlist - install and run reflector to rank mirrorlist
###    a)  $ pacman -S reflector
          sudo pacman -S reflector
          sudo cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.backup
          sudo reflector --verbose -l 200 -p http --sort rate --save /etc/pacman.d/mirrorlist
## 08. Network manager -  install-enable it
        $ pacman -S networkmanager
        $ systemctl enable NetworkManager
## 09. Set (reset at the chrooted sys) root password
        $ passwd
## 10. Create a USER account with root privileges and set its password
        $ useradd -m -g users -G wheel,lp,sys,network,storage,power -s /bin/bash username
        $ passwd username
## 11. Install vim to enable username privileges
        $ pacman -S openssh bash-completion
        $ EDITOR=vim visudo # uncomment the line # %wheel ALL=(ALL) ALL
###    a) exit the system and login as username
        $ exit
###    b) connect to wifi after reboot with nmtui(from networkmanager package)
        $ nmtui
        $ systemctl status sshd  # if down then enable and start
        $ ssh username@192.168.0.3
## 12. install XORG and network applet
###    a) utilities
        $ pacman -S gvfs ntfs-3g network-manager-applet dialog wireless_tools wpa_supplicant mtools
###    b) X11 graphics
        $ pacman -S xorg-server
## 13. display manager gdm (I use gdm 'cause is 1 packcge and doesn't need extra config steps)
        $ pacman -S gdm
        $ sudo systemctl enable gdm.service
## 14. install audio
        $ pacman -S pulseaudio pavucontrol
## 15. user dirs maker install
        $ pacman -S xdg-user-dirs
## 16. Enable multilib (remove trailing hash #)
        # vim /etc/pacman.conf
         [multilib]
         Include=/etc/pacman.d/mirrorlist
        # pacman -Syu
## 17.     $ exit   # exit ssh session
## 18. Unmount system before reboot
        # umount --all
## 19. reboot the installed system


##########################################3
##########################################3
# EFI system install step 02:
##########################################3

## 02. (EFI) as example partitions are sda1 - boot, sda2 - swap, sda3 - root, sda4 -home
###    a) list partitions
        $ fdisk -l
###    b) set swap
        # free -m
        # mkswap /dev/sda2
        # swapon /dev/sda2
        # free -m
###    c) format partitions  (EFI boot must be fat32 formatted)
        # mkfs.fat -F 32 /dev/sda1
        # mkfs.ext4 /dev/sda3
        # mkfs.ext4 /dev/sda4
## 03. mount sda3 - root
        # mount dev/sda3 /mnt
## 04. install essential packages
        # pacstrap -i /mnt base base-devel linux linux-firmware linux-headers
## 05. mount remaining partitions
        # mkdir /mnt/home
        # mount /dev/sda4 /mnt/home
        # mkdir /mnt/boot/efi
        # mount /dev/sda1 /mnt/boot/efi
## 06. generate fstab
        # genfstab -U /mnt >> /mnt/etc/fstab
        # cat /mnt/etc/fstab
## 07. chroot
        # arch-chroot /mnt
## 08. set timezone


##########################################3
 *Install-check grub if there is no other installed loader*
## ii) install grub
        # grub-install --target=x86_64-efi --bootloader-id=GRUB
        # grub-mkconfig -o /boot/grub/grub.cfg


##########################################3
##########################################3
##########################################3
# 
# THATs ALL for BASE Arch istall
# 
##########################################3
##########################################3
##########################################3

#    Install XFCE
        $ pacman -S xfce4 xfce4-goodies
        $ exit   # exit ssh session
##########################################3

