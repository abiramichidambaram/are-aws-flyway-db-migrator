terraform {
  cloud {
    organization = "sg-are"

    workspaces {
      name = "sentinel-dev-eu-west-ac"
    }
  }
}