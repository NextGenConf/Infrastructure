provider "github" {}

# Commented out pending import as the repo already exists.
/*
resource "github_repository" "WebApp" {
  name               = "WebApp"
  description        = "React app displaying conferences"
  has_issues         = true
  has_projects       = false
  allow_merge_commit = false
  allow_squash_merge = true
  allow_rebase_merge = false
  license_template   = "mit"
}
*/

resource "github_repository" "ApiGateway" {
  name               = "ApiGateway"
  description        = "Microservice for aggregating requests to storage services"
  has_issues         = true
  has_projects       = false
  allow_merge_commit = false
  allow_squash_merge = true
  allow_rebase_merge = false
  license_template   = "mit"
}

# Commented out pending import as the repo already exists.
/*
resource "github_repository" "ConferenceService" {
  name               = "ConferenceService"
  description        = "Microservice for storing conferences"
  has_issues         = true
  has_projects       = false
  allow_merge_commit = false
  allow_squash_merge = true
  allow_rebase_merge = false
  license_template   = "mit"
}
*/

resource "github_repository" "SessionService" {
  name               = "SessionService"
  description        = "Microservice for storing conference sessions"
  has_issues         = true
  has_projects       = false
  allow_merge_commit = false
  allow_squash_merge = true
  allow_rebase_merge = false
  license_template   = "mit"
}

resource "github_repository" "ConferenceSessionService" {
  name               = "ConferenceSessionService"
  description        = "Microservice for storing the relationship between conferences and sessions"
  has_issues         = true
  has_projects       = false
  allow_merge_commit = false
  allow_squash_merge = true
  allow_rebase_merge = false
  license_template   = "mit"
}

resource "github_repository" "FeedService" {
  name               = "FeedService"
  description        = "Microservice for storing conference feeds"
  has_issues         = true
  has_projects       = false
  allow_merge_commit = false
  allow_squash_merge = true
  allow_rebase_merge = false
  license_template   = "mit"
}
