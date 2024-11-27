#!/usr/bin/sh
export DISTNAME=`lsb_release -d | sed -r -e 's/Description:[\t]+//' -e 's/[ ][(](.*)//' -e 's/[ ]/_/g'`

zypper ar -f -cp 90 https://ftp.gwdg.de/pub/linux/misc/packman/suse/${DISTNAME} Packman
zypper refresh

### The codecs stuff
echo "Now for codecs; If asked, choose the option to change vendor to Packman repo"

zypper install --no-recommends \
ffmpeg \
gstreamer-plugins-good \
gstreamer-plugins-good-extra \
gstreamer-plugins-libav \
gstreamer-plugins-ugly #\
#libx264-152 \
#libx265-151 \
#x264

zypper install gstreamer-1.20-plugin-openh264

# Note: This is a workaround to make Totem and the like
# recognise the changes [https://bugzilla.redhat.com/show_bug.cgi?id=858538#c1]
rm -f ~/.cache/gstreamer-1.0/registry.*

echo "... done..."

echo "install flatpaks ..."

flatpak install -y flathub com.spotify.Client
#flatpak install -y flathub com.discordapp.Discord
flatpak install -y flathub org.gnome.Fractal
#flatpak install -y flathub org.onlyoffice.desktopeditors
#flatpak install -y flathub org.zulip.Zulip
flatpak install -y flathub com.github.qarmin.czkawka
flatpak install -y flathub us.zoom.Zoom
flatpak list

echo "... done... "

juliaup add release~x64
juliaup default release~x64
julia --version
