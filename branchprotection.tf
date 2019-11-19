resource "github_branch_protection" "branch_protection_api_gateway" {
  repository     = github_repository.repository_api_gateway.name
  branch         = "master"
  enforce_admins = true

  required_status_checks {
    strict   = false
    contexts = ["build"]
  }

  required_pull_request_reviews {
    dismiss_stale_reviews           = true
    require_code_owner_reviews      = true
    required_approving_review_count = 1
  }
}

resource "github_branch_protection" "branch_protection_session_service" {
  repository     = github_repository.repository_session_service.name
  branch         = "master"
  enforce_admins = true

  required_status_checks {
    strict   = false
    contexts = ["build"]
  }

  required_pull_request_reviews {
    dismiss_stale_reviews           = true
    require_code_owner_reviews      = true
    required_approving_review_count = 1
  }
}

resource "github_branch_protection" "branch_protection_conference_session_service" {
  repository     = github_repository.repository_conference_session_service.name
  branch         = "master"
  enforce_admins = true

  required_status_checks {
    strict   = false
    contexts = ["build"]
  }

  required_pull_request_reviews {
    dismiss_stale_reviews           = true
    require_code_owner_reviews      = true
    required_approving_review_count = 1
  }
}

resource "github_branch_protection" "branch_protection_feed_service" {
  repository     = github_repository.repository_feed_service.name
  branch         = "master"
  enforce_admins = true

  required_status_checks {
    strict   = false
    contexts = ["build"]
  }

  required_pull_request_reviews {
    dismiss_stale_reviews           = true
    require_code_owner_reviews      = true
    required_approving_review_count = 1
  }
}