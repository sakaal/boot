#!/bin/bash

# Logical volume group 'vg_guests' is configured as a libvirt storage pool.

# Test environment usage tested on Fedora 19:
ssh-keygen -R 192.168.122.8
virt-install --connect=qemu:///system \
--network=network:default,model=virtio \
--initrd-inject ~/git/boot/root/boot.local-ks.cfg \
--extra-args="ks=file:/boot.local-ks.cfg console=tty0 console=xvc0,115200n8 serial" \
--name=boot.local \
--description="A bootstrapping node" \
--disk path=/dev/vg_guests/lv_boot.local,size=4,bus=virtio,sparse=false,cache=writethrough \
--ram=768 \
--arch=x86_64 \
--os-type=linux \
--os-variant=generic26 \
--vcpus=1 \
--check-cpu \
--accelerate \
--virt-type=kvm \
--location=http://www.nic.funet.fi/pub/Linux/INSTALL/Centos/6.4/os/x86_64/ \
--graphics=none \
--noautoconsole
