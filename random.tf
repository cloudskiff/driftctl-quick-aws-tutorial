# Create a random string to be used elsewhere (for unicity)
resource "random_string" "id" {
  length  = 6
  upper   = false
  special = false
}