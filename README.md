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

Note that we really only have experience with using GRUB2 on Linux, so asking
us to endorse anything else for signing is going to require some convincing on
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
### Were these binaries created from the 15.7 shim release tar?
Please create your shim binaries starting with the 15.7 shim release tar file: https://github.com/rhboot/shim/releases/download/15.7/shim-15.7.tar.bz2

This matches https://github.com/rhboot/shim/releases/tag/15.7 and contains the appropriate gnu-efi source.

*******************************************************************************
Yes, we use 15.7 shim release https://github.com/rhboot/shim/releases/download/15.7/shim-15.7.tar.bz2

*******************************************************************************
### URL for a repo that contains the exact code which was built to get this binary:
*******************************************************************************
https://github.com/rhboot/shim/releases/tag/15.7

*******************************************************************************
### What patches are being applied and why:
*******************************************************************************
[We need to check if "loader_str" is an actual path or not](https://github.com/rhboot/shim/commit/fc26b47924e6c46e6391552014fc6b4f716f6e65)
Reason for the patch: Because our shim is replacing the windows boot loader: bootmgfw.efi, the paramters sent to windows boot loader cannot be considered a path to secondary boot loader. Our default boot loader is set while building the shim.

*******************************************************************************
### If shim is loading GRUB2 bootloader what exact implementation of Secureboot in GRUB2 do you have? (Either Upstream GRUB2 shim_lock verifier or Downstream RHEL/Fedora/Debian/Canonical-like implementation)
*******************************************************************************
GRUB bootloader is not used

*******************************************************************************
### If shim is loading GRUB2 bootloader and your previously released shim booted a version of grub affected by any of the CVEs in the July 2020 grub2 CVE list, the March 2021 grub2 CVE list, the June 7th 2022 grub2 CVE list, or the November 15th 2022 list, have fixes for all these CVEs been applied?

* CVE-2020-14372
* CVE-2020-25632
* CVE-2020-25647
* CVE-2020-27749
* CVE-2020-27779
* CVE-2021-20225
* CVE-2021-20233
* CVE-2020-10713
* CVE-2020-14308
* CVE-2020-14309
* CVE-2020-14310
* CVE-2020-14311
* CVE-2020-15705
* CVE-2021-3418 (if you are shipping the shim_lock module)

* CVE-2021-3695
* CVE-2021-3696
* CVE-2021-3697
* CVE-2022-28733
* CVE-2022-28734
* CVE-2022-28735
* CVE-2022-28736
* CVE-2022-28737

* CVE-2022-2601
* CVE-2022-3775
*******************************************************************************
GRUB bootloader is not used

*******************************************************************************
### If these fixes have been applied, have you set the global SBAT generation on your GRUB binary to 3?
*******************************************************************************
GRUB bootloader is not used

*******************************************************************************
### Were old shims hashes provided to Microsoft for verification and to be added to future DBX updates?
### Does your new chain of trust disallow booting old GRUB2 builds affected by the CVEs?
*******************************************************************************
We're still using older shim versions 

*******************************************************************************
### If your boot chain of trust includes a Linux kernel:
### Is upstream commit [1957a85b0032a81e6482ca4aab883643b8dae06e "efi: Restrict efivar_ssdt_load when the kernel is locked down"](https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=1957a85b0032a81e6482ca4aab883643b8dae06e) applied?
### Is upstream commit [75b0cea7bf307f362057cc778efe89af4c615354 "ACPI: configfs: Disallow loading ACPI tables when locked down"](https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=75b0cea7bf307f362057cc778efe89af4c615354) applied?
### Is upstream commit [eadb2f47a3ced5c64b23b90fd2a3463f63726066 "lockdown: also lock down previous kgdb use"](https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=eadb2f47a3ced5c64b23b90fd2a3463f63726066) applied?
*******************************************************************************
We are currently running Kernel version 5.5.7. Our intention is to upgrade to the latest kernel version and apply the most recent security patches. However, our current priority is to address the issue involving a certificate mismatch under the shim. Resolving this problem is crucial for unblocking our clients.

It's worth noting that we only utilize the Linux kernel to display a login dialog for user authentication, allowing them to proceed to boot into Windows. We do not grant shell access or permit any actions that involve modifying kernel modules or similar activities.


*******************************************************************************
### Do you build your signed kernel with additional local patches? What do they do?
*******************************************************************************
We build and sign linux kernel locally. No additional local patches.

*******************************************************************************
### Do you use an ephemeral key for signing kernel modules?
### If not, please describe how you ensure that one kernel build does not load modules built for another kernel.
*******************************************************************************
We do not employ ephemeral keys. Our practice does not involve granting shell access to the kernel. Instead, we utilize a minimal kernel configuration with a login dialog exclusively for user authentication purposes.

*******************************************************************************
### If you use vendor_db functionality of providing multiple certificates and/or hashes please briefly describe your certificate setup.
### If there are allow-listed hashes please provide exact binaries for which hashes are created via file sharing service, available in public with anonymous access for verification.
*******************************************************************************
We don't use hashes to verify our own efi binaries.
We use VENDOR_CERT_FILE with one certificate that will be used to verify our efi binearies.

*******************************************************************************
### If you are re-using a previously used (CA) certificate, you will need to add the hashes of the previous GRUB2 binaries exposed to the CVEs to vendor_dbx in shim in order to prevent GRUB2 from being able to chainload those older GRUB2 binaries. If you are changing to a new (CA) certificate, this does not apply.
### Please describe your strategy.
*******************************************************************************
We're changing to a new CA certificate.
GRUB bootloader is not used.

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
### What changes were made since your SHIM was last signed?
*******************************************************************************
`Update shim version to 15.7`
We're not macking changes to the shim, we download the source and build it using the option for VENDOR_CERT_FILE and DEFAULT_LOADER.
We're updating the vendor certificate because the last certificate has expried.

*******************************************************************************
### What is the SHA256 hash of your final SHIM binary?
*******************************************************************************
f75973853cbdbb95190efdc61fd7a044fc6dd61f0138fbeaa0e3ec44d69211ff (sha256sum shim.efi)

*******************************************************************************
### How do you manage and protect the keys used in your SHIM?
*******************************************************************************
The private key, associated with the vendor certificate build with the shim, is saved on an external USB stick that is only available to our internal build machine.

*******************************************************************************
### Do you use EV certificates as embedded certificates in the SHIM?
*******************************************************************************
No. Our certificate is a Code Signing certificate.

*******************************************************************************
### Do you add a vendor-specific SBAT entry to the SBAT section in each binary that supports SBAT metadata ( grub2, fwupd, fwupdate, shim + all child shim binaries )?
### Please provide exact SBAT entries for all SBAT binaries you are booting or planning to boot directly through shim.
### Where your code is only slightly modified from an upstream vendor's, please also preserve their SBAT entries to simplify revocation.
*******************************************************************************
shim.egosecure,1,Matrix42 GmbH,shim,15.4,https://matrix42.com

*******************************************************************************
### Which modules are built into your signed grub image?
*******************************************************************************
GRUB bootloader is not used.

*******************************************************************************
### What is the origin and full version number of your bootloader (GRUB or other)?
*******************************************************************************
GRUB bootloader is not used.
We have a custom boot loader.

*******************************************************************************
### If your SHIM launches any other components, please provide further details on what is launched.
*******************************************************************************
The shim loads our custom loader (the DEFAULT_LOADER provided to the shim). We use a custom second-state loader. According to business logic, the loader can start Microsoft Windows Boot Manager or own Linux Kernel image. All of the files we load are code-signed with the vendor certificate provider to the shim.
To start the loader we create own EFI boot entry.  

*******************************************************************************
### If your GRUB2 launches any other binaries that are not the Linux kernel in SecureBoot mode, please provide further details on what is launched and how it enforces Secureboot lockdown.
*******************************************************************************
GRUB bootloader is not used.

*******************************************************************************
### How do the launched components prevent execution of unauthenticated code?
*******************************************************************************
Yes. all our components are signed with our vendor certificate.

*******************************************************************************
### Does your SHIM load any loaders that support loading unsigned kernels (e.g. GRUB)?
*******************************************************************************
No.

*******************************************************************************
### What kernel are you using? Which patches does it includes to enforce Secure Boot?
*******************************************************************************
Linux kernel 5.5.7, which has the all the required patches to enforce the secure boot

*******************************************************************************
### Add any additional information you think we may need to validate this shim.
*******************************************************************************
file: shim.efi  
sha256: f75973853cbdbb95190efdc61fd7a044fc6dd61f0138fbeaa0e3ec44d69211ff