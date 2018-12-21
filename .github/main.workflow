workflow "New workflow" {
  on = "push"
  resolves = [
    "Build",
  ]
}

action "Filters for GitHub Actions" {
  uses = "actions/bin/filter@b2bea07"
  args = "branch master"
}

action "Check" {
  uses = "./python-actions/setup"
  args = "check"
  needs = ["Filters for GitHub Actions"]
}

action "Build" {
  uses = "./python-actions/setup"
  args = "sdist bdist"
  needs = ["Check"]
}

