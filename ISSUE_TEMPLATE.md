Confirm the following are included in your repo, checking each box:

 - [x] completed README.md file with the necessary information
 - [x] shim.efi to be signed
 - [x] public portion of your certificate(s) embedded in shim (the file passed to VENDOR_CERT_FILE)
 - [x] binaries, for which hashes are added to vendor_db ( if you use vendor_db and have hashes allow-listed )
 - [x] any extra patches to shim via your own git tree or as files
 - [x] any extra patches to grub via your own git tree or as files
 - [x] build logs
 - [x] a Dockerfile to reproduce the build of the provided shim EFI binaries

*******************************************************************************
### What is the link to your tag in a repo cloned from rhboot/shim-review?
*******************************************************************************
https://github.com/Matrix42AG/shim-review/tree/matrix42ag-shim-x64-20240304

*******************************************************************************
### What is the SHA256 hash of your final SHIM binary?
*******************************************************************************
7409c799415b69dfc6222a844b072f79aa14f5b57f1bea07a442c17d74390b33

*******************************************************************************
### What is the link to your previous shim review request (if any, otherwise N/A)?
*******************************************************************************
https://github.com/rhboot/shim-review/issues/199
https://github.com/rhboot/shim-review/issues/169
https://github.com/rhboot/shim-review/issues/7