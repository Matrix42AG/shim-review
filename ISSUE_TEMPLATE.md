Confirm the following are included in your repo, checking each box:

 - [x] completed README.md file with the necessary information
 - [x] shim.efi to be signed
 - [x] public portion of your certificate(s) embedded in shim (the file passed to VENDOR_CERT_FILE)
 - [x] binaries, for which hashes are added to vendor_db ( if you use vendor_db and have hashes allow-listed )
Not used
 - [x] any extra patches to shim via your own git tree or as files
No extra patches
 - [x] any extra patches to grub via your own git tree or as files
GRUB bootloader is not used
 - [x] build logs
 - [x] a Dockerfile to reproduce the build of the provided shim EFI binaries

*******************************************************************************
### What is the link to your tag in a repo cloned from rhboot/shim-review?
*******************************************************************************
https://github.com/Matrix42AG/shim-review

*******************************************************************************
### What is the SHA256 hash of your final SHIM binary?
*******************************************************************************
f75973853cbdbb95190efdc61fd7a044fc6dd61f0138fbeaa0e3ec44d69211ff 

*******************************************************************************
### What is the link to your previous shim review request (if any, otherwise N/A)?
*******************************************************************************
https://github.com/rhboot/shim-review/issues/199
https://github.com/rhboot/shim-review/issues/169
https://github.com/rhboot/shim-review/issues/7