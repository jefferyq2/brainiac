package lib.terraform.CB_TFAZR_016

test_azure_mariadb_public_access_disabled_passed {
	result := passed with input as [{
        "Type": "provider",
        "Labels": [
            "azurerm"
        ],
        "Attributes": {},
        "Blocks": [
            {
                "Type": "features",
                "Labels": [],
                "Attributes": {},
                "Blocks": [],
                "line_range": {
                    "endLine": 2,
                    "startLine": 2
                }
            }
        ],
        "line_range": {
            "endLine": 3,
            "startLine": 1
        }
    },
    {
        "Type": "resource",
        "Labels": [
            "azurerm_resource_group",
            "example"
        ],
        "Attributes": {
            "location": "East US",
            "name": "example-resources"
        },
        "Blocks": [],
        "line_range": {
            "endLine": 8,
            "startLine": 5
        }
    },
    {
        "Type": "resource",
        "Labels": [
            "azurerm_mariadb_server",
            "example"
        ],
        "Attributes": {
            "administrator_login": "mariadbadmin",
            "administrator_password": "your_password_here",
            "location": "azurerm_resource_group.example.location",
            "name": "example-mariadb-server",
            "public_network_access_enabled": false,
            "resource_group_name": "azurerm_resource_group.example.name",
            "sku_name": "GP_Gen5_2",
            "storage_mb": "5120"
        },
        "Blocks": [
            {
                "Type": "version",
                "Labels": [],
                "Attributes": {
                    "is_default": true,
                    "name": "10.5"
                },
                "Blocks": [],
                "line_range": {
                    "endLine": 22,
                    "startLine": 19
                }
            }
        ],
        "line_range": {
            "endLine": 25,
            "startLine": 10
        }
    }]
	count(result) == 1
}

test_azure_mariadb_public_access_disabled_failed {
	result := failed with input as [{
        "Type": "provider",
        "Labels": [
            "azurerm"
        ],
        "Attributes": {},
        "Blocks": [
            {
                "Type": "features",
                "Labels": [],
                "Attributes": {},
                "Blocks": [],
                "line_range": {
                    "endLine": 2,
                    "startLine": 2
                }
            }
        ],
        "line_range": {
            "endLine": 3,
            "startLine": 1
        }
    },
    {
        "Type": "resource",
        "Labels": [
            "azurerm_resource_group",
            "example"
        ],
        "Attributes": {
            "location": "East US",
            "name": "example-resources"
        },
        "Blocks": [],
        "line_range": {
            "endLine": 8,
            "startLine": 5
        }
    },
    {
        "Type": "resource",
        "Labels": [
            "azurerm_mariadb_server",
            "example"
        ],
        "Attributes": {
            "administrator_login": "mariadbadmin",
            "administrator_password": "your_password_here",
            "location": "azurerm_resource_group.example.location",
            "name": "example-mariadb-server",
            "public_network_access_enabled": true,
            "resource_group_name": "azurerm_resource_group.example.name",
            "sku_name": "GP_Gen5_2",
            "storage_mb": "5120"
        },
        "Blocks": [
            {
                "Type": "version",
                "Labels": [],
                "Attributes": {
                    "is_default": true,
                    "name": "10.5"
                },
                "Blocks": [],
                "line_range": {
                    "endLine": 22,
                    "startLine": 19
                }
            }
        ],
        "line_range": {
            "endLine": 25,
            "startLine": 10
        }
    }]
	count(result) == 1
}
