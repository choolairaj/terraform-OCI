
resource "oci_core_instance" "developer_instance" {
  availability_domain = "${data.oci_identity_availability_domain.ad.name}"
  compartment_id      = "${oci_identity_compartment.python4dev.id}"
  display_name        = "${var.instance_display_name}"
  shape               = "${var.instance_shape}"

  metadata = {
    ssh_authorized_keys = "${file("/Users/edecerva/.ssh/id_rsa.pub")}"
  }

  source_details {
    source_type = "image"
    source_id   = "${lookup(data.oci_core_app_catalog_subscriptions.CloudDevImg_catalog_subscriptions.app_catalog_subscriptions[0], "listing_resource_id")}"
    //source_id   = "${var.instance_image_ocid[var.region]}"  WORKS FOR SURE
  }

  create_vnic_details {
    assign_public_ip = true
    display_name     = "primaryVnic"
    subnet_id        = "${oci_core_subnet.test_subnet.id}"
    hostname_label   = "instance"
  }
}

/* data "oci_core_vnic_attachments" "instance_vnics" {
  compartment_id      = "${oci_identity_compartment.python4dev.id}"
  availability_domain = "${data.oci_identity_availability_domain.ad.name}"
  instance_id         = "${oci_core_instance.developer_instance.id}"
}

data "oci_core_vnic" "instance_vnic1" {
  vnic_id = "${lookup(data.oci_core_vnic_attachments.instance_vnics.vnic_attachments[0],"vnic_id")}"
}

data "oci_core_private_ips" "private_ips1" {
  vnic_id = "${data.oci_core_vnic.instance_vnic1.id}"
}

resource "oci_core_public_ip" "ephemeral_public_ip_assigned" {
  compartment_id = "${oci_identity_compartment.python4dev.id}"
  display_name   = "ephemeralPublicIPAssigned"
  lifetime       = "EPHEMERAL"
  private_ip_id  = "${lookup(data.oci_core_private_ips.private_ips1.private_ips[0],"id")}"
} */