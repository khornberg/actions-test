workflow "New workflow" {
  on = "push"
  resolves = ["python check"]
}

action "python check" {
  uses = "./python-actions/setup"
  args = "check"
}
