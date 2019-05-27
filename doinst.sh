# need to just add a line to rc.local 
#keep all of the users previous entries
cat /etc/rc.d/rc.local > /etc/rc.d/rc.local.new
# keep from adding double entry for reinstall or upgrades
FNVD=$(cat /etc/rc.d/rc.local.new | grep nvidia)
if [ "$FNVD" = "exec /usr/sbin/nvidia-update" ]; then
sed -i 's|exec /usr/sbin/nvidia-update||g' /etc/rc.d/rc.local.new
echo exec /usr/sbin/nvidia-update >> /etc/rc.d/rc.local.new
else
echo exec /usr/sbin/nvidia-update >> /etc/rc.d/rc.local.new
fi
mv /etc/rc.d/rc.local /etc/rc.d/rc.local.orig
mv /etc/rc.d/rc.local.new /etc/rc.d/rc.local
chmod +x /etc/rc.d/rc.local
echo you must reboot to install NVIDIA Latest Driver
