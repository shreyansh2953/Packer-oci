source "oracle-oci" "myoci" {
  availability_domain = "${var.AD}"
  base_image_ocid     = "${var.image_id}"
  region              = "${var.myregion}"
  compartment_ocid    = "${var.COCID}"
  image_name          = "${source.name}-${local.regCode}-GoldenAmiJenkins"
  shape               = "${var.myShape}"
  ssh_username        = "${var.username}"
  subnet_ocid         = "${var.subnetId}"
}

build {
   name = "OciGoldenAMI"
   
   sources = ["source.oracle-oci.myoci"]

   provisioner "shell" {
     script = "./ansible.sh"
   
   }

    provisioner "ansible-local" {
      playbook_file = "./playbook/master.yml"
      role_paths = ["./playbook/roles/jenkins"]
      
    }

    # runs after termination of instance
     post-processor "shell-local" {
      inline = ["echo 'done all tasks' > ./taskCompletion.txt"]
    }


}