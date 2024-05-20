variable "do_token" {
  description = "DigitalOcean API Key"
  type        = string
  sensitive   = true
}

variable "gh_user" {
  description = "GitHub User"
  type        = string
}

variable "gh_token" {
  description = "GitHub Personal Access Token"
  type        = string
  sensitive   = true
}

variable "repo_uri" {
  description = "Name of the GitHub repository"
  type        = string
}
