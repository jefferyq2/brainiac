package lib.terraform.CB_TFRAN_002

test_rancher2_app_template_version_latest_passed {
	result := passed with input as [{
        "Type": "resource",
        "Labels": [
            "rancher2_app",
            "foo"
        ],
        "Attributes": {
            "answers": {
                "foo": "bar",
                "ingress.annotations.nginx.ingress.kubernetes.io/force-ssl-redirect": true,
                "ingress_host": "test.xip.io"
            },
            "catalog_name": "<catalog_name>",
            "description": "Foo app",
            "name": "foo",
            "project_id": "<project_id>",
            "target_namespace": "<namespace_name>",
            "template_name": "<template_name>",
            "template_version": "latest"
        },
        "Blocks": [],
        "line_range": {
            "endLine": 15,
            "startLine": 2
        }
    }]
count(result) == 1
}

test_rancher2_app_template_version_latest_failed {
	result := failed with input as [{
        "Type": "resource",
        "Labels": [
            "rancher2_app",
            "foo"
        ],
        "Attributes": {
            "answers": {
                "foo": "bar",
                "ingress.annotations.nginx.ingress.kubernetes.io/force-ssl-redirect": true,
                "ingress_host": "test.xip.io"
            },
            "catalog_name": "<catalog_name>",
            "description": "Foo app",
            "name": "foo",
            "project_id": "<project_id>",
            "target_namespace": "<namespace_name>",
            "template_name": "<template_name>",
            "template_version": "<template_version>"
        },
        "Blocks": [],
        "line_range": {
            "endLine": 15,
            "startLine": 2
        }
    }]
count(result) == 1
}
