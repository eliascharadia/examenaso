#!/bin/bash

# Creo particion del tipo LVM
sudo fdisk /dev/sdf << LVM
n
p



t
8e
w
LVM

# Muestro anterior
df -h |grep /dev/mapper/vg_datos-lv_workareas

#Creo el pv
sudo pvcreate /dev/sdf1

# Extiendo el VG "vg_datos"
sudo vgextend vg_datos /dev/sdf1

# Extiendo el logical volume "lv_workareas"
sudo lvextend -L +1G /dev/mapper/vg_datos-lv_workareas

# Agrando el file system
sudo resize2fs /dev/mapper/vg_datos-lv_workareas

# Lo monto
sudo mount /dev/mapper/vg_datos-lv_workareas

# Verifico
df -h |grep /dev/mapper/vg_datos-lv_workareas
