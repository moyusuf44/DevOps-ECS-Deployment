terraform {
  backend "s3" {
    bucket         = "moyusuf-terraform-state"
    key            = "code-server-project/terraform.tfstate"
    region         = "eu-north-1"
    use_lockfile   = true
    encrypt        = true
  }
}