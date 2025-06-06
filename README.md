Cloud Infrastructure Automation (GCP/Terraform)

Description
Automated VM deployment with Nginx using Terraform and Cloud Storage


Key motive:
Provisioned 4 core GCP services: Compute Engine, Cloud Storage, VPC Networking, and Cloud IAM through Terraform

Secured public web access via firewall rules (port 80) and IAM bucket policies while maintaining internet accessibility

Implemented configuration distribution using Cloud Storage bucket for startup script deployment

Automated Nginx installation through VM startup script fetching from Cloud Storage

Reduced manual steps from 10+ to single terraform apply command 
