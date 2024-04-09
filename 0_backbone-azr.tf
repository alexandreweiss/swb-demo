module "azr_transits" {
  source  = "terraform-aviatrix-modules/backbone/aviatrix"
  version = "1.2.2"

  global_settings = {

    transit_accounts = {
      azure = var.azr_account
    }

    transit_ha_gw = false

  }

  transit_firenet = {

    transit-azr-r1 = {
      transit_cloud       = "azure",
      transit_cidr        = var.azr_transit_r1_cidr,
      transit_region_name = var.azr_r1_location,
      transit_asn         = 65101,
      transit_name        = "azr-${var.azr_r1_location_short}-${var.customer_name}-transit"
    },

    transit-azr-r2 = {
      transit_cloud       = "azure",
      transit_cidr        = var.azr_transit_r2_cidr,
      transit_region_name = var.azr_r2_location,
      transit_asn         = 65102,
      transit_name        = "azr-${var.azr_r2_location_short}-${var.customer_name}-transit"
    }
  }
}
