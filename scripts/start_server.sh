#! /bin/bash
sudo systemctl start myflask.service
sudo systemctl enable myflask.service
sudo systemctl start nginx
sudo systemctl enable nginx