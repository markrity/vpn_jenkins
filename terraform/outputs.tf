### OPENVPN
output "openvpn_ec2_instance_dns" {
  value = aws_instance.openvpn.public_dns
}

output "openvpn_ec2_instance_ip" {
  value = aws_instance.openvpn.public_ip
}

output "openvpn_connection_string" {
  value = "'ssh -i ${var.ssh_private_key_file} ${var.ec2_username}@${aws_instance.openvpn.public_dns}'"
}

### JENKINS 
output "jenkins_ec2_instance_dns" {
  value = aws_instance.jenkins.public_dns
}

output "jenkins_ec2_instance_ip" {
  value = aws_instance.jenkins.public_ip
}

output "jenkins_connection_string" {
  value = "'ssh -i ${var.ssh_private_key_file} ${var.ec2_username}@${aws_instance.jenkins.public_dns}'"
}

