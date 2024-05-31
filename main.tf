# scaleway cluster needs a private network
resource "scaleway_vpc_private_network" "network" {}

# getting lastest supported k8s version
data "scaleway_k8s_version" "latest" {
  name   = "latest"
  region = "fr-par"
}

resource "scaleway_k8s_cluster" "cluster" {
  name = var.cluster_name

  # versions have the form region/version, so trimming the region part
  version = trimprefix(data.scaleway_k8s_version.latest.id, "fr-par/")
  cni     = "cilium"

  region = "fr-par"

  # referencing the created network
  private_network_id = scaleway_vpc_private_network.network.id

  # set to true to delete all that wes created when destroying the cluster
  delete_additional_resources = true
}

resource "scaleway_k8s_pool" "pool" {
  # referencing the created cluster id
  cluster_id = scaleway_k8s_cluster.cluster.id

  name      = "dev1-m-pool"
  node_type = var.node_type
  size      = var.node_count
}
