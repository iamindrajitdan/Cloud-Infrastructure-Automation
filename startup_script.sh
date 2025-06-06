#!/bin/bash
sudo agt-get update -y
sudo apt-get install nginx -y
echo "<h1>Hello from Terraform with google storage script</h1>" | sudo tee  /var/www/html/index.html
sudo systemctl restart nginx