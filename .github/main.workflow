workflow "New workflow" {
  on = "push"
  resolves = [
    "Filters for GitHub Actions",
  ]
}

action "Filters for GitHub Actions" {
  uses = "actions/bin/filter@b2bea07"
  args = "branch master"
}

action "Check" {
  uses = "./python-actions/setup"
  args = "check"
  need = ["Filters for GitHub Actions"]
}

action "Build" {
  uses = "./python-actions/setup"
  args = "sdist bdist_wheel"
  needs = ["Check"]
}

