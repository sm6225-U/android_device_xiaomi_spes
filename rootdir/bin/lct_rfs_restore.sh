#!/vendor/bin/sh

log -p e -t lct_chown mpss 
chown -hR vendor_rfs.vendor_rfs /mnt/vendor/persist/rfs/msm/mpss

log -p e -t lct_chown msm 
chown -h vendor_rfs.vendor_rfs /mnt/vendor/persist/rfs/msm

log -p e -t lct_chown rfs 
chown -h vendor_rfs.vendor_rfs /mnt/vendor/persist/rfs

