workflow "New workflow" {
  on = "push"
  resolves = ["GitHub Action for Python PyPi Twine"]
}

action "action-filter" {
  uses = "actions/bin/filter@master"
  args = "branch master"
}

action "Check" {
  uses = "ross/python-actions/setup-py/3.7@master"
  args = "check"
  needs = ["action-filter"]
}

action "Build" {
  uses = "./python-actions/setup"
  args = "sdist bdist"
  needs = ["Check"]
}

action "GitHub Action for Python PyPi Twine" {
  uses = "./twine"
  needs = ["Build"]
  secrets = ["TWINE_USERNAME", "TWINE_PASSWORD"]
  args = "upload dist/*"
}
