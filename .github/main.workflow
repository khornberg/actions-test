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

action "action-filter" {
  uses = "actions/bin/filter@master"
  args = "action synchronize"
  needs = ["Filters for GitHub Actions"]
}

action "Check" {
  uses = "./python-actions/setup"
  args = "check"
  needs = ["action-filter"]
}

action "Build" {
  uses = "./python-actions/setup"
  args = "sdist bdist"
  needs = ["Check"]
}

