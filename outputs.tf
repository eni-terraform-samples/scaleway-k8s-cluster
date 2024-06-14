output "cluster_kubeconfig" {
  description = "the contents of generated KUBECONFIG file"
  value       = nonsensitive(scaleway_k8s_cluster.cluster.kubeconfig[0].config_file)
}
