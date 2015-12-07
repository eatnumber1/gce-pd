mount.gce-pd(8) - create and mount a persistent disk, deleting on unmount
=========================================================================

## SYNOPSIS
`mount.gce-pd` <DISK_NAME> <MOUNTPOINT> [-sfnv] -o size=<SIZE>[,<OPTIONS>]
-t gce-pd.<FSTYPE>

## DESCRIPTION
This is a tool designed to be used as a file system type on Linux machines
running on [Google Compute Engine][GCE]. It allows on-mount creation of
[Persistent Disks][PD] and on-unmount deletion of them. This can then be used in
conjunction with Linux's [Automounter], enabling on-demand scratch disks.

## USES
Since Compute Engine charges for disk use on a per-gigabyte basis, if you have
infrequently used jobs which need scratch space, you can use this to
automatically create and delete these disks as needed, thereby reducing cost.

## SCOPES
Because `mount.gce-pd` modifies persistent disks, it needs authorized
credentials to do so. To provide those credentials, create your instance with
the `https://www.googleapis.com/auth/compute` scope (aliased to `compute-rw` in
the `gcloud` CLI). Read [Authorizing Requests to Google Compute Engine][scopes]
for more information about scopes in Google Cloud.

## COMMAND LINE OPTIONS
 * `-t gce-pd.`<FSTYPE>:
   Declare the underlying filesystem to create on new persistent disks. <FSTYPE>
   must be a valid filesystem type which can be created using `mkfs.`<FSTYPE>
   and mounted using `mount -t` <FSTYPE>.

 * `-s`:
   See the `-s` option in mount(8).

 * `-f`:
   See the `-f` option in mount(8).

 * `-n`:
   See the `-n` option in mount(8).

 * `-v`:
   Enable verbose logging. Also see the `-v` option in mount(8).

 * `-o` <MOUNT_OPTIONS>:
   Provide mount options. Options are specified with a `-o` flag followed by a
   comma separated string of options. Also see the section [MOUNT OPTIONS][] and
   the `-o` option in mount(8).

## MOUNT OPTIONS
 * `size=`<SIZE>:
   The size of the persistent disk. Accepts all values accepted by the `--size`
   option of `gcloud compute disks create`. See the
   [gcloud documentation][gcloud compute disks create] for more information.

 * `chmod=`<MODE>:
   Change access permissions on the mounted filesystem after creation. This
   accepts access modes in all valid `MODE` formats of chmod(1).

 * `chown=`<OWNER>[:<GROUP>]:
   Change the owner and group of the mounted filesystem after creation. This
   accepts owner and group in all valid formats of <user-spec> as specified in
   `chown` in the `ZSH/FILES` section of zshmodules(1).

 * `syslog`:
   Log to syslog(3) instead of stderr.

 * `help`:
   Print usage information and exit.

## EXAMPLES
### command line use

    mount media /mnt/media -o size=10GiB -t gce-pd.ext4

### fstab use

    media /mnt/media gce-pd.ext4 size=10GiB 0 0

## AUTHOR
Written by [Russell Harmon].

## SEE ALSO
mount(8), chmod(1), zshmodules(1), syslog(3), [`gcloud compute disks create`][gcloud compute disks create]

[gcloud compute disks create]: https://cloud.google.com/sdk/gcloud/reference/compute/disks/create "gcloud compute disks create"
[Russell Harmon]: http://rus.har.mn
[GCE]: https://cloud.google.com/compute/
[PD]: https://cloud.google.com/compute/docs/disks/
[Automounter]: http://www.linux-consulting.com/Amd_AutoFS/autofs.html
[scopes]: https://cloud.google.com/compute/docs/api/how-tos/authorization
