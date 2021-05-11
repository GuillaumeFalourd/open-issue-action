#!/bin/bash -l

echo "🔒 Configure Github Access Token"
sudo rit set credential --provider=github --fields=token --values="$1"

echo "🔄 Importing Github API formula repository"
sudo rit add repo --provider=Github --name=formulas-github --repoUrl=https://github.com/GuillaumeFalourd/formulas-github --priority=0

echo "⚙️  Running automation opening the ISSUE on $2's $3 repository"
sudo rit github create issue --rit_github_owner="$2" --rit_github_repo="$3" --rit_issue_title="$4" --rit_issue_body="$5" --rit_issue_labels="$6" --rit_issue_assignees="$7"
