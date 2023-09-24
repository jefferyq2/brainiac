# METADATA
# title: "Monitors the performance of a web application running on Linux"
# description: "Manages the operation and maintenance of a web application running on a Linux server"
# related_resources:
# - https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_web_app
# - https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/windows_web_app
# custom:
#   id: CB_TFAZR_045
#   severity: MEDIUM
package lib.terraform.CB_TFAZR_045

supportedResource := [
	"azurerm_linux_web_app",
	"azurerm_windows_web_app",
]

isvalid(block) {
	block.Type == "resource"
	block.Labels[_] == supportedResource[_]
}

pass[resource] {
	resource := input[_]
	isvalid(resource)
	innerBlock := resource.Blocks[_]
	innerBlock.Type == "site_config"
	innerBlock.Attributes != null
}

fail[resource] {
	resource := input[_]
	isvalid(resource)
	not pass[resource]
}

passed[result] {
	block := pass[_]
	result := {
		"message": "Azure App Service is set to be always on.",
		"snippet": block,
	}
}

failed[result] {
	block := fail[_]
	result := {
		"message": "Azure App Service is not set to be always on.",
		"snippet": block,
	}
}
