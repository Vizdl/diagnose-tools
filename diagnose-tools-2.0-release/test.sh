arg=$1
if [ $arg -eq 0 ];
then
    echo "start make"
    diagnose-tools uninstall
    make
    chmod 755  /usr/diagnose-tools/diagnose-tools.sh
    diagnose-tools install
else 
    echo "not make"
fi
diagnose-tools irq-delay --activate="threshold=5"
dd if=/dev/zero of=./smb1.txt count=5 bs=1G &
sleep 5
diagnose-tools irq-delay --deactivate
diagnose-tools irq-delay  --report > test.log
