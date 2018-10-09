export DISTNAME=`lsb_release -d | sed -r -e 's/Description:[\t]+//' -e 's/[ ][(](.*)//' -e 's/[ ]/_/g'`
sudo zypper ar -f http://packman.inode.at/suse/$DISTNAME/ Packman
sudo zypper refresh

### The codecs stuff
echo "Now for codecs; If asked, choose the option to change vendor to Packman repo"

sudo zypper install \
ffmpeg \
flash-player \
gstreamer-plugins-bad \
gstreamer-plugins-bad-orig-addon \
gstreamer-plugins-base \
gstreamer-plugins-good \
gstreamer-plugins-good-extra \
gstreamer-plugins-libav \
gstreamer-plugins-ugly \
gstreamer-plugins-ugly-orig-addon \
libavcodec56 \
libavcodec57 \
libavcodec58 \
libavdevice56 \
libavdevice57 \
#libavdevice58 \
libavformat56 \
libavformat57 \
libavformat58 \
libx264-152 \
libx265-151 \
x264

# Note: This is a workaround to make Totem and the like
# recognise the changes [https://bugzilla.redhat.com/show_bug.cgi?id=858538#c1]
rm -f ~/.cache/gstreamer-1.0/registry.*

echo "... done..."
