#!/bin/sh
sudo add-apt-repository ppa:ubuntu-mozilla-daily/ppa -y
sudo apt-get install libgstreamer1.0-dev libgstreamer-plugins-base1.0-dev libgstreamer-plugins-bad1.0-dev gstreamer1.0-plugins-base gstreamer1.0-plugins-good gstreamer1.0-plugins-bad gstreamer1.0-plugins-ugly gstreamer1.0-libav gstreamer1.0-doc gstreamer1.0-tools gstreamer1.0-x gstreamer1.0-alsa gstreamer1.0-gl gstreamer1.0-gtk3 gstreamer1.0-qt5 gstreamer1.0-pulseaudio libpciaccess-dev build-essential git firefox-trunk python3 -y
pip3 install meson
pip3 install ninja
git clone https://github.com/freedesktop/mesa-drm
git clone https://github.com/intel/libva
git clone https://git.videolan.org/git/ffmpeg/nv-codec-headers.git
git clone https://github.com/elFarto/nvidia-vaapi-driver
cd mesa-drm
meson builddir/
ninja -C builddir/ install
cd ..
cd libva
sh autogen.sh
cd ..
cd nv-codec-headers
sudo make
sudo make install
cd ..
cd nvidia-vaapi-driver
meson setup build
meson install -C build
cd ..
echo "options nvidia-drm modeset=1" | sudo tee /etc/modprobe.d/nvidia.conf
echo "#!/bin/sh
export LIBVA_DRIVER_NAME=nvidia
export MOZ_DISABLE_RDD_SANDBOX=1
firefox-trunk -MOZ_WEBRENDER=1 -MOZ_X11_EGL=1" | sudo tee firefox.sh
chmod +777 firefox.sh
rm -rf mesa-drm
rm -rf libva
rm -rf nv-codec-headers
rm -rf nvidia-vaapi-driver
