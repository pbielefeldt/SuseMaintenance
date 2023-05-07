#!/usr/bin/sh

### Before we start, update the system:
zypper ref
zypper lu
zypper up -y

### We need to know how the target distribution is named:
export DISTNAME=`lsb_release -d | sed -r -e 's/Description:[\t]+//' -e 's/[ ][(](.*)//' -e 's/[ ]/_/g'`
# Note: Can be found in /etc/os-release

### INFO
echo "adding several repositories"
echo "Please make sure the distname is correct. Automatically assumed distname is:"
echo $DISTNAME

### Addings the desired repositories (make sure the version of your release fits)
zypper ar -f -cp  84 http://codecs.opensuse.org/openh264/openSUSE_Leap "Open h264"

zypper ar -f -cp 115 http://download.opensuse.org/repositories/science/$DISTNAME/ "Science"
zypper ar -f -cp 116 http://download.opensuse.org/repositories/graphics/$DISTNAME/ "Graphics"
zypper ar -f -cp 117 http://download.opensuse.org/repositories/games/$DISTNAME/ "Games"

zypper ar -f -cp 124 https://download.opensuse.org/repositories/Application:/Geo:/OpenCPN/15.4/ "openCPN"
zypper ar -f -cp 135 https://download.owncloud.com/desktop/ownCloud/stable/latest/linux/$DISTNAME/ "OwnCloud"
rpm --import https://download.owncloud.com/desktop/ownCloud/stable/latest/linux/$DISTNAME/repodata/repomd.xml.key
zypper ar -f -cp 136 https://mega.nz/linux/repo/$DISTNAME/ "MegaSync"
rpm --import https://mega.nz/linux/repo/$DISTNAME/repodata/repomd.xml.key

echo "Repos added. Now for refreshing the system... In most cases you will 'always accept' keys."
zypper refresh

### Install software I like:
zypper install \
chromium \
clisp \
fetchmsttfonts \
git gitg \
gnome-builder \
gnome-logs \
go go-doc \
gummi \
epiphany gnome-shell-search-provider-epiphany \
evince-plugin-djvudocument \
htop \
intel-gpu-tools \
iotop \
ipe \
julia julia-examples \
latexila \
texlive-scheme-basic \
texlive-animate texlive-appendixnumberbeamer texlive-bbm texlive-bbm-macros texlive-bbold texlive-boxedminipage texlive-cleveref texlive-fontspec texlive-glossaries texlive-glossaries-english texlive-glossaries-german texlive-import texlive-newtx texlive-standalone texlive-todonotes texlive-units texlive-xtab \
texlive-biber \
libgda \
links \
meld \
mlocate \
ncdu \
OpenCPN-5.x-Base OpenCPN-weather_routing_pi \
opi \
owncloud-client \
pandoc \
qt-creator \
root6 root6-devel geant4-vmc geant4-vmc-devel\
rhythmbox \
screenfetch \
sensors \
whois \
xournalpp \
xygrib \
perl-Parse-RecDescent

### These were disabled for now since they aren't officially provided
#feedreader \
#guake \
#gespeaker \

### disabled because unwanted at the moment...
#0ad \
#blender \
#corebird \
#dropbox nautilus-extension-dropbox \
#gnome-session-wayland \
#gnome-nibbles \
#pidgin libpurple-plugin-skypeweb \
#skype4pidgin \
#subversion \
#soundconverter \
#supertuxkart \
#tlp \
#pitivi \
#wxMaxima \
#xmoto \


### Some nice themes
#zypper in gtk3-metatheme-elementary
#zypper in gtk3-metatheme-greybird

echo "... done... "
