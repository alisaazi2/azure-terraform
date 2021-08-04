data "azuread_domains" "aad_domains" {}



output "domains" {
	value = data.azuread_domains.aad_domains.domains[0].domain_name
}


resource "random_password" "password" {
	length = 30
	special = false
	override_special = "_%@"
}



resource "azuread_user" "john" {
  user_principal_name = "jdoe@${data.azuread_domains.aad_domains.domains[0].domain_name}"
  display_name        = "J. Doe"
  mail_nickname       = "jdoe"
  password            = random_password.password.result
  city                = "Chicago"
  mobile_phone        ="3129375307"

}