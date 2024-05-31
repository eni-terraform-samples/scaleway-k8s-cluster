output "cluster_kubeconfig" {
  value = nonsensitive(scaleway_k8s_cluster.cluster.kubeconfig[0].config_file)
}
