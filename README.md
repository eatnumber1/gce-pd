# mount.gce-pd
This is a tool designed to be used as a file system type on Linux machines
running on [Google Compute Engine][GCE]. It allows on-mount creation of
[Persistent Disks][PD] and on-unmount deletion of them. This can then be used in
conjunction with Linux's [Automounter], enabling on-demand scratch disks.

See [mount.gce-pd(8)] for more information.

## Installation
Just run `sudo make install`.

[Automounter]: http://www.linux-consulting.com/Amd_AutoFS/autofs.html
[GCE]: https://cloud.google.com/compute/
[mount.gce-pd(8)]: http://eatnumber1.github.io/gce-pd/mount.gce-pd.8.html
[PD]: https://cloud.google.com/compute/docs/disks/
