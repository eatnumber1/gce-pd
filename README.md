# mount.gce-pd
This is a script that will create a new persistent disk when mounting, and delete the disk after unmount. When combined with Linux's [Automounter] it can be used to create large temporary directories.

## Installation & Usage
1. Install this into `/sbin/mount.gce-pd`.
2. Create a user called `gcloudadm` that has permissions to create, delete and attach PDs
3. `mount -t gce-pd -o size=10GiB disk_name mount_point`

[Automounter]: https://en.wikipedia.org/wiki/Automounter