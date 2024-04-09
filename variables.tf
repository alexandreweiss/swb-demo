variable "customer_name" {
  description = "Name of customer to be used in resources"
  default     = "contoso"
}

variable "remote_connect_src_ip_r1" {
  description = "Source IP to allow Instance connect"
  default     = ["18.206.107.24/29"]
}

variable "azr_r1_location" {
  default     = "West Europe"
  description = "region to deploy resources"
  type        = string
}

variable "azr_r1_location_short" {
  default     = "we"
  description = "region to deploy resources"
  type        = string
}

variable "azr_transit_r1_cidr" {
  description = "CIDR block allocated to transit in region r1"
  default     = "10.10.0.0/23"
}

variable "azr_r1_spoke_app1_cidr" {
  description = "CIDR block allocated to spoke 1 in region r1"
  default     = "10.11.0.0/24"
}

variable "azr_r1_spoke_app2_cidr" {
  description = "CIDR block allocated to spoke 2 in region r1"
  default     = "10.12.0.0/24"
}

variable "azr_r1_spoke_app1_nat_cidr" {
  description = "CIDR block allocated to spoke for app1 NATed in region r1"
  default     = "10.13.0.0/24"
}

variable "azr_r1_spoke_app1_nata_advertised_ip" {
  description = "For that spoke, the virtual IP we advertise to hide internal CIDR"
  default     = "172.20.20.22"
}

variable "azr_r1_spoke_app1_natb_advertised_ip" {
  description = "For that spoke, the virtual IP we advertise to hide internal CIDR"
  default     = "172.20.20.23"
}

variable "remote_connect_src_ip_r2" {
  description = "Source IP to allow Instance connect"
  default     = ["18.228.70.32/29"]
}

variable "azr_r2_location" {
  default     = "France Central"
  description = "region to deploy resources"
  type        = string
}

variable "azr_r2_location_short" {
  default     = "frc"
  description = "region to deploy resources"
  type        = string
}

variable "azr_transit_r2_cidr" {
  description = "CIDR block allocated to transit in region r2"
  default     = "10.20.0.0/23"
}

variable "azr_r2_spoke_app1_cidr" {
  description = "CIDR block allocated to transit in region r2"
  default     = "10.21.0.0/24"
}


variable "azr_r2_spoke_app2_cidr" {
  description = "CIDR block allocated to transit in region r2"
  default     = "10.22.0.0/24"
}

variable "source_ip_cidrs" {
  description = "Source IP CIDRs to allow inbound connection to Guacamole"
  type        = list(string)
}

variable "application_1" {
  description = "Name of application 1"
  default     = "MyApp1"
}

variable "application_2" {
  description = "Name of application 2"
  default     = "MyApp2"
}

variable "admin_password" {
  sensitive   = true
  description = "Admin password"
}

variable "vm_password" {
  sensitive   = true
  description = "VM password"
}

variable "azr_account" {
  description = "Name of the AWS account onboarded to controller"
}

variable "controller_ip" {
  description = "IP or FQDN of the target Aviatrix controller"
  type        = string
}

