#!/bin/bash
echo "Boot manager" && sleep 2
echo "Pilih menu installasi : "
echo "1. installasi standard (Recommended)"
echo "2. installasi plan B bila no 1 gagal "
printf 'Pilih nomor di atas : '
read mode
	case $mode in
		1 )echo -n "masukan disk yang akan di pasangi boot loader : ex : /dev/sda atau /dev/sdb :"
read bot
grub-install $bot
			;;
		2 )echo -n "masukan disk yang akan di pasangi boot loader : ex : /dev/sda atau /dev/sdb :"
read bot
echo "masukan lokasi MD yang masih mempunyai data boot "
echo -n "contoh /dev/sda masih memiliki file boot di lokasi /dev/md1 , ex : /dev/md1 :"
read mdlokasi
mount $mdlokasi /mnt
grub-install --root-directory=/mnt $bot
			;;
	esac
echo "Selesai"
echo "thanks"