//orasenatdoracledigital01
/* provider "oci" {
  tenancy_ocid = "ocid1.tenancy.oc1..aaaaaaaaplkmid2untpzjcxrmbv4nowe74yb4lr6idtckwo4wyf7jh23be4q"
  user_ocid = "ocid1.user.oc1..aaaaaaaaxfvwia5gfb2t2bkhjaqbddcuwzy7zikq3bpljhro3kf6cmrx2xhq"
  fingerprint = "f9:68:92:b2:26:5f:60:df:25:2d:34:64:f9:9d:e1:49"
  private_key_path = "/Users/edecerva/.oci/oci_api_key.pem"
  region = "us-ashburn-1"
} */

variable "tenancy_ocid" {}
variable "user_ocid" {}
variable "fingerprint" {}
variable "private_key_path" {}
variable "region" {}


//ederpersonalprojects
provider "oci" {
  version = ">= 3.0.0"
  tenancy_ocid = "${var.tenancy_ocid}"
  user_ocid = "${var.user_ocid}"
  fingerprint = "${var.fingerprint}"
  private_key_path = "${var.private_key_path}"
  region = "${var.region}"
}