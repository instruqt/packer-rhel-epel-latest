variable "project_id" {
    type    = string
}

source "googlecompute" "rhel" {
    project_id          = var.project_id
    source_image_family = "rhel-8"
    ssh_username        = "rhel"
    zone                = "europe-west1-b"
    machine_type        = "n1-standard-2"
    image_name          = "rhel-latest"
}


build {
    sources = ["sources.googlecompute.rhel"]

    provisioner "shell" {
        inline = [
            "sudo dnf install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm",
            "sudo dnf install -y git",
        ]
    }
}
