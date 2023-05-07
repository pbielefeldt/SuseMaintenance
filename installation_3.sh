#!/usr/bin/sh
export DISTNAME=`lsb_release -d | sed -r -e 's/Description:[\t]+//' -e 's/[ ][(](.*)//' -e 's/[ ]/_/g'`


#sudo zypper ar -f -cp 118 https://dl.jami.net/stable/opensuse-leap_15.4/ "Jami"
sudo zypper ar -f -cp 149 https://download.vscodium.com/rpms/ "VSCodium"
sudo zypper ar -f -cp 150 https://repo.skype.com/rpm/stable/ "Skype"

### Other things to do
# remove the installation medium from active repos:
#     YaST/Repositories/"URL=hd...= -> Delete
# switch off the Grub2 chosing screen:
#     YaST/Bootloader/Bootloader-Options/Timeout -> 0
# Give Snapper sane defaults:
#     In /etc/snapper/configs/root
#     Set NUMBER_LIMIT="6", NUMBER_LIMIT_IMPORTANT="3"
