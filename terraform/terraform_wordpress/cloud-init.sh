#!/bin/bash
set -euxo pipefail

# Patch the system and grab Apache, PHP, MariaDB and wget
dnf update -y
dnf install -y httpd php php-mysqlnd mariadb105-server wget

# Turn on the web server and database, and keep them on after reboots
systemctl start httpd
systemctl enable httpd
systemctl start mariadb
systemctl enable mariadb

# Build the WordPress database and give its user access
mysql -e "CREATE DATABASE ${db_name};"
mysql -e "CREATE USER '${db_user}'@'localhost' IDENTIFIED BY '${db_password}';"
mysql -e "GRANT ALL PRIVILEGES ON ${db_name}.* TO '${db_user}'@'localhost';"
mysql -e "FLUSH PRIVILEGES;"

# Pull down WordPress and unpack it into the web root
cd /var/www/html
wget https://wordpress.org/latest.tar.gz
tar -xzf latest.tar.gz
cp -r wordpress/* .
rm -rf wordpress latest.tar.gz

# Point WordPress at the database
cp wp-config-sample.php wp-config.php
sed -i "s/database_name_here/${db_name}/" wp-config.php
sed -i "s/username_here/${db_user}/" wp-config.php
sed -i "s/password_here/${db_password}/" wp-config.php

# Let WordPress use .htaccess so permalinks work
cat > /etc/httpd/conf.d/wordpress.conf <<'EOF'
<Directory "/var/www/html">
    AllowOverride All
</Directory>
EOF
systemctl restart httpd

# Hand the site files over to Apache
chown -R apache:apache /var/www/html
chmod -R 755 /var/www/html
