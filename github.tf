provider "github" {
  version = "=2.2"
}

resource "github_repository" "repository_k8s_config" {
  name         = "KubeConfig"
  description  = "Repository containing the kubernetes resource files for the NextGenConf cluster"
  has_issues   = true
  has_projects = false
}

resource "github_repository" "repository_conference_service" {
  name         = "ConferenceService"
  description  = "Microservice for storing conferences"
  has_issues   = true
  has_projects = false
}

resource "github_repository" "repository_web_app" {
  name         = "WebApp"
  description  = "React app displaying conferences"
  has_issues   = true
  has_projects = false
}

resource "github_repository" "repository_api_gateway" {
  name         = "ApiGateway"
  description  = "Microservice for aggregating requests to storage services"
  has_issues   = true
  has_projects = false
}

resource "github_repository" "repository_session_service" {
  name         = "SessionService"
  description  = "Microservice for storing conference sessions"
  has_issues   = true
  has_projects = false
}

resource "github_repository" "repository_conference_session_service" {
  name         = "ConferenceSessionService"
  description  = "Microservice for storing the relationship between conferences and sessions"
  has_issues   = true
  has_projects = false
}

resource "github_repository" "repository_feed_service" {
  name               = "FeedService"
  description        = "Microservice for storing conference feeds"
  has_issues         = true
  has_projects       = false
  allow_merge_commit = false
  allow_rebase_merge = false
  license_template   = "mit"
}
