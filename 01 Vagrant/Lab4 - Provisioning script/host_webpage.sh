#! /usr/bin/env bash

sudo apt-get update
sudo apt-get install -y apache2
sudo ln -fs /vagrant/* /var/www/html
