# Backup rc.M to rc.M.orig
FNVD=$(cat /etc/rc.d/rc.M | grep Start-nvidia )
if [ "$FNVD" = "# Start-nvidia setup procedure." ]; then
   echo installing
   rm /etc/rc.d/rc.M.new
else
   mv /etc/rc.d/rc.M  /etc/rc.d/rc.M.orig
   mv /etc/rc.d/rc.M.new /etc/rc.d/rc.M
chmod +x /etc/rc.d/rc.M
fi

if [ -f  /etc/rc.d/rc.nvidia_update ]; then
   mv /etc/rc.d/rc.nvidia_update /etc/rc.d/rc.nvidia_update.orig 
   mv /etc/rc.d/rc.nvidia_update.new /etc/rc.d/rc.nvidia_update
   chmod +x /etc/rc.d/rc.nvidia_update
else
   mv /etc/rc.d/rc.nvidia_update.new /etc/rc.d/rc.nvidia_update
   chmod +x /etc/rc.d/rc.nvidia_update   
 fi
echo reboot your machine to install nvidia drivers
