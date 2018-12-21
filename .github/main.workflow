workflow "New workflow" {
  on = "push"
  resolves = [
    "Build",
    "Filters for GitHub Actions",
  ]
}

action "Check" {
  uses = "./python-actions/setup"
  args = "check"
}

action "Build" {
  uses = "./python-actions/setup"
  args = "sdist bdist_wheel"
  needs = ["Check"]
}

action "Filters for GitHub Actions" {
  uses = "actions/bin/filter@b2bea07"
  args = "branch master"
}
