# Open Issue Action

[![Public workflows that use this action.](https://img.shields.io/endpoint?url=https%3A%2F%2Fapi-endbug.vercel.app%2Fapi%2Fgithub-actions%2Fused-by%3Faction%3DGuillaumeFalourd%2Fopen-issue-action%26badge%3Dtrue)](https://github.com/search?o=desc&q=GuillaumeFalourd+open-issue-action+path%3A.github%2Fworkflows+language%3AYAML&s=&type=Code) 

[![Open Issue Workflow](https://github.com/GuillaumeFalourd/open-issue-action/actions/workflows/open-issue.yml/badge.svg)](https://github.com/GuillaumeFalourd/open-issue-action/actions/workflows/open-issue.yml)

![Title](https://user-images.githubusercontent.com/22433243/117715515-c146ca80-b1ae-11eb-9fe9-de3cc7f631ff.png)

Github Action to open a new issue on **ANY** Github repository that the [**PAT**](https://docs.github.com/en/github/authenticating-to-github/creating-a-personal-access-token) has access to. 🤖

## How to use this action?

### Action inputs

Field | Mandatory | Observation
------------ | ------------  | -------------
**access-token** | YES | [How to create a PAT](https://docs.github.com/en/github/authenticating-to-github/creating-a-personal-access-token)
**repo-owner** | YES | Ex: `octocat`
**repo-name** | YES | Ex: `open-issue-action`
**issue-title** | YES | Can use the context or customize
**issue-body** | YES | Can use the context or customize
**issue-labels** | NO | Labels **need to exist** on the new repository. <br/> _Separated with coma `,` if more than one_
**issue-assignees** | NO | Assignees **need to have access** to the new repositor. <br/> _Separated with coma `,` if more than one_

### Example

Using `if conditionnal` to open a new issue on **ANOTHER** repository when an issue with a specific label `documentation` is *opened* or *labeled* on the **CURRENT** repository.

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
        issue-title: Custom title for new ISSUE
        issue-body: Custom message for new ISSUE
        issue-labels: bug # Not mandatory
        issue-assignees: <username> # Not mandatory

```

## How does it work?

This action will execute [this python automation](https://github.com/GuillaumeFalourd/formulas-github/blob/master/github/create/issue/src/formula/formula.py) to open a new ISSUE with the informed `title` and `body` on the informed repository.

## Licensed

This repository uses the [Apache License 2.0](https://github.com/GuillaumeFalourd/aws-cliaction/blob/main/LICENSE)
