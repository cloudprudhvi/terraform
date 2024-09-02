terraform {
  backend "s3" {
    bucket = "sample-demo-789"
    key    = "dev/state/terraform.tfstate"
    region = "us-west-1"
  }
}
