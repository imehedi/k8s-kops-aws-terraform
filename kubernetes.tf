terraform = {
  required_version = ">= 0.9.3"
  backend "s3" {
  bucket = "mybucket"
  key    = "path/to/my/key"
  region = "us-east-1"
  }
}
provider "aws" {
  region = "eu-west-1"
}

resource "aws_autoscaling_attachment" "bastions-domain-com" {
  elb                    = "${aws_elb.bastion-domain-com.id}"
  autoscaling_group_name = "${aws_autoscaling_group.bastions-domain-com.id}"
}

resource "aws_autoscaling_attachment" "master-eu-west-1a-masters-domain-com" {
  elb                    = "${aws_elb.api-domain-com.id}"
  autoscaling_group_name = "${aws_autoscaling_group.master-eu-west-1a-masters-domain-com.id}"
}

resource "aws_autoscaling_attachment" "master-eu-west-1b-masters-domain-com" {
  elb                    = "${aws_elb.api-domain-com.id}"
  autoscaling_group_name = "${aws_autoscaling_group.master-eu-west-1b-masters-domain-com.id}"
}

resource "aws_autoscaling_attachment" "master-eu-west-1c-masters-domain-com" {
  elb                    = "${aws_elb.api-domain-com.id}"
  autoscaling_group_name = "${aws_autoscaling_group.master-eu-west-1c-masters-domain-com.id}"
}

resource "aws_autoscaling_group" "bastions-domain-com" {
  name                 = "bastions.domain.com"
  launch_configuration = "${aws_launch_configuration.bastions-domain-com.id}"
  max_size             = 1
  min_size             = 1
  vpc_zone_identifier  = ["${aws_subnet.utility-eu-west-1a-domain-com.id}", "${aws_subnet.utility-eu-west-1b-domain-com.id}", "${aws_subnet.utility-eu-west-1c-domain-com.id}"]

  tag = {
    key                 = "KubernetesCluster"
    value               = "domain.com"
    propagate_at_launch = true
  }

  tag = {
    key                 = "Name"
    value               = "bastions.domain.com"
    propagate_at_launch = true
  }

  tag = {
    key                 = "k8s.io/cluster-autoscaler/node-template/label/kops.k8s.io/instancegroup"
    value               = "bastions"
    propagate_at_launch = true
  }

  tag = {
    key                 = "k8s.io/role/bastion"
    value               = "1"
    propagate_at_launch = true
  }

  metrics_granularity = "1Minute"
  enabled_metrics     = ["GroupDesiredCapacity", "GroupInServiceInstances", "GroupMaxSize", "GroupMinSize", "GroupPendingInstances", "GroupStandbyInstances", "GroupTerminatingInstances", "GroupTotalInstances"]
}

resource "aws_autoscaling_group" "master-eu-west-1a-masters-domain-com" {
  name                 = "master-eu-west-1a.masters.domain.com"
  launch_configuration = "${aws_launch_configuration.master-eu-west-1a-masters-domain-com.id}"
  max_size             = 1
  min_size             = 1
  vpc_zone_identifier  = ["${aws_subnet.eu-west-1a-domain-com.id}"]

  tag = {
    key                 = "KubernetesCluster"
    value               = "domain.com"
    propagate_at_launch = true
  }

  tag = {
    key                 = "Name"
    value               = "master-eu-west-1a.masters.domain.com"
    propagate_at_launch = true
  }

  tag = {
    key                 = "k8s.io/cluster-autoscaler/node-template/label/kops.k8s.io/instancegroup"
    value               = "master-eu-west-1a"
    propagate_at_launch = true
  }

  tag = {
    key                 = "k8s.io/role/master"
    value               = "1"
    propagate_at_launch = true
  }

  metrics_granularity = "1Minute"
  enabled_metrics     = ["GroupDesiredCapacity", "GroupInServiceInstances", "GroupMaxSize", "GroupMinSize", "GroupPendingInstances", "GroupStandbyInstances", "GroupTerminatingInstances", "GroupTotalInstances"]
}

resource "aws_autoscaling_group" "master-eu-west-1b-masters-domain-com" {
  name                 = "master-eu-west-1b.masters.domain.com"
  launch_configuration = "${aws_launch_configuration.master-eu-west-1b-masters-domain-com.id}"
  max_size             = 1
  min_size             = 1
  vpc_zone_identifier  = ["${aws_subnet.eu-west-1b-domain-com.id}"]

  tag = {
    key                 = "KubernetesCluster"
    value               = "domain.com"
    propagate_at_launch = true
  }

  tag = {
    key                 = "Name"
    value               = "master-eu-west-1b.masters.domain.com"
    propagate_at_launch = true
  }

  tag = {
    key                 = "k8s.io/cluster-autoscaler/node-template/label/kops.k8s.io/instancegroup"
    value               = "master-eu-west-1b"
    propagate_at_launch = true
  }

  tag = {
    key                 = "k8s.io/role/master"
    value               = "1"
    propagate_at_launch = true
  }

  metrics_granularity = "1Minute"
  enabled_metrics     = ["GroupDesiredCapacity", "GroupInServiceInstances", "GroupMaxSize", "GroupMinSize", "GroupPendingInstances", "GroupStandbyInstances", "GroupTerminatingInstances", "GroupTotalInstances"]
}

resource "aws_autoscaling_group" "master-eu-west-1c-masters-domain-com" {
  name                 = "master-eu-west-1c.masters.domain.com"
  launch_configuration = "${aws_launch_configuration.master-eu-west-1c-masters-domain-com.id}"
  max_size             = 1
  min_size             = 1
  vpc_zone_identifier  = ["${aws_subnet.eu-west-1c-domain-com.id}"]

  tag = {
    key                 = "KubernetesCluster"
    value               = "domain.com"
    propagate_at_launch = true
  }

  tag = {
    key                 = "Name"
    value               = "master-eu-west-1c.masters.domain.com"
    propagate_at_launch = true
  }

  tag = {
    key                 = "k8s.io/cluster-autoscaler/node-template/label/kops.k8s.io/instancegroup"
    value               = "master-eu-west-1c"
    propagate_at_launch = true
  }

  tag = {
    key                 = "k8s.io/role/master"
    value               = "1"
    propagate_at_launch = true
  }

  metrics_granularity = "1Minute"
  enabled_metrics     = ["GroupDesiredCapacity", "GroupInServiceInstances", "GroupMaxSize", "GroupMinSize", "GroupPendingInstances", "GroupStandbyInstances", "GroupTerminatingInstances", "GroupTotalInstances"]
}

resource "aws_autoscaling_group" "nodes-domain-com" {
  name                 = "nodes.domain.com"
  launch_configuration = "${aws_launch_configuration.nodes-domain-com.id}"
  max_size             = 3
  min_size             = 3
  vpc_zone_identifier  = ["${aws_subnet.eu-west-1a-domain-com.id}", "${aws_subnet.eu-west-1b-domain-com.id}", "${aws_subnet.eu-west-1c-domain-com.id}"]

  tag = {
    key                 = "KubernetesCluster"
    value               = "domain.com"
    propagate_at_launch = true
  }

  tag = {
    key                 = "Name"
    value               = "nodes.domain.com"
    propagate_at_launch = true
  }

  tag = {
    key                 = "k8s.io/cluster-autoscaler/node-template/label/kops.k8s.io/instancegroup"
    value               = "nodes"
    propagate_at_launch = true
  }

  tag = {
    key                 = "k8s.io/role/node"
    value               = "1"
    propagate_at_launch = true
  }

  metrics_granularity = "1Minute"
  enabled_metrics     = ["GroupDesiredCapacity", "GroupInServiceInstances", "GroupMaxSize", "GroupMinSize", "GroupPendingInstances", "GroupStandbyInstances", "GroupTerminatingInstances", "GroupTotalInstances"]
}

resource "aws_ebs_volume" "a-etcd-events-domain-com" {
  availability_zone = "eu-west-1a"
  size              = 20
  type              = "gp2"
  encrypted         = true

  tags = {
    KubernetesCluster                 = "domain.com"
    Name                              = "a.etcd-events.domain.com"
    "k8s.io/etcd/events"              = "a/a,b,c"
    "k8s.io/role/master"              = "1"
    "kubernetes.io/cluster/domain.com" = "owned"
  }
}

resource "aws_ebs_volume" "a-etcd-main-domain-com" {
  availability_zone = "eu-west-1a"
  size              = 20
  type              = "gp2"
  encrypted         = true

  tags = {
    KubernetesCluster                 = "domain.com"
    Name                              = "a.etcd-main.domain.com"
    "k8s.io/etcd/main"                = "a/a,b,c"
    "k8s.io/role/master"              = "1"
    "kubernetes.io/cluster/domain.com" = "owned"
  }
}

resource "aws_ebs_volume" "b-etcd-events-domain-com" {
  availability_zone = "eu-west-1b"
  size              = 20
  type              = "gp2"
  encrypted         = true

  tags = {
    KubernetesCluster                 = "domain.com"
    Name                              = "b.etcd-events.domain.com"
    "k8s.io/etcd/events"              = "b/a,b,c"
    "k8s.io/role/master"              = "1"
    "kubernetes.io/cluster/domain.com" = "owned"
  }
}

resource "aws_ebs_volume" "b-etcd-main-domain-com" {
  availability_zone = "eu-west-1b"
  size              = 20
  type              = "gp2"
  encrypted         = true

  tags = {
    KubernetesCluster                 = "domain.com"
    Name                              = "b.etcd-main.domain.com"
    "k8s.io/etcd/main"                = "b/a,b,c"
    "k8s.io/role/master"              = "1"
    "kubernetes.io/cluster/domain.com" = "owned"
  }
}

resource "aws_ebs_volume" "c-etcd-events-domain-com" {
  availability_zone = "eu-west-1c"
  size              = 20
  type              = "gp2"
  encrypted         = true

  tags = {
    KubernetesCluster                 = "domain.com"
    Name                              = "c.etcd-events.domain.com"
    "k8s.io/etcd/events"              = "c/a,b,c"
    "k8s.io/role/master"              = "1"
    "kubernetes.io/cluster/domain.com" = "owned"
  }
}

resource "aws_ebs_volume" "c-etcd-main-domain-com" {
  availability_zone = "eu-west-1c"
  size              = 20
  type              = "gp2"
  encrypted         = true

  tags = {
    KubernetesCluster                 = "domain.com"
    Name                              = "c.etcd-main.domain.com"
    "k8s.io/etcd/main"                = "c/a,b,c"
    "k8s.io/role/master"              = "1"
    "kubernetes.io/cluster/domain.com" = "owned"
  }
}

resource "aws_eip" "eu-west-1a-domain-com" {
  vpc = true

  tags = {
    KubernetesCluster                 = "domain.com"
    Name                              = "eu-west-1a.domain.com"
    "kubernetes.io/cluster/domain.com" = "owned"
  }
}

resource "aws_eip" "eu-west-1b-domain-com" {
  vpc = true

  tags = {
    KubernetesCluster                 = "domain.com"
    Name                              = "eu-west-1b.domain.com"
    "kubernetes.io/cluster/domain.com" = "owned"
  }
}

resource "aws_eip" "eu-west-1c-domain-com" {
  vpc = true

  tags = {
    KubernetesCluster                 = "domain.com"
    Name                              = "eu-west-1c.domain.com"
    "kubernetes.io/cluster/domain.com" = "owned"
  }
}

resource "aws_elb" "api-domain-com" {
  name = "api-domain-com-his23v"

  listener = {
    instance_port     = 443
    instance_protocol = "TCP"
    lb_port           = 443
    lb_protocol       = "TCP"
  }

  security_groups = ["${aws_security_group.api-elb-domain-com.id}"]
  subnets         = ["${aws_subnet.eu-west-1a-domain-com.id}", "${aws_subnet.eu-west-1b-domain-com.id}", "${aws_subnet.eu-west-1c-domain-com.id}"]
  internal        = true

  health_check = {
    target              = "SSL:443"
    healthy_threshold   = 2
    unhealthy_threshold = 2
    interval            = 10
    timeout             = 5
  }

  idle_timeout = 300

  tags = {
    KubernetesCluster = "domain.com"
    Name              = "api.domain.com"
  }
}

resource "aws_elb" "bastion-domain-com" {
  name = "bastion-domain-com-fk46pp"

  listener = {
    instance_port     = 22
    instance_protocol = "TCP"
    lb_port           = 22
    lb_protocol       = "TCP"
  }

  security_groups = ["${aws_security_group.bastion-elb-domain-com.id}"]
  subnets         = ["${aws_subnet.utility-eu-west-1a-domain-com.id}", "${aws_subnet.utility-eu-west-1b-domain-com.id}", "${aws_subnet.utility-eu-west-1c-domain-com.id}"]

  health_check = {
    target              = "TCP:22"
    healthy_threshold   = 2
    unhealthy_threshold = 2
    interval            = 10
    timeout             = 5
  }

  idle_timeout = 300

  tags = {
    KubernetesCluster = "domain.com"
    Name              = "bastion.domain.com"
  }
}

resource "aws_iam_instance_profile" "bastions-domain-com" {
  name = "bastions.domain.com"
  role = "${aws_iam_role.bastions-domain-com.name}"
}

resource "aws_iam_instance_profile" "masters-domain-com" {
  name = "masters.domain.com"
  role = "${aws_iam_role.masters-domain-com.name}"
}

resource "aws_iam_instance_profile" "nodes-domain-com" {
  name = "nodes.domain.com"
  role = "${aws_iam_role.nodes-domain-com.name}"
}

resource "aws_iam_role" "bastions-domain-com" {
  name               = "bastions.domain.com"
  assume_role_policy = "${file("${path.module}/data/aws_iam_role_bastions.domain.com_policy")}"
}

resource "aws_iam_role" "masters-domain-com" {
  name               = "masters.domain.com"
  assume_role_policy = "${file("${path.module}/data/aws_iam_role_masters.domain.com_policy")}"
}

resource "aws_iam_role" "nodes-domain-com" {
  name               = "nodes.domain.com"
  assume_role_policy = "${file("${path.module}/data/aws_iam_role_nodes.domain.com_policy")}"
}

resource "aws_iam_role_policy" "bastions-domain-com" {
  name   = "bastions.domain.com"
  role   = "${aws_iam_role.bastions-domain-com.name}"
  policy = "${file("${path.module}/data/aws_iam_role_policy_bastions.domain.com_policy")}"
}

resource "aws_iam_role_policy" "masters-domain-com" {
  name   = "masters.domain.com"
  role   = "${aws_iam_role.masters-domain-com.name}"
  policy = "${file("${path.module}/data/aws_iam_role_policy_masters.domain.com_policy")}"
}

resource "aws_iam_role_policy" "nodes-domain-com" {
  name   = "nodes.domain.com"
  role   = "${aws_iam_role.nodes-domain-com.name}"
  policy = "${file("${path.module}/data/aws_iam_role_policy_nodes.domain.com_policy")}"
}

resource "aws_internet_gateway" "domain-com" {
  vpc_id = "${aws_vpc.domain-com.id}"

  tags = {
    KubernetesCluster                 = "domain.com"
    Name                              = "domain.com"
    "kubernetes.io/cluster/domain.com" = "owned"
  }
}

resource "aws_key_pair" "kubernetes-domain-com-b3e6f1df7d7263ae2d6f9a1748330c2d" {
  key_name   = "kubernetes.domain.com-b3:e6:f1:df:7d:72:63:ae:2d:6f:9a:17:48:33:0c:2d"
  public_key = "${file("${path.module}/data/aws_key_pair_kubernetes.domain.com-b3e6f1df7d7263ae2d6f9a1748330c2d_public_key")}"
}

resource "aws_launch_configuration" "bastions-domain-com" {
  name_prefix                 = "bastions.domain.com-"
  image_id                    = "ami-09b955ecb52ae9bcf"
  instance_type               = "t2.micro"
  key_name                    = "${aws_key_pair.kubernetes-domain-com-b3e6f1df7d7263ae2d6f9a1748330c2d.id}"
  iam_instance_profile        = "${aws_iam_instance_profile.bastions-domain-com.id}"
  security_groups             = ["${aws_security_group.bastion-domain-com.id}"]
  associate_public_ip_address = true

  root_block_device = {
    volume_type           = "gp2"
    volume_size           = 32
    delete_on_termination = true
  }

  lifecycle = {
    create_before_destroy = true
  }

  enable_monitoring = false
}

resource "aws_launch_configuration" "master-eu-west-1a-masters-domain-com" {
  name_prefix                 = "master-eu-west-1a.masters.domain.com-"
  image_id                    = "ami-09b955ecb52ae9bcf"
  instance_type               = "t2.micro"
  key_name                    = "${aws_key_pair.kubernetes-domain-com-b3e6f1df7d7263ae2d6f9a1748330c2d.id}"
  iam_instance_profile        = "${aws_iam_instance_profile.masters-domain-com.id}"
  security_groups             = ["${aws_security_group.masters-domain-com.id}"]
  associate_public_ip_address = false
  user_data                   = "${file("${path.module}/data/aws_launch_configuration_master-eu-west-1a.masters.domain.com_user_data")}"

  root_block_device = {
    volume_type           = "gp2"
    volume_size           = 30
    delete_on_termination = true
  }

  lifecycle = {
    create_before_destroy = true
  }

  enable_monitoring = false
}

resource "aws_launch_configuration" "master-eu-west-1b-masters-domain-com" {
  name_prefix                 = "master-eu-west-1b.masters.domain.com-"
  image_id                    = "ami-09b955ecb52ae9bcf"
  instance_type               = "t2.micro"
  key_name                    = "${aws_key_pair.kubernetes-domain-com-b3e6f1df7d7263ae2d6f9a1748330c2d.id}"
  iam_instance_profile        = "${aws_iam_instance_profile.masters-domain-com.id}"
  security_groups             = ["${aws_security_group.masters-domain-com.id}"]
  associate_public_ip_address = false
  user_data                   = "${file("${path.module}/data/aws_launch_configuration_master-eu-west-1b.masters.domain.com_user_data")}"

  root_block_device = {
    volume_type           = "gp2"
    volume_size           = 30
    delete_on_termination = true
  }

  lifecycle = {
    create_before_destroy = true
  }

  enable_monitoring = false
}

resource "aws_launch_configuration" "master-eu-west-1c-masters-domain-com" {
  name_prefix                 = "master-eu-west-1c.masters.domain.com-"
  image_id                    = "ami-09b955ecb52ae9bcf"
  instance_type               = "t2.micro"
  key_name                    = "${aws_key_pair.kubernetes-domain-com-b3e6f1df7d7263ae2d6f9a1748330c2d.id}"
  iam_instance_profile        = "${aws_iam_instance_profile.masters-domain-com.id}"
  security_groups             = ["${aws_security_group.masters-domain-com.id}"]
  associate_public_ip_address = false
  user_data                   = "${file("${path.module}/data/aws_launch_configuration_master-eu-west-1c.masters.domain.com_user_data")}"

  root_block_device = {
    volume_type           = "gp2"
    volume_size           = 30
    delete_on_termination = true
  }

  lifecycle = {
    create_before_destroy = true
  }

  enable_monitoring = false
}

resource "aws_launch_configuration" "nodes-domain-com" {
  name_prefix                 = "nodes.domain.com-"
  image_id                    = "ami-09b955ecb52ae9bcf"
  instance_type               = "t2.micro"
  key_name                    = "${aws_key_pair.kubernetes-domain-com-b3e6f1df7d7263ae2d6f9a1748330c2d.id}"
  iam_instance_profile        = "${aws_iam_instance_profile.nodes-domain-com.id}"
  security_groups             = ["${aws_security_group.nodes-domain-com.id}"]
  associate_public_ip_address = false
  user_data                   = "${file("${path.module}/data/aws_launch_configuration_nodes.domain.com_user_data")}"

  root_block_device = {
    volume_type           = "gp2"
    volume_size           = 30
    delete_on_termination = true
  }

  lifecycle = {
    create_before_destroy = true
  }

  enable_monitoring = false
}

resource "aws_nat_gateway" "eu-west-1a-domain-com" {
  allocation_id = "${aws_eip.eu-west-1a-domain-com.id}"
  subnet_id     = "${aws_subnet.utility-eu-west-1a-domain-com.id}"

  tags = {
    KubernetesCluster                 = "domain.com"
    Name                              = "eu-west-1a.domain.com"
    "kubernetes.io/cluster/domain.com" = "owned"
  }
}

resource "aws_nat_gateway" "eu-west-1b-domain-com" {
  allocation_id = "${aws_eip.eu-west-1b-domain-com.id}"
  subnet_id     = "${aws_subnet.utility-eu-west-1b-domain-com.id}"

  tags = {
    KubernetesCluster                 = "domain.com"
    Name                              = "eu-west-1b.domain.com"
    "kubernetes.io/cluster/domain.com" = "owned"
  }
}

resource "aws_nat_gateway" "eu-west-1c-domain-com" {
  allocation_id = "${aws_eip.eu-west-1c-domain-com.id}"
  subnet_id     = "${aws_subnet.utility-eu-west-1c-domain-com.id}"

  tags = {
    KubernetesCluster                 = "domain.com"
    Name                              = "eu-west-1c.domain.com"
    "kubernetes.io/cluster/domain.com" = "owned"
  }
}

resource "aws_route" "0-0-0-0--0" {
  route_table_id         = "${aws_route_table.domain-com.id}"
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = "${aws_internet_gateway.domain-com.id}"
}

resource "aws_route" "private-eu-west-1a-0-0-0-0--0" {
  route_table_id         = "${aws_route_table.private-eu-west-1a-domain-com.id}"
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = "${aws_nat_gateway.eu-west-1a-domain-com.id}"
}

resource "aws_route" "private-eu-west-1b-0-0-0-0--0" {
  route_table_id         = "${aws_route_table.private-eu-west-1b-domain-com.id}"
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = "${aws_nat_gateway.eu-west-1b-domain-com.id}"
}

resource "aws_route" "private-eu-west-1c-0-0-0-0--0" {
  route_table_id         = "${aws_route_table.private-eu-west-1c-domain-com.id}"
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = "${aws_nat_gateway.eu-west-1c-domain-com.id}"
}

resource "aws_route53_record" "api-domain-com" {
  name = "api.domain.com"
  type = "A"

  alias = {
    name                   = "${aws_elb.api-domain-com.dns_name}"
    zone_id                = "${aws_elb.api-domain-com.zone_id}"
    evaluate_target_health = false
  }

  zone_id = "/hostedzone/ZCZ2GPGL0J3GH"
}

resource "aws_route53_record" "bastion-domain-com" {
  name = "bastion.domain.com"
  type = "A"

  alias = {
    name                   = "${aws_elb.bastion-domain-com.dns_name}"
    zone_id                = "${aws_elb.bastion-domain-com.zone_id}"
    evaluate_target_health = false
  }

  zone_id = "/hostedzone/ZCZ2GPGL0J3GH"
}

resource "aws_route_table" "domain-com" {
  vpc_id = "${aws_vpc.domain-com.id}"

  tags = {
    KubernetesCluster                 = "domain.com"
    Name                              = "domain.com"
    "kubernetes.io/cluster/domain.com" = "owned"
    "kubernetes.io/kops/role"         = "public"
  }
}

resource "aws_route_table" "private-eu-west-1a-domain-com" {
  vpc_id = "${aws_vpc.domain-com.id}"

  tags = {
    KubernetesCluster                 = "domain.com"
    Name                              = "private-eu-west-1a.domain.com"
    "kubernetes.io/cluster/domain.com" = "owned"
    "kubernetes.io/kops/role"         = "private-eu-west-1a"
  }
}

resource "aws_route_table" "private-eu-west-1b-domain-com" {
  vpc_id = "${aws_vpc.domain-com.id}"

  tags = {
    KubernetesCluster                 = "domain.com"
    Name                              = "private-eu-west-1b.domain.com"
    "kubernetes.io/cluster/domain.com" = "owned"
    "kubernetes.io/kops/role"         = "private-eu-west-1b"
  }
}

resource "aws_route_table" "private-eu-west-1c-domain-com" {
  vpc_id = "${aws_vpc.domain-com.id}"

  tags = {
    KubernetesCluster                 = "domain.com"
    Name                              = "private-eu-west-1c.domain.com"
    "kubernetes.io/cluster/domain.com" = "owned"
    "kubernetes.io/kops/role"         = "private-eu-west-1c"
  }
}

resource "aws_route_table_association" "private-eu-west-1a-domain-com" {
  subnet_id      = "${aws_subnet.eu-west-1a-domain-com.id}"
  route_table_id = "${aws_route_table.private-eu-west-1a-domain-com.id}"
}

resource "aws_route_table_association" "private-eu-west-1b-domain-com" {
  subnet_id      = "${aws_subnet.eu-west-1b-domain-com.id}"
  route_table_id = "${aws_route_table.private-eu-west-1b-domain-com.id}"
}

resource "aws_route_table_association" "private-eu-west-1c-domain-com" {
  subnet_id      = "${aws_subnet.eu-west-1c-domain-com.id}"
  route_table_id = "${aws_route_table.private-eu-west-1c-domain-com.id}"
}

resource "aws_route_table_association" "utility-eu-west-1a-domain-com" {
  subnet_id      = "${aws_subnet.utility-eu-west-1a-domain-com.id}"
  route_table_id = "${aws_route_table.domain-com.id}"
}

resource "aws_route_table_association" "utility-eu-west-1b-domain-com" {
  subnet_id      = "${aws_subnet.utility-eu-west-1b-domain-com.id}"
  route_table_id = "${aws_route_table.domain-com.id}"
}

resource "aws_route_table_association" "utility-eu-west-1c-domain-com" {
  subnet_id      = "${aws_subnet.utility-eu-west-1c-domain-com.id}"
  route_table_id = "${aws_route_table.domain-com.id}"
}

resource "aws_security_group" "api-elb-domain-com" {
  name        = "api-elb.domain.com"
  vpc_id      = "${aws_vpc.domain-com.id}"
  description = "Security group for api ELB"

  tags = {
    KubernetesCluster                 = "domain.com"
    Name                              = "api-elb.domain.com"
    "kubernetes.io/cluster/domain.com" = "owned"
  }
}

resource "aws_security_group" "bastion-elb-domain-com" {
  name        = "bastion-elb.domain.com"
  vpc_id      = "${aws_vpc.domain-com.id}"
  description = "Security group for bastion ELB"

  tags = {
    KubernetesCluster                 = "domain.com"
    Name                              = "bastion-elb.domain.com"
    "kubernetes.io/cluster/domain.com" = "owned"
  }
}

resource "aws_security_group" "bastion-domain-com" {
  name        = "bastion.domain.com"
  vpc_id      = "${aws_vpc.domain-com.id}"
  description = "Security group for bastion"

  tags = {
    KubernetesCluster                 = "domain.com"
    Name                              = "bastion.domain.com"
    "kubernetes.io/cluster/domain.com" = "owned"
  }
}

resource "aws_security_group" "masters-domain-com" {
  name        = "masters.domain.com"
  vpc_id      = "${aws_vpc.domain-com.id}"
  description = "Security group for masters"

  tags = {
    KubernetesCluster                 = "domain.com"
    Name                              = "masters.domain.com"
    "kubernetes.io/cluster/domain.com" = "owned"
  }
}

resource "aws_security_group" "nodes-domain-com" {
  name        = "nodes.domain.com"
  vpc_id      = "${aws_vpc.domain-com.id}"
  description = "Security group for nodes"

  tags = {
    KubernetesCluster                 = "domain.com"
    Name                              = "nodes.domain.com"
    "kubernetes.io/cluster/domain.com" = "owned"
  }
}

resource "aws_security_group_rule" "all-master-to-master" {
  type                     = "ingress"
  security_group_id        = "${aws_security_group.masters-domain-com.id}"
  source_security_group_id = "${aws_security_group.masters-domain-com.id}"
  from_port                = 0
  to_port                  = 0
  protocol                 = "-1"
}

resource "aws_security_group_rule" "all-master-to-node" {
  type                     = "ingress"
  security_group_id        = "${aws_security_group.nodes-domain-com.id}"
  source_security_group_id = "${aws_security_group.masters-domain-com.id}"
  from_port                = 0
  to_port                  = 0
  protocol                 = "-1"
}

resource "aws_security_group_rule" "all-node-to-node" {
  type                     = "ingress"
  security_group_id        = "${aws_security_group.nodes-domain-com.id}"
  source_security_group_id = "${aws_security_group.nodes-domain-com.id}"
  from_port                = 0
  to_port                  = 0
  protocol                 = "-1"
}

resource "aws_security_group_rule" "api-elb-egress" {
  type              = "egress"
  security_group_id = "${aws_security_group.api-elb-domain-com.id}"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "bastion-egress" {
  type              = "egress"
  security_group_id = "${aws_security_group.bastion-domain-com.id}"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "bastion-elb-egress" {
  type              = "egress"
  security_group_id = "${aws_security_group.bastion-elb-domain-com.id}"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "bastion-to-master-ssh" {
  type                     = "ingress"
  security_group_id        = "${aws_security_group.masters-domain-com.id}"
  source_security_group_id = "${aws_security_group.bastion-domain-com.id}"
  from_port                = 22
  to_port                  = 22
  protocol                 = "tcp"
}

resource "aws_security_group_rule" "bastion-to-node-ssh" {
  type                     = "ingress"
  security_group_id        = "${aws_security_group.nodes-domain-com.id}"
  source_security_group_id = "${aws_security_group.bastion-domain-com.id}"
  from_port                = 22
  to_port                  = 22
  protocol                 = "tcp"
}

resource "aws_security_group_rule" "https-api-elb-0-0-0-0--0" {
  type              = "ingress"
  security_group_id = "${aws_security_group.api-elb-domain-com.id}"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "https-elb-to-master" {
  type                     = "ingress"
  security_group_id        = "${aws_security_group.masters-domain-com.id}"
  source_security_group_id = "${aws_security_group.api-elb-domain-com.id}"
  from_port                = 443
  to_port                  = 443
  protocol                 = "tcp"
}

resource "aws_security_group_rule" "master-egress" {
  type              = "egress"
  security_group_id = "${aws_security_group.masters-domain-com.id}"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "node-egress" {
  type              = "egress"
  security_group_id = "${aws_security_group.nodes-domain-com.id}"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "node-to-master-tcp-1-2379" {
  type                     = "ingress"
  security_group_id        = "${aws_security_group.masters-domain-com.id}"
  source_security_group_id = "${aws_security_group.nodes-domain-com.id}"
  from_port                = 1
  to_port                  = 2379
  protocol                 = "tcp"
}

resource "aws_security_group_rule" "node-to-master-tcp-2382-4000" {
  type                     = "ingress"
  security_group_id        = "${aws_security_group.masters-domain-com.id}"
  source_security_group_id = "${aws_security_group.nodes-domain-com.id}"
  from_port                = 2382
  to_port                  = 4000
  protocol                 = "tcp"
}

resource "aws_security_group_rule" "node-to-master-tcp-4003-65535" {
  type                     = "ingress"
  security_group_id        = "${aws_security_group.masters-domain-com.id}"
  source_security_group_id = "${aws_security_group.nodes-domain-com.id}"
  from_port                = 4003
  to_port                  = 65535
  protocol                 = "tcp"
}

resource "aws_security_group_rule" "node-to-master-udp-1-65535" {
  type                     = "ingress"
  security_group_id        = "${aws_security_group.masters-domain-com.id}"
  source_security_group_id = "${aws_security_group.nodes-domain-com.id}"
  from_port                = 1
  to_port                  = 65535
  protocol                 = "udp"
}

resource "aws_security_group_rule" "ssh-elb-to-bastion" {
  type                     = "ingress"
  security_group_id        = "${aws_security_group.bastion-domain-com.id}"
  source_security_group_id = "${aws_security_group.bastion-elb-domain-com.id}"
  from_port                = 22
  to_port                  = 22
  protocol                 = "tcp"
}

resource "aws_security_group_rule" "ssh-external-to-bastion-elb-0-0-0-0--0" {
  type              = "ingress"
  security_group_id = "${aws_security_group.bastion-elb-domain-com.id}"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_subnet" "eu-west-1a-domain-com" {
  vpc_id            = "${aws_vpc.domain-com.id}"
  cidr_block        = "172.20.32.0/19"
  availability_zone = "eu-west-1a"

  tags = {
    KubernetesCluster                 = "domain.com"
    Name                              = "eu-west-1a.domain.com"
    SubnetType                        = "Private"
    "kubernetes.io/cluster/domain.com" = "owned"
    "kubernetes.io/role/internal-elb" = "1"
  }
}

resource "aws_subnet" "eu-west-1b-domain-com" {
  vpc_id            = "${aws_vpc.domain-com.id}"
  cidr_block        = "172.20.64.0/19"
  availability_zone = "eu-west-1b"

  tags = {
    KubernetesCluster                 = "domain.com"
    Name                              = "eu-west-1b.domain.com"
    SubnetType                        = "Private"
    "kubernetes.io/cluster/domain.com" = "owned"
    "kubernetes.io/role/internal-elb" = "1"
  }
}

resource "aws_subnet" "eu-west-1c-domain-com" {
  vpc_id            = "${aws_vpc.domain-com.id}"
  cidr_block        = "172.20.96.0/19"
  availability_zone = "eu-west-1c"

  tags = {
    KubernetesCluster                 = "domain.com"
    Name                              = "eu-west-1c.domain.com"
    SubnetType                        = "Private"
    "kubernetes.io/cluster/domain.com" = "owned"
    "kubernetes.io/role/internal-elb" = "1"
  }
}

resource "aws_subnet" "utility-eu-west-1a-domain-com" {
  vpc_id            = "${aws_vpc.domain-com.id}"
  cidr_block        = "172.20.0.0/22"
  availability_zone = "eu-west-1a"

  tags = {
    KubernetesCluster                 = "domain.com"
    Name                              = "utility-eu-west-1a.domain.com"
    SubnetType                        = "Utility"
    "kubernetes.io/cluster/domain.com" = "owned"
    "kubernetes.io/role/elb"          = "1"
  }
}

resource "aws_subnet" "utility-eu-west-1b-domain-com" {
  vpc_id            = "${aws_vpc.domain-com.id}"
  cidr_block        = "172.20.4.0/22"
  availability_zone = "eu-west-1b"

  tags = {
    KubernetesCluster                 = "domain.com"
    Name                              = "utility-eu-west-1b.domain.com"
    SubnetType                        = "Utility"
    "kubernetes.io/cluster/domain.com" = "owned"
    "kubernetes.io/role/elb"          = "1"
  }
}

resource "aws_subnet" "utility-eu-west-1c-domain-com" {
  vpc_id            = "${aws_vpc.domain-com.id}"
  cidr_block        = "172.20.8.0/22"
  availability_zone = "eu-west-1c"

  tags = {
    KubernetesCluster                 = "domain.com"
    Name                              = "utility-eu-west-1c.domain.com"
    SubnetType                        = "Utility"
    "kubernetes.io/cluster/domain.com" = "owned"
    "kubernetes.io/role/elb"          = "1"
  }
}

resource "aws_vpc" "domain-com" {
  cidr_block           = "172.20.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    KubernetesCluster                 = "domain.com"
    Name                              = "domain.com"
    "kubernetes.io/cluster/domain.com" = "owned"
  }
}

resource "aws_vpc_dhcp_options" "domain-com" {
  domain_name         = "eu-west-1.compute.internal"
  domain_name_servers = ["AmazonProvidedDNS"]

  tags = {
    KubernetesCluster                 = "domain.com"
    Name                              = "domain.com"
    "kubernetes.io/cluster/domain.com" = "owned"
  }
}

resource "aws_vpc_dhcp_options_association" "domain-com" {
  vpc_id          = "${aws_vpc.domain-com.id}"
  dhcp_options_id = "${aws_vpc_dhcp_options.domain-com.id}"
}
