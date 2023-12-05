output "control_plane_instance_id" {
  description = "The ID of the control plane instance"
  value       = aws_instance.k8s_instance_control_plane.id
}

output "control_plane_public_ip" {
  description = "The public IP address of the control plane instance"
  value       = aws_instance.k8s_instance_control_plane.public_ip
}

output "worker_instance_ids" {
  description = "The IDs of the worker instances"
  value       = aws_instance.k8s_instance_workers[*].id
}

output "worker_public_ips" {
  description = "The public IP addresses of the worker instances"
  value       = aws_instance.k8s_instance_workers[*].public_ip
}