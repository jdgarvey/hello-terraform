terraform {
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "VenturPlex"

    workspaces {
      name = "hello-terraform"
    }
  }
}
