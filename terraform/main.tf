terraform {
  cloud {
    organization = "socka"
    workspaces {
      name = "socka-tf"
    }
  }
 provider "kubernetes" {
   kubeconfig = "${local_file.kubeconfig-dev.content}"
}
}
module "dev_cluster"{
    source ="./main"
    env_name = "dev"
    cluster_name="socka"
    instance_type= "standard_d2_v2"

}
module "prod_cluster"{
    source ="./main"
    env_name = "prod"
    cluster_name="socka"
    instance_type= "standard_d2_v2"

}
