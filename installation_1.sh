### Before we start, update the system:
sudo zypper ref
sudo zypper lu
sudo zypper up -y

### We need to know how the target distribution is named:
export DISTNAME=`lsb_release -d | sed -r -e 's/Description:[\t]+//' -e 's/[ ][(](.*)//' -e 's/[ ]/_/g'`
# Note: Can be found in /etc/os-release

### INFO
echo "adding several repositories"
echo "Please make sure the distname is correct. Automatically assumed distname is:"
echo $DISTNAME

### Addings the desired repositories (make sure the version of your release fits)
zypper ar -f http://download.opensuse.org/repositories/games/$DISTNAME/ "Games"
zypper ar -f http://download.opensuse.org/repositories/graphics/$DISTNAME/ "Graphics"
zypper ar -f http://download.opensuse.org/repositories/science/$DISTNAME/ "Science"
#sudo zypper ar -f http://download.opensuse.org/repositories/Application:/Geo/$DISTNAME/ "Geo"
zypper ar -f http://download.opensuse.org/repositories/Application:/Geo:/OpenCPN/$DISTNAME/ "openCPN/Geo"
zypper ar -f http://download.opensuse.org/repositories/Application:/Geo/$DISTNAME/ "ZYGrib/Geo"
zypper ar -f http://download.opensuse.org/repositories/isv:ownCloud:desktop/$DISTNAME/isv:ownCloud:desktop.repo "isvOwnCloud"
#zypper ar -r https://mega.nz/linux/MEGAsync/$DISTNAME/ "MegaSync"

### Changes to the system are only of continued effect if you trust the keys
echo "Repos added. Now for refreshing the system... In most cases you will 'always accept' keys."
zypper refresh

### Install software I like:
zypper install \
chromium chromium-pepper-flash \
clisp \
corebird \
dropbox nautilus-extension-dropbox \
fetchmsttfonts \
feedreader \
git \
gnome-builder \
gnome-logs \
gummi \
epiphany gnome-shell-search-provider-epiphany \
htop \
iotop \
ipe \
meld \
mlocate \
latexila texlive-units texlive-bbm texlive-bbm-macros texlive-boxedminipage texlive-animate\
libgda \
links \
MPlayer \
owncloud-client \
pandoc \
qt-creator \
root \
rhythmbox \
screenfetch \
sensors \
skype4pidgin \
subversion \
supertuxkart \
tlp \
whois \
wxMaxima \
zygrib \
0ad \
gnome-session-wayland \
#go go-doc \
OpenCPN-4.x \
xmoto \
xournal

### These were disabled for now since they aren't officially provided
#guake \
#gespeaker \

### disabled because unwanted at the moment...
# 0ad \
# blender \
# go go-doc \
# gnome-nibbles \
# OpenCPN-4.x \
# pitivi \
# soundconverter \
# xmoto \

### Some nice themes
#sudo zypper in gtk3-metatheme-elementary
#sudo zypper in gtk3-metatheme-greybird

echo "... done... "
