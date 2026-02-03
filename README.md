EC2 Deployment Guide
Manual Deployment (Optional)
If you want to deploy manually through AWS Console instead of Terraform, here are the quick steps:

Go to AWS Console and click Instances
Click Launch Instance
Enter a name for your instance
Choose ubuntu as the image
Select t3.micro as instance type
Create or select your key pair
In security group, allow SSH from your IP, HTTP, and HTTPS
Click Launch
Wait for the instance to start
Click on your instance and copy the public DNS
Connect via SSH using your key pair

That is the manual way. Below is the easier automated way using Terraform.

Terraform Deployment (Recommended)
How to Deploy Your EC2 Instance
Step 1: Create a Project Folder
Open Git Bash and create a folder for your Terraform files.
bashmkdir ec2-terraform
cd ec2-terraform
Step 2: Add the Terraform Files
Copy these 4 files into your ec2-terraform folder:

main.tf
variables.tf
outputs.tf
terraform.tfvars

Step 3: Copy terraform.exe
Copy the terraform.exe file from your Desktop to this folder.
bashcp /c/Users/DELL/Desktop/terraform.exe .
Step 4: Update Your Configuration
Open the terraform.tfvars file and update two things.
bashnano terraform.tfvars
Find these lines and change them:
key_pair_name    = "your-aws-key-pair-name"
allowed_ssh_cidr = "YOUR_IP/32"
For your IP, run this command first to find it:
bashcurl https://checkip.amazonaws.com
Once you have your IP, it should look like this:
allowed_ssh_cidr = "203.0.113.45/32"
To save the file, press Ctrl+O, then Enter, then Ctrl+X.
Step 5: Initialize and Deploy
Run these commands in order:
bash./terraform.exe init
./terraform.exe plan
./terraform.exe apply
When it asks for confirmation, type yes and press Enter.
Step 6: Connect to Your Instance
After deployment finishes, get your connection details:
bash./terraform.exe output
This will show you the SSH command. Copy it and run it to connect to your instance.
Step 7: Stop Your Instance
When you are done, you can delete everything:
bash./terraform.exe destroy
Type yes when it asks for confirmation.
Notes
Before you start, make sure you have:

Your EC2 key pair name from AWS
Your public IP address
AWS credentials configured in your CLI

