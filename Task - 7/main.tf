
provider "aws" {
  version = "~> 3.74.0"
  profile = "user1"
  region  = var.region_user1
}


provider "aws" {
  version = "~> 3.74.0"
  profile = "user2"
  region  = var.region_user2
  alias   = "user2"
}
