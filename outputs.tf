
output "bastion_autoscaling_group_ids" {
  value = ["${aws_autoscaling_group.bastions-domain-com.id}"]
}

output "bastion_security_group_ids" {
  value = ["${aws_security_group.bastion-domain-com.id}"]
}

output "bastions_role_arn" {
  value = "${aws_iam_role.bastions-domain-com.arn}"
}

output "bastions_role_name" {
  value = "${aws_iam_role.bastions-domain-com.name}"
}

output "cluster_name" {
  value = "domain.com"
}

output "master_autoscaling_group_ids" {
  value = ["${aws_autoscaling_group.master-eu-west-1a-masters-domain-com.id}", "${aws_autoscaling_group.master-eu-west-1b-masters-domain-com.id}", "${aws_autoscaling_group.master-eu-west-1c-masters-domain-com.id}"]
}

output "master_security_group_ids" {
  value = ["${aws_security_group.masters-domain-com.id}"]
}

output "masters_role_arn" {
  value = "${aws_iam_role.masters-domain-com.arn}"
}

output "masters_role_name" {
  value = "${aws_iam_role.masters-domain-com.name}"
}

output "node_autoscaling_group_ids" {
  value = ["${aws_autoscaling_group.nodes-domain-com.id}"]
}

output "node_security_group_ids" {
  value = ["${aws_security_group.nodes-domain-com.id}"]
}

output "node_subnet_ids" {
  value = ["${aws_subnet.eu-west-1a-domain-com.id}", "${aws_subnet.eu-west-1b-domain-com.id}", "${aws_subnet.eu-west-1c-domain-com.id}"]
}

output "nodes_role_arn" {
  value = "${aws_iam_role.nodes-domain-com.arn}"
}

output "nodes_role_name" {
  value = "${aws_iam_role.nodes-domain-com.name}"
}

output "region" {
  value = "eu-west-1"
}

output "route_table_private-eu-west-1a_id" {
  value = "${aws_route_table.private-eu-west-1a-domain-com.id}"
}

output "route_table_private-eu-west-1b_id" {
  value = "${aws_route_table.private-eu-west-1b-domain-com.id}"
}

output "route_table_private-eu-west-1c_id" {
  value = "${aws_route_table.private-eu-west-1c-domain-com.id}"
}

output "route_table_public_id" {
  value = "${aws_route_table.domain-com.id}"
}

output "subnet_eu-west-1a_id" {
  value = "${aws_subnet.eu-west-1a-domain-com.id}"
}

output "subnet_eu-west-1b_id" {
  value = "${aws_subnet.eu-west-1b-domain-com.id}"
}

output "subnet_eu-west-1c_id" {
  value = "${aws_subnet.eu-west-1c-domain-com.id}"
}

output "subnet_utility-eu-west-1a_id" {
  value = "${aws_subnet.utility-eu-west-1a-domain-com.id}"
}

output "subnet_utility-eu-west-1b_id" {
  value = "${aws_subnet.utility-eu-west-1b-domain-com.id}"
}

output "subnet_utility-eu-west-1c_id" {
  value = "${aws_subnet.utility-eu-west-1c-domain-com.id}"
}

output "vpc_cidr_block" {
  value = "${aws_vpc.domain-com.cidr_block}"
}

output "vpc_id" {
  value = "${aws_vpc.domain-com.id}"
}
