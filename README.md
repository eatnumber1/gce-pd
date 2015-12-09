# mount.gce-pd
This is a tool designed to be used as a file system type on Linux machines
running on [Google Compute Engine][GCE]. It allows on-mount creation of
[Persistent Disks][PD] and on-unmount deletion of them. This can then be used in
conjunction with Linux's [Automount], enabling on-demand scratch disks.

See [mount.gce-pd(8)] for more information.

## Dependencies
In order to run `mount.gce-pd`, you must install:

 * [cURL]
 * [gcloud] - installed by default on default [Compute Engine][GCE] images
 * [GNU Coreutils]
 * `mkfs.FSTYPE` for your chosen filesystem type
 * [inotify-tools] - for `inotifywait`
 * [util-linux] - for `blkid`
 * [ZSH]

## Installation
Just run `sudo make install`.

[Automount]: http://www.linux-consulting.com/Amd_AutoFS/autofs.html
[cURL]: http://curl.haxx.se/
[GCE]: https://cloud.google.com/compute/
[gcloud]: https://cloud.google.com/sdk/gcloud/
[GNU Coreutils]: http://www.gnu.org/software/coreutils/coreutils.html
[inotify-tools]: https://github.com/rvoicilas/inotify-tools
[mount.gce-pd(8)]: http://eatnumber1.github.io/gce-pd/mount.gce-pd.8.html
[PD]: https://cloud.google.com/compute/docs/disks/
[util-linux]: https://git.kernel.org/cgit/utils/util-linux/util-linux.git/
[ZSH]: http://www.zsh.org/
