if [ -f /etc/modprobe.d/nvidia-disable-nouveau.conf ]; then
	echo /etc/modprobe.d/nvidia-disable-nouveau.conf found

else
echo blacklist nouveau >> /etc/modprobe.d/nvidia-disable-nouveau.conf
echo options nouveau modeset=0 >> /etc/modprobe.d/nvidia-disable-nouveau.conf
fi
sed -i 's|exec /usr/sbin/nvidia-update||g' /etc/rc.d/rc.local
echo exec /usr/sbin/nvidia-update >> /etc/rc.d/rc.local
chmod +x /etc/rc.d/rc.local
echo you must reboot to install NVIDIA Latest Driver
