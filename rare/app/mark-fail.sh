#!/bin/bash
echo "pastikan ada mengingat disk dan md device yang akan di ganti , contoh /dev/sdb1 di md0 /dev/sda1 di md1"
echo "apakah anda ingin melihat status md device ? "
printf ' [ y , n ] '
read mddevice
	case $mddevice in
		y|Y)cat /proc/mdstat 
			;; 
		n|N)echo " Ok" 
			;;
		*) echo "Pilih lah Y atau N " 
			;;
	esac
echo "Manajemen disk md0 .."
echo -n "masukan disk yang akan di ganti di md0 contoh pengisian : /dev/sdb1 : "
read md0
echo "Manajemen disk md1 .."
echo -n "masukan disk yang akan di ganti di md1 contoh pengisian : /dev/sdb2 : "
read md1
echo "data sudah lengkap apakah anda mau mulai sekarang ? , HATI-HATI ini adalah program yang tidak bisa di undo , jika ada kesalahan pada pengisian data di atas harap batalkan dan jalankan lagi "
printf ' [ y , n ] :'
read start
	case $start in
		y|Y)echo "	starting ..." && sleep 1 
			;;
		n|N)echo "	aborting ..." && exit
			;;
		*)echo "Pilih Y atau N !"
			;;
	esac
mdadm --manage /dev/md0 --fail $md0
mdadm --manage /dev/md0 --remove $md0
mdadm --manage /dev/md1 --fail $md1
mdadm --manage /dev/md1 --remove $md1
echo "sekarang ada dapat mematikan server anda , dan mengganti hardisk nya dengan yang baru , INGAT Size hardisk harus sama dengan size disk sebelum nya , setelah memasang disk baru jalan kan program ini lagi dan pilih menu ke 2"
echo "poweroff sekarang ? "
printf ' [ y , n ]' 
read power
	case $power in
		y|Y) poweroff
			 ;;
		n|N) exit
			 ;;
	esac