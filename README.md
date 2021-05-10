# Open Issue Action

[![Open Issue Workflow](https://github.com/GuillaumeFalourd/open-issue-action/actions/workflows/open-issue.yml/badge.svg)](https://github.com/GuillaumeFalourd/open-issue-action/actions/workflows/open-issue.yml)

Github Action to open a new issue on any Github repository that the [PAT](https://docs.github.com/en/github/authenticating-to-github/creating-a-personal-access-token) has access to 🤖

## How to use this action?

Example using `if conditionnal` to open a new issue on **ANOTHER** repository when an issue with a specific label `documentation` is *opened* or *labeled* on the **CURRENT** repository.

```bash
name: Open Issue Workflow

on:
  issues: 
    types: [opened, labeled]

jobs:
  job:
    runs-on: ubuntu-latest
    steps:
    - name: Open new ISSUE on GuillaumeFalourd/poc-github-actions repository
      if: contains(github.event.label.name , 'documentation')
      uses: GuillaumeFalourd/open-issue-action@v1
      with:
        access-token: ${{ secrets.ACCESS_TOKEN }}
        repo-owner: GuillaumeFalourd
        repo-name: poc-github-actions
        issue-title: New Automated Issue
        issue-body: This is a test openning a new ISSUE through the open-issue-action!

```

## Licensed

This repository uses the [Apache License 2.0](https://github.com/GuillaumeFalourd/aws-cliaction/blob/main/LICENSE)
