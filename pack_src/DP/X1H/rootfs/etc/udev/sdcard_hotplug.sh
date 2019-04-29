#! /bin/sh
echo "test"
case $1 in
    add)
        echo "sdcard insert"  > /dev/ttyS0
        echo $2 $3  > /dev/ttyS0
        if [ -b /dev/mmcblk0p1 ]; then
        if [ "$3" == "mmcblk0" ]; then
            echo "******mmcblk0 exit******" >/dev/ttyS0
            exit 1
        fi
        fi

        mkdir -p $2/$3
        mount -t vfat -o codepage=936,iocharset=utf8  /dev/$3 $2/$3 
        
        ;;
    remove)
    		echo "sdcard remove"  > /dev/ttyS0
        umount $2/$3
        rm -rf $2/$3
        ;;
esac

exit 0

