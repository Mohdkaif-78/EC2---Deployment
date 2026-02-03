# EC2 Deployment Guide

## Manual Deployment (Optional)

If you want to deploy manually through AWS Console instead of Terraform, follow these steps:

1. Go to AWS Console and click **Instances**
2. Click **Launch Instance**
3. Enter a name for your instance
4. Choose **Ubuntu** as the image
5. Select **t3.micro** as instance type
6. Create or select your key pair
7. In security group, allow:
   - SSH from your IP
   - HTTP (port 80)
   - HTTPS (port 443)
8. Click **Launch**
9. Wait for the instance to start running
10. Click on your instance and copy the **Public DNS**
11. Connect via SSH using your key pair

That is the manual way. Below is the easier automated way using Terraform.

---

## Terraform Deployment (Recommended)

### Prerequisites

Before you start, make sure you have:
- Your EC2 key pair name from AWS
- Your public IP address
- AWS credentials configured in your CLI
- Terraform installed on your machine

### Step 1: Create a Project Folder

Open Git Bash and create a folder for your Terraform files.

```bash
mkdir ec2-terraform
cd ec2-terraform
```

### Step 2: Add the Terraform Files

Copy these 4 files into your `ec2-terraform` folder:

- `main.tf`
- `variables.tf`
- `outputs.tf`

Or create them with the content provided in this repository.

### Step 3: Copy terraform.exe

Copy the terraform.exe file to your project folder.

```bash
cp /c/Users/DELL/Desktop/terraform.exe .
```

### Step 4: Create terraform.tfvars

Create a new file called `terraform.tfvars` in your project folder and add this content:

```hcl
aws_region       = "us-east-1"
instance_type    = "t2.micro"
instance_name    = "my-ec2-instance"
key_pair_name    = "your-key-pair-name"
allowed_ssh_cidr = "YOUR_IP/32"
```

Replace these values:
- `key_pair_name` - Your actual EC2 key pair name from AWS
- `allowed_ssh_cidr` - Your public IP address

To find your public IP, run:

```bash
curl https://checkip.amazonaws.com
```

For example, if your IP is `203.0.113.45`, it should look like:

```hcl
allowed_ssh_cidr = "203.0.113.45/32"
```

### Step 5: Initialize Terraform

Run this command to initialize Terraform:

```bash
./terraform.exe init
```

This downloads the necessary AWS provider.

### Step 6: Preview Changes

See what Terraform will create:

```bash
./terraform.exe plan
```

Review the output to make sure everything looks correct.

### Step 7: Deploy

Deploy your EC2 instance:

```bash
./terraform.exe apply
```

When prompted, type `yes` and press Enter to confirm.

### Step 8: Get Connection Details

After deployment finishes, get your instance information:

```bash
./terraform.exe output
```

This will show you:
- Instance ID
- Public IP
- Public DNS
- SSH command to connect

### Step 9: Connect to Your Instance

Copy the SSH command from the output and run it:

```bash
ssh -i /path/to/your/key.pem ec2-user@your-public-dns
```

Replace the paths with your actual key pair location and public DNS.

### Step 10: Cleanup

When you are done and want to delete everything:

```bash
./terraform.exe destroy
```

Type `yes` when prompted to confirm.

---

## File Structure

After setup, your folder should look like this:

```
ec2-terraform/
├── main.tf
├── variables.tf
├── outputs.tf
├── terraform.tfvars
├── terraform.exe
└── .terraform/
```

---

## Troubleshooting

**Issue: terraform.exe not found**

Make sure you copied terraform.exe to your project folder or use the full path to it.

**Issue: AWS credentials not configured**

Run this command to configure your AWS credentials:

```bash
aws configure
```

**Issue: Key pair name not found**

Make sure the key pair name in `terraform.tfvars` matches exactly with a key pair in your AWS account.

**Issue: Cannot SSH to instance**

Check that your security group allows SSH from your IP address and that you are using the correct key pair file.

---

## Notes

- The t2.micro instance type is free tier eligible
- Keep your key pair file safe and never share it
- SSH should only be open to your IP for security
- Always run `terraform destroy` when you are done to avoid charges
- The security group allows HTTP and HTTPS from anywhere but SSH only from your IP 🚀
