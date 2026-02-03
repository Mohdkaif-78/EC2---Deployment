cat > terraform.tfvars << 'EOF'
aws_region       = "us-east-1"
instance_type    = "t2.micro"
instance_name    = "my-ec2-instance"
key_pair_name    = "my-key"
allowed_ssh_cidr = "203.0.113.45/32"
EOF