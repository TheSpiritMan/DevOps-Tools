# Provisioning AWS LightSail using Terraform
- Make sure you have configure AWS Profile or have ACCESS_KEY and SECRET_KEY with proper IAM permissions.
- You can use any method for verifying aws account

# ENV
- Convert `terraform.tfvars.example` into `terraform.tfvars` and insert required values.

# Main.tf
- `main.tf` is main file used by terraform as base file.
- Everything is well written there. Make changes accordingly to you requirements.
- `AWS` Provider is selected.

# Importance Things:
- `bundle_id`: It is a instance type id. 
    ```
    aws lightsail get-bundles --region ap-south-1
    ```
- `blueprint_id`: It is an operating system id.
    ```
    aws lightsail get-blueprints --region ap-south-1
    ```
- `key_pair_name`: It is ssh public key which is already available in that AWS region.
- `private_key`: It is ssh private key used to connect to teh server.
- `output` block contains information which can be displayed as output.

# Commands to run:
- `terraform init`: To initialize terraform
- `terraform fmt`: To fromat code syntax
- `terraform plan`: To view what changes are to be created or destroyed
- `terraform apply`: To apply the changes
- `terraform output`: To display the output result
- `terraform destory`: To destroy all the changes