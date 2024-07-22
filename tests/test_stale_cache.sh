#/bin/sh
#while true; do echo $i > ../test/i10.txt; sleep 1; i=$((i+1)); done &
set -e
mkdir -p test mnt
rm ./fuseflt || true
fusermount -u mnt || true
umount -l mnt || true
make -j4
LD_LIBRARY_PATH=/usr/local/lib ./fuseflt ../fuseflt.conf test mnt 
#watch cat ../test/i10.txt ../mnt/i10.cat 
watch -n1 grep -H . test/i10.txt /mnt/i10.txt mnt/i10.cat
