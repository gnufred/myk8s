# Alpine Vagrant box recipe

Adapted from [rgl/alpine-vagrant](https://github.com/rgl/alpine-vagrant), revision [`a133defae0e38d3228ba895bfe7e551d1a10276c`](https://github.com/rgl/alpine-vagrant/tree/a133defae0e38d3228ba895bfe7e551d1a10276c). The four source files are vendored so upstream changes do not silently change the recipe.

Local changes:

- Alpine standard ISO 3.24.3, verified against the official SHA-256 file: `1629ffe7308d4f3d3eeeed3a97d09ad62293f6d37ef3e483a7306077fdac12be`.
- Arch OVMF firmware paths for Packer and the resulting Vagrant box.
- Packer's HTTP server binds to loopback; the installer accesses it through QEMU user networking's host gateway, `10.0.2.2`.
- US keyboard layout; add Bash and rsync for the lab's shell and synced-folder workflow.
- VNC/Cirrus graphics instead of SPICE/QXL, matching the existing host capabilities; retain the QEMU guest-agent channel.
- Disable the box's default `/vagrant` share instead of requiring an NFS server on the host. The lab defines its own rsync share.

Run `run/build-alpine --check` from the Vagrant lab to initialize the pinned Packer plugins and validate the configuration, or `run/build-alpine` to build it. Packer 1.16+ is the upstream prerequisite. The output and temporary files stay under `.cache/build-alpine/`, which is ignored by Git.

The recipe installs Alpine onto the build VM's disk, creates the `vagrant` account with password `vagrant`, enables passwordless doas, installs Vagrant's initial SSH public key, and locks root. Packer must connect by SSH to run the final provisioning script. The resulting box uses `/bin/ash` and `doas` and includes the QEMU guest agent. It uses UEFI firmware without a shared writable host NVRAM file.

The build requires network access to download the ISO, packages and initial Vagrant public key. The ISO and Packer plugin versions are pinned, but Alpine repository packages are updated at build time. This is not a fully offline or byte-reproducible build. Updating the lab's cached APKs and Kubernetes images is a separate step.

A successful build checks the build VM's SSH/provisioning path; it does not replace a smoke test of the resulting box with Vagrant/libvirt. Register and test the box before changing the lab's existing Vagrantfile. The helper does not register, replace or publish boxes automatically.
