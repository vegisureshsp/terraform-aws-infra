terraform {


    backend "s3" {

bucket = "terraform-state-file-bucket"
key = "TERRAFORM-AWS-INFRA/terraform/terraform.tfstate"

    }
}