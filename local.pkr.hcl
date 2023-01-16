locals {
    regCode = "${split(".",var.image_id)[3]}"
}