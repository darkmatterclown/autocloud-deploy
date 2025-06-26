#!/bin.bash
yum update -y
yum install -y httpd
systemctl start httpd
systemctl enable httpd
echo "Deyloyed via CI/CD Pipeline" > /var/www/html/index.html