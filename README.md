# cloudflare-remoteip (cfrip-apache2.sh)
Fetches Cloudflare IP (v4 and v6) ranges and creates a config for mod_remoteip (Apache HTTP Server)

Example setup on Debian/Ubuntu:

    sudo ./cfrip-apache2.sh /etc/apache2/conf-available/cloudflare-remoteip.conf
    sudo a2enmod remoteip
    sudo a2enconf cloudflare-remoteip
    sudo systemctl restart apache2

Subsequent usage (updating):

    sudo ./cfrip-apache2.sh /etc/apache2/conf-available/cloudflare-remoteip.conf
    sudo systemctl reload apache2
