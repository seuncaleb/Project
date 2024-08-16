# Project
Final Project 
# Create a markdown file with the deployment instructions

# Deploying Sock Shop App

For this deployment, we'll be using the Kops option to deploy the Sock Shop app on Kubernetes.

## Prerequisites

- Terraform
- AWS Account
- AWS CLI
- Registered and Running DNS

## Deployment Steps

1. **Clone the Repository**
   - Clone the repository containing the necessary files for the Sock Shop deployment to your local system.

2. **Navigate to the Terraform Folder**
   - Change directory into the `terraform` folder within the cloned repository:
     ```bash
     cd terraform
     ```

3. **Create a `.tfvar` File**
   - Create a `.tfvar` file to store your variables. This file will contain specific values such as your AWS credentials, region, and other necessary variables.

4. **Run Terraform Commands**
   - Initialize the Terraform workspace by running:
     ```bash
     terraform init
     ```
   - Review the plan to ensure everything is configured correctly:
     ```bash
     terraform plan
     ```
   - Apply the Terraform configuration to create the necessary infrastructure. Use the `-auto-approve` flag to skip manual approval:
     ```bash
     terraform apply -auto-approve
     ```

Following these steps will set up the infrastructure needed to deploy the Sock Shop app using Kops on Kubernetes.

### 5. Access the Application

Once the deployment is completed go to your ec2 instance and ensure to restart the instance to ensure all updates from the script are properly deployed

run the following command 
\`\`\`bash
export KOPS_STATE_STORE=""{s3bucketname}""
export NAME= "{name}"
  export CONTROL_PLANE_SIZE="c5.large"
  export NODE_SIZE="m5.large"
  export ZONES="us-east-1a,us-east-1b,us-east-1c"
  kops create cluster {clustername}.{domainname} \
  --node-count 3 \
  --zones $ZONES \
  --node-size $NODE_SIZE \
  --control-plane-size $CONTROL_PLANE_SIZE \
  --control-plane-zones $ZONES \
  --networking cilium \
  --topology private \
  --bastion="true" \
  --yes
\`\`\`


### 6. set up jenkins 
In this repo there is a jenkins file in the folder ./sock-app-script that serves as the deployment script for jenkins. 