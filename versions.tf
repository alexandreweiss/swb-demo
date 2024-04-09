terraform {
  required_providers {
    aviatrix = {
      source = "aviatrixsystems/aviatrix"
    }
  }
  cloud {
    organization = "ananableu"
    workspaces {
      name = "swb-demo"
    }
  }
}

provider "aviatrix" {
  controller_ip = var.controller_ip
  password      = var.admin_password
  username      = "admin"
}

provider "azurerm" {
  features {

  }
}
