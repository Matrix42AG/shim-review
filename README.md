This repo is for review of requests for signing shim.  To create a request for review:

- clone this repo
- edit the template below
- add the shim.efi to be signed
- add build logs
- add any additional binaries/certificates/SHA256 hashes that may be needed
- commit all of that
- tag it with a tag of the form "myorg-shim-arch-YYYYMMDD"
- push that to github
- file an issue at https://github.com/rhboot/shim-review/issues with a link to your tag
- approval is ready when the "accepted" label is added to your issue

Note that we really only have experience with using GRUB2 or systemd-boot on Linux, so
asking us to endorse anything else for signing is going to require some convincing on
your part.

Check the docs directory in this repo for guidance on submission and
getting your shim signed.

Here's the template:

*******************************************************************************
### What organization or people are asking to have this signed?
*******************************************************************************
https://matrix42.com

*******************************************************************************
### What product or service is this for?
*******************************************************************************
EgoSecure Full Disk Encryption by Matrix42

*******************************************************************************
### What's the justification that this really does need to be signed for the whole world to be able to boot it?
*******************************************************************************
EgoSecure Full Disk Encryption secures data on laptops by applying sector level encryption with Pre-boot authentication.
We need to be signed because we want to distribute our product to our end users across the world. Our Pre-boot authentication has to support Secure Boot.
We have used a Microsoft SecureBoot signed Shim since 2018.

*******************************************************************************
### Why are you unable to reuse shim from another distro that is already signed?
*******************************************************************************
We have updated our vendor certificate bacuse the previous certificate has expired.

*******************************************************************************
### Who is the primary contact for security updates, etc.?
The security contacts need to be verified before the shim can be accepted. For subsequent requests, contact verification is only necessary if the security contacts or their PGP keys have changed since the last successful verification.

An authorized reviewer will initiate contact verification by sending each security contact a PGP-encrypted email containing random words.
You will be asked to post the contents of these mails in your `shim-review` issue to prove ownership of the email addresses and PGP keys.
*******************************************************************************
- Name: Andrei Voicu
- Position: Engineering Manager
- Email address: andrei.voicu@matrix42.com
- PGP key fingerprint: 1B96BC60FA8B9EF41B6A39DE7FC3A7600FCA2CEF

(Key should be signed by the other security contacts, pushed to a keyserver
like keyserver.ubuntu.com, and preferably have signatures that are reasonably
well known in the Linux community.)

*******************************************************************************
### Who is the secondary contact for security updates, etc.?
*******************************************************************************
- Name: Bogdan Ariton
- Position: Software Engineer
- Email address: bogdan.ariton@matrix42.com
- PGP key fingerprint: 25EC754AFA008273926CBEA6D6E8CDDF488D0131

(Key should be signed by the other security contacts, pushed to a keyserver
like keyserver.ubuntu.com, and preferably have signatures that are reasonably
well known in the Linux community.)

*******************************************************************************
### Were these binaries created from the 15.8 shim release tar?
Please create your shim binaries starting with the 15.8 shim release tar file: https://github.com/rhboot/shim/releases/download/15.8/shim-15.8.tar.bz2

This matches https://github.com/rhboot/shim/releases/tag/15.8 and contains the appropriate gnu-efi source.

*******************************************************************************
Yes, we use 15.8 shim release https://github.com/rhboot/shim/releases/download/15.8/shim-15.8.tar.bz2

*******************************************************************************
### URL for a repo that contains the exact code which was built to get this binary:
*******************************************************************************
https://github.com/rhboot/shim/releases/download/15.8/shim-15.8.tar.bz2

*******************************************************************************
### What patches are being applied and why:
*******************************************************************************
https://github.com/Matrix42AG/shim-review/tree/matrix42ag-shim-x64-20240304/patches/0001-bypass_boot_options.patch
This patch will bypass boot options code.

*******************************************************************************
### Do you have the NX bit set in your shim? If so, is your entire boot stack NX-compatible and what testing have you done to ensure such compatibility?

See https://techcommunity.microsoft.com/t5/hardware-dev-center/nx-exception-for-shim-community/ba-p/3976522 for more details on the signing of shim without NX bit.
*******************************************************************************
Is not set.

*******************************************************************************
### If shim is loading GRUB2 bootloader what exact implementation of Secureboot in GRUB2 do you have? (Either Upstream GRUB2 shim_lock verifier or Downstream RHEL/Fedora/Debian/Canonical-like implementation)
*******************************************************************************
GRUB bootloader is not used

*******************************************************************************
### If shim is loading GRUB2 bootloader and your previously released shim booted a version of GRUB2 affected by any of the CVEs in the July 2020, the March 2021, the June 7th 2022, the November 15th 2022, or 3rd of October 2023 GRUB2 CVE list, have fixes for all these CVEs been applied?

* 2020 July - BootHole
  * Details: https://lists.gnu.org/archive/html/grub-devel/2020-07/msg00034.html
  * CVE-2020-10713
  * CVE-2020-14308
  * CVE-2020-14309
  * CVE-2020-14310
  * CVE-2020-14311
  * CVE-2020-15705
  * CVE-2020-15706
  * CVE-2020-15707
* March 2021
  * Details: https://lists.gnu.org/archive/html/grub-devel/2021-03/msg00007.html
  * CVE-2020-14372
  * CVE-2020-25632
  * CVE-2020-25647
  * CVE-2020-27749
  * CVE-2020-27779
  * CVE-2021-3418 (if you are shipping the shim_lock module)
  * CVE-2021-20225
  * CVE-2021-20233
* June 2022
  * Details: https://lists.gnu.org/archive/html/grub-devel/2022-06/msg00035.html, SBAT increase to 2
  * CVE-2021-3695
  * CVE-2021-3696
  * CVE-2021-3697
  * CVE-2022-28733
  * CVE-2022-28734
  * CVE-2022-28735
  * CVE-2022-28736
  * CVE-2022-28737
* November 2022
  * Details: https://lists.gnu.org/archive/html/grub-devel/2022-11/msg00059.html, SBAT increase to 3
  * CVE-2022-2601
  * CVE-2022-3775
* October 2023 - NTFS vulnerabilities
  * Details: https://lists.gnu.org/archive/html/grub-devel/2023-10/msg00028.html, SBAT increase to 4
  * CVE-2023-4693
  * CVE-2023-4692
*******************************************************************************
GRUB bootloader is not used

*******************************************************************************
### If shim is loading GRUB2 bootloader, and if these fixes have been applied, is the upstream global SBAT generation in your GRUB2 binary set to 4?
The entry should look similar to: `grub,4,Free Software Foundation,grub,GRUB_UPSTREAM_VERSION,https://www.gnu.org/software/grub/`
*******************************************************************************
GRUB bootloader is not used

*******************************************************************************
### Were old shims hashes provided to Microsoft for verification and to be added to future DBX updates?
### Does your new chain of trust disallow booting old GRUB2 builds affected by the CVEs?
*******************************************************************************
Our earlier software versions continue to employ the previous build shim, and it is not possible to include it as a DBX exception.
We have also SBAT support.
GRUB bootloader is not used.

*******************************************************************************
### If your boot chain of trust includes a Linux kernel:
### Is upstream commit [1957a85b0032a81e6482ca4aab883643b8dae06e "efi: Restrict efivar_ssdt_load when the kernel is locked down"](https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=1957a85b0032a81e6482ca4aab883643b8dae06e) applied?
### Is upstream commit [75b0cea7bf307f362057cc778efe89af4c615354 "ACPI: configfs: Disallow loading ACPI tables when locked down"](https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=75b0cea7bf307f362057cc778efe89af4c615354) applied?
### Is upstream commit [eadb2f47a3ced5c64b23b90fd2a3463f63726066 "lockdown: also lock down previous kgdb use"](https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=eadb2f47a3ced5c64b23b90fd2a3463f63726066) applied?
*******************************************************************************
We've upgraded to Linux 6.6.9 which has the all the required patches to enforce the secure boot.

*******************************************************************************
### Do you build your signed kernel with additional local patches? What do they do?
*******************************************************************************
We build and sign linux kernel locally. 
We have five local patches: https://github.com/Matrix42AG/shim-review/tree/matrix42ag-shim-x64-20240304/kernel-patches/

•	0001-disable-expert-selects-debug.patch - will disable DEBUG_KERNEL option from menuconfig

•	0100-cpsd-realmode.patch - will enable export for machine_real_restart without having to enable CONFIG_APM_MODULE kernel module

•	0101-cpsd-video.patch: In summary the code will check if a specific value is stored at memory address 0xf000, if it's not, it attempts to set a VESA video mode using BIOS interrupts and checks if the operation was successful by inspecting the return value in the ax register. We're first initializing a register using initregs(&ireg), then we're initializing the ax under the register structure with 0x4f02 <- this value is used for BIOS videos services interrupt calls. Setting the bx value of the register structure to "vesa_mode" is used to the VESA video mode value. Using these setting we can use initcall to make a BIOS interrupt call at 0x10 in order to set the video mode VBE (VESA BIOS Extensions). In the end if this operation fails we simply return -1.

•	0201-best-video-mode.patch - The patch will attempt to enable best mode when EXTENDED_VGA is enabled. The mode_best() function iterates over available video modes to find the best one based on resolution and color depth. If we're in EXTENDED_VGA mode then we're updating the mode variable with the best mode ID.

•	0202-bootdev.patch - sets up three init parameters that our loader uses to pass on to the kernel: es_fde_part_start, es_fde_part_length, es_fde_part_no. We use this information to find and mount the right partition. Finding the right partition is done via this function: es_find_partition. The function is basically a copy of the printk_all_partitions which is part of the kernel by default. The function will basically iterate over the available partitions and will compare the start sector value and number of sectors of each partition found with the given part_start and part_lenght in order to find the designated partition we want to use for the ego_secure partition.

*******************************************************************************
### Do you use an ephemeral key for signing kernel modules?
### If not, please describe how you ensure that one kernel build does not load modules built for another kernel.
*******************************************************************************
When building the kernel, a ephemeral key is generated and signed

*******************************************************************************
### If you use vendor_db functionality of providing multiple certificates and/or hashes please briefly describe your certificate setup.
### If there are allow-listed hashes please provide exact binaries for which hashes are created via file sharing service, available in public with anonymous access for verification.
*******************************************************************************
We don't use hashes to verify our own efi binaries.
We use VENDOR_CERT_FILE with one certificate that will be used to verify all our efi binaries.

*******************************************************************************
### If you are re-using a previously used (CA) certificate, you will need to add the hashes of the previous GRUB2 binaries exposed to the CVEs to vendor_dbx in shim in order to prevent GRUB2 from being able to chainload those older GRUB2 binaries. If you are changing to a new (CA) certificate, this does not apply.
### Please describe your strategy.
*******************************************************************************
We're changing to a new CA certificate.

*******************************************************************************
### What OS and toolchain must we use to reproduce this build?  Include where to find it, etc.  We're going to try to reproduce your build as closely as possible to verify that it's really a build of the source tree you tell us it is, so these need to be fairly thorough. At the very least include the specific versions of gcc, binutils, and gnu-efi which were used, and where to find those binaries.
### If the shim binaries can't be reproduced using the provided Dockerfile, please explain why that's the case and what the differences would be.
*******************************************************************************
Please use the included file 'Dockerfile' to reproduce build

*******************************************************************************
### Which files in this repo are the logs for your build?
This should include logs for creating the buildroots, applying patches, doing the build, creating the archives, etc.
*******************************************************************************
build.log

*******************************************************************************
### What changes were made in the distro's secure boot chain since your SHIM was last signed?
For example, signing new kernel's variants, UKI, systemd-boot, new certs, new CA, etc..
*******************************************************************************
We switched to shim-15.8 added a new vendor certificate (because the old one was expired) and updated .sbat

*******************************************************************************
### What is the SHA256 hash of your final SHIM binary?
*******************************************************************************
7409c799415b69dfc6222a844b072f79aa14f5b57f1bea07a442c17d74390b33

*******************************************************************************
### How do you manage and protect the keys used in your SHIM?
*******************************************************************************
The private key, associated with the vendor EV certificate build with the shim, is saved on an Hardware Security Module that is attached and only available to our internal build machine.

*******************************************************************************
### Do you use EV certificates as embedded certificates in the SHIM?
*******************************************************************************
Yes

*******************************************************************************
### Do you add a vendor-specific SBAT entry to the SBAT section in each binary that supports SBAT metadata ( GRUB2, fwupd, fwupdate, systemd-boot, systemd-stub, shim + all child shim binaries )?
### Please provide exact SBAT entries for all shim binaries as well as all SBAT binaries that shim will directly boot.
### Where your code is only slightly modified from an upstream vendor's, please also preserve their SBAT entries to simplify revocation.
If you are using a downstream implementation of GRUB2 or systemd-boot (e.g.
from Fedora or Debian), please preserve the SBAT entry from those distributions
and only append your own. More information on how SBAT works can be found
[here](https://github.com/rhboot/shim/blob/main/SBAT.md).
*******************************************************************************
shim sbat (objcopy --only-section .sbat -O binary shim.efi /dev/stdout): 
> sbat,1,SBAT Version,sbat,1,https://github.com/rhboot/shim/blob/main/SBAT.md
> 
> shim,4,UEFI shim,shim,1,https://github.com/rhboot/shim
> 
> shim.egosecure,1,Matrix42 GmbH,shim,15.8,https://matrix42.com

Second stage boot loader sbat (objcopy --only-section .sbat -O binary esbootmg.efi /dev/stdout):
> sbat,1,SBAT Version,sbat,1,https://github.com/rhboot/shim/blob/main/SBAT.md
> 
> esbootmg,1,Matrix42 GmbH,FDE,1,https://matrix42.com

*******************************************************************************
### If shim is loading GRUB2 bootloader, which modules are built into your signed GRUB2 image?
*******************************************************************************
GRUB bootloader is not used.

*******************************************************************************
### If you are using systemd-boot on arm64 or riscv, is the fix for [unverified Devicetree Blob loading](https://github.com/systemd/systemd/security/advisories/GHSA-6m6p-rjcq-334c) included?
*******************************************************************************
We have a custom boot loader.

*******************************************************************************
### What is the origin and full version number of your bootloader (GRUB2 or systemd-boot or other)?
*******************************************************************************
We have a custom boot loader.

*******************************************************************************
### If your SHIM launches any other components, please provide further details on what is launched.
*******************************************************************************
The shim loads our custom loader (the DEFAULT_LOADER provided to the shim). We use a custom second-stage loader. According to business logic, the loader can start Microsoft Windows Boot Manager or own Linux Kernel image. All of the files we load are code-signed with the EV vendor certificate provided to the shim.
To start the loader we create our own EFI boot entry.  

*******************************************************************************
### If your GRUB2 or systemd-boot launches any other binaries that are not the Linux kernel in SecureBoot mode, please provide further details on what is launched and how it enforces Secureboot lockdown.
*******************************************************************************
GRUB bootloader is not used.

*******************************************************************************
### How do the launched components prevent execution of unauthenticated code?
*******************************************************************************
All our components are signed with our vendor EV certificate.

*******************************************************************************
### Does your SHIM load any loaders that support loading unsigned kernels (e.g. GRUB2)?
*******************************************************************************
No.

*******************************************************************************
### What kernel are you using? Which patches does it includes to enforce Secure Boot?
*******************************************************************************
Linux Kernel: 6.6.9. (this is the latest stable release)
Includes the latest security patches.

*******************************************************************************
### Add any additional information you think we may need to validate this shim.
*******************************************************************************
file: shim.efi  
sha256: 7409c799415b69dfc6222a844b072f79aa14f5b57f1bea07a442c17d74390b33
