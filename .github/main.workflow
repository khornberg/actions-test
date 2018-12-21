workflow "New workflow" {
  on = "push"
  resolves = ["Build"]
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
