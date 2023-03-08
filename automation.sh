sudo apt update -y
apache="install"
if [[ $apache != $(dpkg --get-selections apache2 | awk '{print $1}') ]]
then
	sudo apt install apache2
fi

service="running"
if [[ $service != $(systemctl status apache2 | grep active | awk '{print $3}') ]]
then
	sudo systemctl start apache2
fi

if [[ "enabled" != $(systemctl is-enabled apache2 | grep "enabled") ]] 
then
	sudo systemctl enable apache2
fi

name="Divyangi"
sbname="upgrad-divyangi"
timestamp=$(date '+%d%m%Y-%H%M%S')
cd /var/log/apache2
tar -cf /tmp/${name}-httpd-logs-${timestamp}.tar *.log

if [[ -f /tmp/${name}-httpd-logs-${timestamp}.tar ]]
then
	aws s3 \
        cp /tmp/${name}-httpd-logs-${timestamp}.tar \
        s3://${sbname}/${name}-httpd-logs-${timestamp}.tar
fi

docroot="/var/www/html"
if [[ ! -f ${docroot}/inventory.html ]]; then
	#statements
	echo -e 'Log Type\t\tTime Created\t\tType\t\tSize\n' > ${docroot}/inventory.html
fi

if [[ -f ${docroot}/inventory.html ]]; then
	#statements
    size=$(du -h /tmp/${name}-httpd-logs-${timestamp}.tar | awk '{print $1}')
	echo -e "httpd-logs\t\t${timestamp}\t\ttar\t\t${size}\n" >> ${docroot}/inventory.html
fi

if [[ ! -f /etc/cron.d/automation ]]; then
	#statements
	echo "0 8 * * * root /root/automation.sh" >> /etc/cron.d/automation
fi

