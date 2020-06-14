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


if [ -f  /etc/rc.d/rc.local_shutdown ]; then
 cat /etc/rc.d/rc.local_shutdown > /etc/rc.d/rc.local_shutdown.new
else 
echo "#!/bin/sh
#
# /etc/rc.d/rc.local_shutdown :  Local system initialization script.  
exec /usr/sbin/nvidia-update " > /etc/rc.d/rc.local_shutdown
echo "#!/bin/sh
#
# /etc/rc.d/rc.local_shutdown :  Local system initialization script.  
exec /usr/sbin/nvidia-update " > /etc/rc.d/rc.local_shutdown.new
fi
LFNVD=$(cat /etc/rc.d/rc.local_shutdown | grep nvidia)
if [ "$LFNVD" = "exec /usr/sbin/nvidia-update" ]; then
  sed -i 's|exec /usr/sbin/nvidia-update||g' /etc/rc.d/rc.local_shutdown.new
  echo exec /usr/sbin/nvidia-update >> /etc/rc.d/rc.local_shutdown.new
  else
  echo exec /usr/sbin/nvidia-update >> /etc/rc.d/rc.local_shutdown.new 
fi

mv /etc/rc.d/rc.local_shutdown  /etc/rc.d/rc.local_shutdown.orig
mv /etc/rc.d/rc.local_shutdown.new /etc/rc.d/rc.local_shutdown
chmod +x /etc/rc.d/rc.local_shutdown
echo you must reboot to install NVIDIA Latest Driver
