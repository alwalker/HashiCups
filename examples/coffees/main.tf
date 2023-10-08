terraform {
  required_providers {
    hashicups = {
      source = "hashicorp.com/edu/hashicups-pf"
    }
  }
}

provider "hashicups" {
  host     = "http://192.168.2.14:19090"
  username = "education"
  password = "test123"
}

data "hashicups_coffees" "edu" {}

output "edu_coffees" {
  value = data.hashicups_coffees.edu
}

resource "hashicups_order" "edu" {
  items = [{
    coffee = {
      id = 3
    }
    quantity = 2
    },
    {
      coffee = {
        id = 2
      }
      quantity = 3
  }]
}

output "edu_order" {
  value = hashicups_order.edu
}