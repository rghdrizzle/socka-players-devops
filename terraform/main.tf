terraform {
    required_providers{
        azurerm= {
            source ="hashicorp/azurerm"
            version =">=3.0.2"

        }
    }
}

provider azurerm{
    features{}
}

resource "azurerm_resource_group" "rg"{
    name = "socka-rg"
    location = "centralindia"

}

resource "azurerm_kubernetes_cluster" "cluster"{
    name = "socka"
    location = azurerm_resource_group.rg.location
    resource_group_name= azurerm_resource_group.rg.name
    dns_prefix="socka"

    default_node_pool{
        name ="default"
        node_count = "2"
        vm_size = "standard_d2_v2"

        
    }
    identity{
            type= "SystemAssigned"
        }

}