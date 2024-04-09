module "azr_r1_guacamole_vm" {
  source      = "github.com/alexandreweiss/misc-tf-modules/azr-linux-vm-pwd"
  environment = "Guacamole"
  tags = {
    "application" = "Guacamole"
  }
  location            = var.azr_r1_location
  location_short      = var.azr_r1_location_short
  index_number        = 01
  subnet_id           = module.azr_r1_spoke_app1.vpc.public_subnets[1].subnet_id
  resource_group_name = data.aviatrix_vpc.azr_r1_spoke_app1_vpc.resource_group
  customer_name       = var.customer_name
  admin_password      = var.vm_password
  # custom_data         = data.template_cloudinit_config.config.rendered
  custom_data      = base64encode(data.template_file.guacamole_config.rendered)
  enable_public_ip = true
  depends_on = [
  ]
}

data "template_file" "guacamole_config" {
  template = file("${path.module}/3_guacamole.tpl")

  vars = {
    hostname_r1_app1             = module.azr_r1_app1_vm.vm_private_ip
    hostname_r1_app2             = module.azr_r1_app2_vm.vm_private_ip
    hostname_r2_app1             = module.azr_r1_app1_vm.vm_private_ip
    hostname_r2_app2             = module.azr_r1_app2_vm.vm_private_ip
    hostname_r1_spoke_a_app1_nat = var.azr_r1_spoke_app1_nata_advertised_ip
    hostname_r1_spoke_b_app1_nat = var.azr_r1_spoke_app1_natb_advertised_ip
    azr_r1_location_short        = var.azr_r1_location_short
    azr_r2_location_short        = var.azr_r2_location_short
    application_1                = var.application_1
    application_2                = var.application_2
    vm_password                  = var.vm_password
    username                     = "admin-lab"
  }
}

data "template_cloudinit_config" "config" {
  gzip          = true
  base64_encode = true

  part {
    content_type = "text/x-shellscript"
    content      = data.template_file.guacamole_config.rendered
    filename     = "script.sh"
  }
}

