
variable "image_id" {
  type        = string
  description = "The ID of the machine image (AMI) to use for the server."

  validation {
    condition     = length(var.image_id) > 4 && substr(var.image_id, 0, 16) == "ocid1.image.oc1."
    error_message = "The image_id value must be a valid Image ID, starting with \"ocid1.image.oc1.\"."
  }
}

variable "myregion" {
    type        = string
    description = "region were image will be published"
    default     = "ap-mumbai-1"
}

variable "AD" {
    type        = string
    description = "availability domain"

}

variable "COCID" {
    type        = string
    description = "Compartment OCID"

}

variable "myShape" {
    type        = string
    description = "Shape Name"
    default = "VM.Standard.E2.1.Micro"

}

variable "subnetId"  {
    type        = string
    description = "Subnet OCID"

    validation {
     condition     =  substr(var.subnetId, 0, 17) == "ocid1.subnet.oc1."
     error_message = "Pass a Valid subnet ocid starting with \"ocid1.subnet.oc1.\"."
    }
}

variable "username" {
    type        = string
    description = "SSH username"
}