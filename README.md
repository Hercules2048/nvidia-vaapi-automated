# nvidia-vaapi-automated
Automated build script for the experimental Nvidia VAAPI driver.


#########################################################################\
#########################################################################\
THIS SCRIPT ONLY OFFICIALLY SUPPORTS Linux Mint 20.x and Ubuntu 20.04 LTS.
While you can use it on other Ubuntu 20.04 LTS based distros, I have not tested it, so make sure to backup your system before trying the script!

This script entirely automates the installation of all of the tools required to build the vaapi driver, and then compiles it for you. It also removes all traces of the downloaded gits. Make sure to reboot after using this script so your Nvidia driver has the modeset enabled.

Additionally, after rebooting your system and running firefox.sh, you will need to configure these options in about:config : \
media.ffmpeg.vaapi.enabled  true \
media.ffvpx.enabled  false \
media.rdd-vpx.enabled  false \
media.navigator.mediadatadecoder_vpx_enabled true \
gfx.webrender.all  true \
gfx.x11-egl.force-enabled  true \
layers.acceleration.force-enabled  true \
layers.force-active  true \
gfx.canvas.accelerated true

After applying these changes, close firefox nightly and reopen it with firefox.sh . You should have working VP9 and H264 video decoding in firefox now!

#########################################################################\
#########################################################################\
This script makes use of the following tools(and more) : \
https://github.com/freedesktop/mesa-drm \
https://github.com/intel/libva \
https://git.videolan.org/git/ffmpeg/nv-codec-headers.git \
https://github.com/elFarto/nvidia-vaapi-driver
