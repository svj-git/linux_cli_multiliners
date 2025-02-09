#In all found files replace old_string with new_string
find ./ -type f -exec sed -i 's/old_string/new_string/gI' {} \;

#rename Howto RHEL,RHEL clones, Fedora
rename Old New OldName*

#encrypt symmetric AES
gpg --symmetric --cipher-algo AES256 file.txt

#ffmpeg cutting video
#cut using specified time
ffmpeg -i input.mp4 -ss 00:05:10 -to 00:15:30 -c:v copy -c:a copy output2.mp4
#cut using duration
ffmpeg -i input.mp4 -ss 00:05:20 -t 00:10:00 -c:v copy -c:a copy output1.mp4

# Test if postfix user can read /etc/resolv.conf file
sudo -u postfix -H cat /etc/resolv.conf

# Parallel and sg_format all drives simultaneously very dangerous it will delete ALL YOUR DATA!
parallel sg_format --format -e ::: /dev/sg{2..126}

# Recreate folder directory structure
rsync -av -f"+ */" -f"- *" "/path/to/the/source/rootDir" "/tmp/test"

# Find and delete bad zip files
find . -iname '*.zip' -type f -readable ! -exec unzip -t {} \; -exec rm -i {} \;

# Using any dd command is exteremely dangerous. I would recommend to write your command first and copy paste in bash prompt
# Clone contents of disk disk to another directly
dd if=/dev/sd of=/dev/sd bs=64m conv=noerror
# Clone disk image to actual disk
dd if=/home/homedir/test.img of=/dev/sd bs=64M conv=noerror
# Create disk image from disk
dd if=/dev/sd of=/home/homedir/test.img bs=64M conv=noerror

# Create the btrfs filesystems
mkfs.btrfs /dev/sdx1 --csum xxhash
# Mount the first drive
mount /dev/sde1 /mnt/raid
# Add the second drive - resulting in combined storage capacity spanned across both drives
btrfs device add /dev/sdf1 /mnt/raid -f
# Create RAID1 of data and metadata (important in case one drive fails)
# Depending on your drive size, this can take several hours to complete
btrfs balance start -dconvert=raid1 -mconvert=raid1 /mnt/raid

# Redirecting UUID to /etc/fstab
lsblk -n -o UUID /dev/nvme0n1p1 >> /etc/fstab

# Extract audio ffmpeg without reencoding
ffmpeg -i inputfile.mkv -vn -acodec copy output-audio.aac

# Copy only empty directories/folders
rsync -a --filter="-! */" ~/8tb_back/ ~/aaaback/8tback/

# Change Newline character to space
tr '\n' ' ' < input_filename

# Add :80 characters at the end of line
sed s/$/:80/ file.txt > another_file.txt

# Use gnupg to verify signature of iso file
dnf -y install gnupg
gpg --keyserver hkps://keyserver.ubuntu.com --recv-keys 5DBC090C710C87B3
gpg --verify AVL_MXE-23.2-20240405_x64.iso.sig AVL_MXE-23.2-20240405_x64.iso

# Check hash sha256sum from echo
echo "fa1428fb09b422ec4a62363e831a5b84fbb8f7cf45ac9ddf054ee75f4f201e92 X9SRL8_B13.zip" | sha256sum --check

# Check hash sha256sum from file sha256
sha256sum -c AVL_MXE-23.2-20240405_x64.iso.sha256 AVL_MXE-23.2-20240405_x64.iso

# If needed, the nmcli connection modify command can be used to change the DNS servers being used. This change will be persistent, meaning the change will remain in place even if the system is rebooted.
nmcli connection modify eth0 ipv4.dns "10.124.141.51,10.112.42.10"
nmcli device reapply eth0

# How to keep processes running after ending ssh session? Background
# nohup
nohup long-running-command &
# It was made specifically for this, it even logs stdout to nohup.log.
# Pause process
ctrl + z
# Put it in background
bg
# Actually disown it
disown -h

# Get HDD recommended blocksize
blockdev --getbsz /dev/sdX
# Badblocks
badblocks -t random -w -s -b {blocksize} /dev/sdX

# Enable wake on lan
@reboot /usr/bin/ethtool -s interface wol g

# Video conversion loop
for INF in *.mp4
do
  ffmpeg -i "$INF" -c:v av1 -g 100 -preset veryslow -crf 36 -c:a copy "${INF%.*}.mkv"
done

# SELINUX relabeling
# If you mount disk image or chroot-ed image and change contects of files like /etc/shadow SELINUX relabel is necessary step for distros with selinux otherwise modified image will fail to boot
touch /.autorelabel

# Mount vm image read only
guestmount -a jdown.qcow2 -i --ro /tmp/tmp22

# Convert vm image file raw/img to qcow2
qemu-img convert -p -f raw -O qcow2 convertedimage.img  resulting.image.qcow2

# Prevent Writes to mountpoint when nothing is mounted
# Unmount Directory:
umount /mnt/backup
# Set ‘immutable’ Flag:
chattr +i /mnt/backup
# Mount Directory again:
mount /mnt/backup

# Enable VF aka Virtual Function for virtual mediated device passthrough
# Intel_iommu=on with MACVTAP passthrough you also need iommu=pt
# You must have intel_iommu=on in your grub or grub2, or other boot loader line
grubby --update-kernel ALL --args intel_iommu=on
grubby --update-kernel ALL --args iommu=pt
dracut -f --kver $(uname -r)
# After the machine the changes to your /etc/default/grub you'll need to make the changes perminent by typing
grub2-mkconfig -o /boot/grub2/grub.cfg
# Create 64 Vfs
echo 64 > /sys/class/net/enp7s0f0/device/sriov_numvfs
# verify that there are 64 of them
lspci | grep 'Virtual Function' | wc -l

# set keyboard to slovak keyboard with variant qwerty
localectl set-x11-keymap sk variant qwerty
