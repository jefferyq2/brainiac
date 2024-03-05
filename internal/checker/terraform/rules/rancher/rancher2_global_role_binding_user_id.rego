# METADATA
# title: Verify Rancher2 Global Role Binding User ID"
# description: "Policy to ensure that the Rancher2 Global Role Binding User ID is defined."
# scope: package
# related_resources:
# - https://registry.terraform.io/providers/rancher/rancher2/latest/docs/resources/global_role_binding
# custom:
#   id: CB_TFRAN_132
#   severity: LOW
package lib.terraform.CB_TFRAN_132

import future.keywords.in

isvalid(block) {
	block.Type == "resource"
	"rancher2_global_role_binding" in block.Labels
}

resource[resource] {
	some block in pass
	resource := concat(".", block.Labels)
}

resource[resource] {
	some block in fail
	resource := concat(".", block.Labels)
}

fail[block] {
	some block in input
	isvalid(block)
	block.Attributes.user_id == ""
}

pass[block] {
	some block in input
	isvalid(block)
	not fail[block]
}

passed[result] {
	some block in pass
	result := {
		"message": "Rancher2 Global Role Binding User ID has been successfully validated and defined.",
		"snippet": block,
	}
}

failed[result] {
	some block in fail
	result := {
		"message": "Failure in Rancher2 Global Role Binding User ID configuration. Ensure that 'user_id' is defined.",
		"snippet": block,
	}
}
