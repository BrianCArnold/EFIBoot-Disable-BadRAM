#!/bin/bash

make clean
make # efi

mv disable-ram-area.efi BOOTX64.efi

/usr/bin/dd if=/dev/zero of=uefi.img bs=512 count=93750
/usr/sbin/parted uefi.img -s -a minimal mklabel gpt
/usr/sbin/parted uefi.img -s -a minimal mkpart EFI FAT16 2048s 93716s
/usr/sbin/parted uefi.img -s -a minimal toggle 1 boot

dd if=/dev/zero of=part.img bs=512 count=91669
mformat -i part.img -h 32 -t 32 -n 64 -c 1

echo "BOOTX64.efi 0x10000000 0x20000000 5000" >startup.nsh

mmd -i part.img 'EFI'
mcd -i part.img 'EFI'
mmd -i part.img 'BOOT'
mcd -i part.img 'BOOT'

mcopy -i part.img BOOTX64.efi '::'
mcopy -i part.img startup.nsh '::'

dd if=part.img of=uefi.img bs=512 count=91669 seek=2048 conv=notrunc

if [[ ! -f "OVMF_VARS_4M.fd" ]]; then
  cp /usr/share/OVMF/OVMF_VARS_4M.fd ./
else
  echo "Found Vars file."
fi

qemu-system-x86_64 -bios /usr/share/qemu/OVMF.fd \
	-m 4G \
	-cpu qemu64 \
	-drive if=pflash,format=raw,readonly=on,file=/usr/share/OVMF/OVMF_CODE_4M.fd \
	-drive if=pflash,format=raw,file=OVMF_VARS_4M.fd \
	-drive file=uefi.img,format=raw,if=virtio \
	-boot order=d

# qemu-system-x86_64 -bios /usr/share/qemu/OVMF.fd \
# 	-m 4G \
# 	-cpu qemu64 \
# 	-drive if=pflash,format=raw,readonly=on,file=/usr/share/OVMF/OVMF_CODE_4M.fd \
# 	-drive if=pflash,format=raw,file=OVMF_VARS_4M.fd \
# 	-kernel BOOTX64.efi -append '0x10000000 0x20000000 1000'

rm uefi.img part.img startup.nsh
