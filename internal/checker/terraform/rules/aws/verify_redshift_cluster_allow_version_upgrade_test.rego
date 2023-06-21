package lib.terraform.CB_TFAWS_144

test_verify_redshift_cluster_allow_version_upgrade_passed {
    result := passed with input as [
                                    {
                                    "Type": "resource",
                                    "Labels": [
                                    "aws_redshift_cluster",
                                    "example_cluster"
                                    ],
                                    "Attributes": {
                                    "allow_version_upgrade": true
                                    },
                                    "Blocks": [],
                                    "line_range": {
                                    "endLine": 3,
                                    "startLine": 1
                                    }
                                    }
                                    ]
    count(result) == 1
}

test_verify_redshift_cluster_allow_version_upgrade_failed {
    result := failed with input as [
                                    {
                                    "Type": "resource",
                                    "Labels": [
                                    "aws_redshift_cluster",
                                    "example_cluster"
                                    ],
                                    "Attributes": {
                                    "allow_version_upgrade": false
                                    },
                                    "Blocks": [],
                                    "line_range": {
                                    "endLine": 3,
                                    "startLine": 1
                                    }
                                    }
                                    ]
    count(result) == 1
}