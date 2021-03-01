#!/bin/bash
swap_file=/mnt/swapfile
swap_file_size=13G
sudo swapoff $swap_file
sudo rm -f $swap_file
sudo fallocate -l $swap_file_size $swap_file
sudo chmod 600 $swap_file
sudo mkswap $swap_file
sudo swapon $swap_file
