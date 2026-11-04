packer {
  required_plugins {
    # see https://github.com/hashicorp/packer-plugin-qemu
    qemu = {
      version = "1.1.7"
      source  = "github.com/hashicorp/qemu"
    }
    # see https://github.com/hashicorp/packer-plugin-vagrant
    vagrant = {
      version = "1.1.7"
      source  = "github.com/hashicorp/vagrant"
    }
  }
}

variable "vagrant_box" {
  type = string
}

variable "version" {
  type    = string
  default = "3.24"
}

variable "iso_url" {
  type    = string
  default = "https://dl-cdn.alpinelinux.org/alpine/v3.24/releases/x86_64/alpine-standard-3.24.3-x86_64.iso"
}

variable "iso_checksum" {
  type    = string
  default = "sha256:1629ffe7308d4f3d3eeeed3a97d09ad62293f6d37ef3e483a7306077fdac12be"
}

variable "disk_size" {
  type    = string
  default = 16 * 1024
}

source "qemu" "alpine-uefi-amd64" {
  accelerator       = "kvm"
  machine_type      = "q35"
  efi_boot          = true
  efi_firmware_code = "/usr/share/edk2/x64/OVMF_CODE.4m.fd"
  efi_firmware_vars = "/usr/share/edk2/x64/OVMF_VARS.4m.fd"
  cpus              = 2
  memory            = 2 * 1024
  qemuargs = [
    ["-cpu", "host"],
  ]
  headless          = true
  net_device        = "virtio-net"
  http_directory    = "."
  http_bind_address = "127.0.0.1"
  format            = "qcow2"
  disk_size         = var.disk_size
  disk_interface    = "virtio-scsi"
  disk_cache        = "unsafe"
  disk_discard      = "unmap"
  iso_url           = var.iso_url
  iso_checksum      = var.iso_checksum
  ssh_username      = "vagrant"
  ssh_password      = "vagrant"
  ssh_timeout       = "60m"
  boot_wait         = "30s"
  boot_command = [
    "root<enter>",
    "ifconfig eth0 up && udhcpc -i eth0<enter><wait5s>",
    "wget -qO- http://10.0.2.2:{{.HTTPPort}}/install.sh | ash<enter>"
  ]
  shutdown_command = "doas poweroff"
}

build {
  sources = [
    "source.qemu.alpine-uefi-amd64"
  ]

  provisioner "shell" {
    execute_command = "doas sh {{.Path}}"
    scripts         = ["provision.sh"]
  }

  post-processor "vagrant" {
    output               = var.vagrant_box
    vagrantfile_template = "Vagrantfile-uefi.template"
  }
}
