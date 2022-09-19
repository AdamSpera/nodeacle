#!/bin/sudo bash
echo ""
echo "Welcome to Nodeacle!"
echo "Enter the name of your project folder: (ex. myproject)"
read foldername
echo "Enter the name of your primary javascirpt file: (ex. App.js or Index.js)"
read filename
echo "# Starting configuration..."

# General updates
sudo apt update
sudo apt upgrade

echo "# Finished updating system."
echo "# Starting installing node services..."

# Installing node services
sudo apt install nodejs
sudo apt install npm
sudo apt install iptables-persistant

echo "# Finished installing node services."
echo "# Starting nodeservice configuration..."

# Create nodeservice file
touch nodeserver.service
> nodeserver.service
# cat > nodeserver.service
echo '[Unit]' > nodeserver.service
echo 'Description=Node.js Server' >> nodeserver.service
echo '#Requires=After=mysql.service       # Requires the mysql service to r>' >> nodeserver.service
echo '' >> nodeserver.service
echo '[Service]' >> nodeserver.service
echo "ExecStart=/usr/bin/node /home/ubuntu/$foldername/$filename" >> nodeserver.service
echo '# Required on some systems' >> nodeserver.service
echo "WorkingDirectory=/home/ubuntu/$foldername" >> nodeserver.service
echo 'Restart=always' >> nodeserver.service
echo '# Restart service after 5 seconds if node service crashes' >> nodeserver.service
echo 'RestartSec=5' >> nodeserver.service
echo '# Output to syslog' >> nodeserver.service
echo 'StandardOutput=syslog' >> nodeserver.service
echo 'StandardError=syslog' >> nodeserver.service
echo 'SyslogIdentifier=nodejs-example' >> nodeserver.service
echo '#User=<alternate user>' >> nodeserver.service
echo '#Group=<alternate group>' >> nodeserver.service
echo '#Environment=NODE_ENV=production PORT=1337' >> nodeserver.service
echo '' >> nodeserver.service
echo '[Install]' >> nodeserver.service
echo 'WantedBy=multi-user.target' >> nodeserver.service

# Update the nodeservice path
sudo cp /home/ubuntu/nodeacle/nodeserver.service /etc/systemd/system/

echo "# Finished nodeservice configuration."
echo "# Starting iptable configuration..."

# Set the iptables settings
sudo iptables -P INPUT ACCEPT
sudo iptables -P OUTPUT ACCEPT
sudo iptables -P FORWARD ACCEPT
sudo iptables -F

# Saving the iptables settings in root
sudo iptables-save > /etc/iptables/rules.v4

# UNCOMMENT THE FOLLOWING LINE TO AUTO-START NODESERVICE
# sudo systemctl start nodeserver.service

echo "# Finished iptable configuration."
echo ""
echo "Configuration Complete!"
echo "Thanks for using Nodeacle!"

exit
