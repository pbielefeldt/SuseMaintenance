export DISTNAME=`lsb_release -d | sed -r -e 's/Description:[\t]+//' -e 's/[ ][(](.*)//' -e 's/[ ]/_/g'`
sudo zypper ar -f http://packman.inode.at/suse/$DISTNAME/ Packman

### The codecs stuff
echo "Now for codecs; If asked, choose the option to change vendor to Packman repo"

sudo zypper install \
ffmpeg \
flash-player \
gstreamer-0_10 \
gstreamer-0_10-libnice \
gstreamer-plugins-bad \
gstreamer-0_10-plugins-bad \
gstreamer-plugins-bad-orig-addon \
gstreamer-0_10-plugins-bad-orig-addon \
gstreamer-plugins-base \
gstreamer-0_10-plugins-base \
gstreamer-0_10-plugin-esd \
gstreamer-0_10-plugins-ffmpeg \
gstreamer-plugins-good \
gstreamer-0_10-plugins-good \
gstreamer-plugins-good-extra \
gstreamer-plugins-libav \
gstreamer-plugins-ugly \
gstreamer-0_10-plugins-ugly \
gstreamer-plugins-ugly-orig-addon \
gstreamer-0_10-plugins-ugly-orig-addon \
x264

# Note: This is a workaround to make Totem and the like
# recognise the changes [https://bugzilla.redhat.com/show_bug.cgi?id=858538#c1]
rm -f ~/.cache/gstreamer-1.0/registry.*

echo "... done..."
