# AWS Capstone Project – Scalable WordPress on AWS

## Overview

This project implements a **highly available and scalable WordPress infrastructure on AWS**, fully provisioned using **Terraform (Infrastructure as Code)** and deployed via **Terraform Cloud**.

The architecture follows **AWS Well-Architected Framework** principles, focusing on **security, high availability, scalability, and clean network separation**.

---

## Architecture Summary

- Multi-AZ deployment (us-west-2a, us-west-2b)
- Public / Private subnet separation
- WordPress runs only in private subnets
- Application Load Balancer for traffic distribution
- Auto Scaling Group for high availability
- Amazon RDS MySQL in private subnets
- NAT Gateway for outbound internet access
- Bastion Host for secure administration

---

## AWS Services Used

- Amazon VPC
- EC2 (Launch Template + Auto Scaling Group)
- Application Load Balancer
- Amazon RDS (MySQL)
- NAT Gateway
- Bastion Host
- Security Groups (least privilege)
- Terraform Cloud (remote state & deployments)

---

## Key Implementation Details

### Network
- VPC CIDR: `10.0.0.0/16`
- Public Subnets: `10.0.1.0/24`, `10.0.3.0/24`
- Private Subnets: `10.0.2.0/24`, `10.0.4.0/24`

### Compute & Scaling
- WordPress EC2 instances deployed via Launch Template
- Auto Scaling Group:
  - Min: 2 | Desired: 2 | Max: 3
- Instances distributed across multiple AZs
- No public IPs on application instances

### Database
- Amazon RDS MySQL 8.x
- Instance type: `db.t3.micro`
- Private access only
- DB Subnet Group across two AZs

---

## Security Design

- No direct internet access to WordPress EC2 instances
- Database not publicly accessible
- SSH access restricted to Bastion Host
- Security Groups scoped by source SG instead of wide CIDR
- NAT Gateway for controlled outbound traffic

---

## Deployment Workflow

- Terraform code stored in GitHub
- Infrastructure deployed using Terraform Cloud
- No local Terraform state
- Workflow:



---

## Result

- WordPress successfully accessible via ALB DNS
- High availability across multiple AZs
- Fully automated, repeatable infrastructure

---

## What I Learned

- Designing secure AWS network architectures
- Implementing high availability with ALB & Auto Scaling
- Managing Terraform Cloud workflows
- Debugging real AWS dependency issues
- Applying Infrastructure as Code best practices

---

## Author

**Marchhare Goofy**  
Aspiring **Junior Cloud / CloudOps Engineer**  
AWS | Terraform | Linux
