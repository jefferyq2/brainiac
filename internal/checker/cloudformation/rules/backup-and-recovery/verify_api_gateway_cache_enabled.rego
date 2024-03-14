# METADATA
# title: "Verify that API Gateway caching is enabled"
# description: "Checks if all methods in your API Gateway stage have caching enabled. Caching reduces the number of calls to your backend service and improves API response times for your users."
# scope: package
# related_resources:
# - https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-apigateway-stage.html
# custom:
#   id: CB_CFT_089
#   severity: LOW
package lib.cloudformation.CB_CFT_089

import future.keywords.in

is_valid {
	supported_resources := ["AWS::ApiGateway::Stage", "AWS::Serverless::Api"]
	some resources in input.Resources
	resources.Type in supported_resources
}

resource[type] {
	some resource in input.Resources
	is_valid
	count(fail) > 0
	type := resource.Type
}

resource[type] {
	some resource in input.Resources
	is_valid
	count(pass) > 0
	type := resource.Type
}

pass[block] {
	is_valid
	some resources in input.Resources
	block := resources.Properties
	block.CacheClusterEnabled == true
}

fail[resources] {
	some resources in input.Resources
	is_valid
	count(pass) == 0
}

passed[result] {
	some block in pass
	result := {
		"message": "API Gateway caching is enabled.",
		"snippet": block,
	}
}

failed[result] {
	some block in fail
	result := {
		"message": "API Gateway caching is disabled.",
		"snippet": block,
	}
}
