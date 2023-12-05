Confirm the following are included in your repo, checking each box:

 - [x] completed README.md file with the necessary information

https://github.com/Matrix42AG/shim-review/blob/main/README.md
    
 - [x] shim.efi to be signed

https://github.com/Matrix42AG/shim-review/blob/main/shim.efi
 
 - [x] public portion of your certificate(s) embedded in shim (the file passed to VENDOR_CERT_FILE)

https://github.com/Matrix42AG/shim-review/blob/main/matrix42.public.ev.cer

 - [x] binaries, for which hashes are added to vendor_db ( if you use vendor_db and have hashes allow-listed )
Not used
 - [x] any extra patches to shim via your own git tree or as files

https://github.com/Matrix42AG/shim-review/tree/main/patches

 - [x] any extra patches to grub via your own git tree or as files

GRUB bootloader is not used

 - [x] build logs

https://github.com/Matrix42AG/shim-review/blob/main/build.log

 - [x] a Dockerfile to reproduce the build of the provided shim EFI binaries

https://github.com/Matrix42AG/shim-review/blob/main/Dockerfile

*******************************************************************************
### What is the link to your tag in a repo cloned from rhboot/shim-review?
*******************************************************************************
https://github.com/Matrix42AG/shim-review

*******************************************************************************
### What is the SHA256 hash of your final SHIM binary?
*******************************************************************************
50501d79a8ecc1648ed4418e5a35207feb08b797f4387ab1876e7e29abdc0b51 

*******************************************************************************
### What is the link to your previous shim review request (if any, otherwise N/A)?
*******************************************************************************
https://github.com/rhboot/shim-review/issues/199
https://github.com/rhboot/shim-review/issues/169
https://github.com/rhboot/shim-review/issues/7
