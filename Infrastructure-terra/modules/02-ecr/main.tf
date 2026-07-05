resource "aws_ecr_repository" "this" {
    name = "code-server"

    image_scanning_configuration {
    
    scan_on_push = true             # scans image for vunerabilty on push
  }
}