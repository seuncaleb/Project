# Project
Final Project 
# Create a markdown file with the deployment instructions

# Sock Shop Application Deployment

This document provides instructions for deploying the Sock Shop application using Terraform.

## Prerequisites

Before you begin, ensure that you have the following:

- **Terraform**: Make sure Terraform is installed on your machine. You can download Terraform from the official [Terraform website](https://www.terraform.io/downloads.html).

## Deployment Instructions

### 1. Clone the Repository

Clone the repository containing the Sock Shop application:

\`\`\`bash
git clone https://github.com/example/sock-shop.git
cd sock-shop
\`\`\`

### 2. Initialize Terraform

Navigate to the Terraform directory and initialize Terraform. This step downloads the necessary provider plugins and prepares your environment:

\`\`\`bash
cd terraform
terraform init
\`\`\`

### 3. Review the Terraform Plan

It's good practice to review the changes Terraform will make to your infrastructure. Run the following command to generate and review the execution plan:

\`\`\`bash
terraform plan
\`\`\`

### 4. Apply the Terraform Configuration

After reviewing the plan and ensuring everything is correct, apply the configuration to deploy the infrastructure:

\`\`\`bash
terraform apply -auto-approve
\`\`\`

Terraform will prompt for confirmation before proceeding. Type \`yes\` to continue.

### 5. Access the Application

Once the deployment is completed go to your ec2 instance and ensure to restart the instance to ensure all updates from the script are properly deployed
