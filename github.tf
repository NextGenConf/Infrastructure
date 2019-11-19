provider "github" {}

# Commented out pending import as the repo already exists.
/* 
resource "github_repository" "WebApp" {
  name        = "WebApp"
  description = ""
}
*/

resource "github_repository" "ApiGateway" {
  name        = "ApiGateway"
  description = "Microservice for aggregating requests to storage services"
}

# Commented out pending import as the repo already exists.
/*
resource "github_repository" "ConferenceService" {
  name        = "ConferenceService"
  description = "My awesome codebase"
}
*/

resource "github_repository" "SessionService" {
  name        = "SessionService"
  description = "Microservice for storing conference sessions"
}

resource "github_repository" "ConferenceSessionService" {
  name        = "ConferenceSessionService"
  description = "Microservice for storing the relationship between conferences and sessions"
}

resource "github_repository" "FeedService" {
  name        = "FeedService"
  description = "Microservice for storing conference feeds"
}
