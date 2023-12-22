# METADATA
# title: "Avoid allowing containers that intend to distribute the host network namespace"
# description: "Mitigate security risks by restricting the admission of containers designed to distribute the host network namespace. This precautionary measure enhances isolation between containers and bolsters overall system security."
# scope: package
# related_resources:
# - https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/deployment
# custom:
#   id: CB_TFK8S_038
#   severity: MEDIUM
package lib.terraform.CB_TFK8S_038

import future.keywords.in

isvalid(block) {
	supported_resources := ["kubernetes_deployment", "kubernetes_deployment_v1"]
	block.Type == "resource"
	some label in block.Labels
	label in supported_resources
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
	block.Type == "resource"
	isvalid(block)
	some inner_block in block.Blocks
	inner_block.Type == "spec"
	some template_block in inner_block.Blocks
	template_block.Type == "template"
	some spec_block in template_block.Blocks
	spec_block.Type == "spec"
	spec_block.Attributes.host_network == true
}

pass[block] {
	some block in input
	isvalid(block)
	not fail[block]
}

passed[result] {
	some block in pass
	result := {
		"message": "Containers that intend to distribute the host network namespace are not found.",
		"snippet": block,
	}
}

failed[result] {
	some block in fail
	result := {
		"message": "Containers that intend to distribute the host network namespace is not allowed.",
		"snippet": block,
	}
}
