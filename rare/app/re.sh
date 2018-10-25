#!/bin/bash
echo "Pastikan kedua disk anda memiliki ukuran awal yang sama"
echo "Ingin melihat disk anda ?"
printf "[ y , n ] :"
read disk1
	case $disk1 in
		y|Y) fdisk -l ;;
		n|N) lsblk ;;
	esac
echo -n "Masuk kan disk yang masih normal, ex : /dev/sda : "
read normal
echo -n "Masuk kan disk yang baru, ex : /dev/sdb : "
read disk
sfdisk -d $normal | sfdisk $disk
echo "Pilih nomor $disk untuk memasukan ke MD0 device : "
echo "1. $disk""1" 
echo "2. $disk""2"
echo "$disk""1" >> disk1.txt
echo "$disk""2" >> disk2.txt
FILE=disk1.txt
disk1=`cat disk1.txt`
FILE=disk2.txt
disk2=`cat disk2.txt`
printf 'pilih nomor menu di atas : '
read mdd
	case $mdd in
		1 ) mdadm --manage /dev/md0 --add $disk1
			;;
		2 ) mdadm --manage /dev/md1 --add $disk1
			;;
	esac
echo "Pilih nomor $disk untuk memasukan ke MD1 device : "
echo "1.$disk""1"
echo "2.$disk""2"
printf 'pilih nomor menu di atas : '
read mdd2
	case $mdd2 in
		1 ) mdadm --manage /dev/md0 --add $disk2
			;;
		2 ) mdadm --manage /dev/md1 --add $disk2
			;;
	esac
echo "loading ... " && sleep 2 && cat /proc/mdstat 
rm disk1.txt && rm disk2.txt
echo "setelah progres diatas selesai"
echo "jalankan Progam ini lagi dan pilih nomer 3 untuk memasang boot loader"