python ./esptool.py --port=/dev/cu.SLAB_USBtoUART write_flash -fm=dio -fs=4MB 0x3fc000 ./esp_init_data_default.bin
python ./esptool.py --port=/dev/cu.SLAB_USBtoUART write_flash -fm=dio -fs=4MB 0x00000 ./nodemcu-master-22-modules-float.bin
echo Waiting for flash filesystem to reformat..
sleep 120
echo $'\a'
