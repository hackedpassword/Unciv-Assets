#!/bin/bash

# Ensure a blank new repository is created on GitHub before running this script.
# This script clones an existing repository at a specific commit and pushes it to a new repository.

# Variables
fullGitHubUrl="https://github.com/[username]/[repo]/blob/[commit-sha]/..." # Ensure commit-sha is present
username="github-username"
pathToGitHub="~/Github"
newRepo="new-repo-name"

# Extract repository name and commit hash from the full URL
repo=$(basename $(dirname $(dirname $fullGitHubUrl)))
commitSha=$(basename $(dirname $fullGitHubUrl))
repoUrl="https://github.com/$username/$repo"
newRepoUrl="https://github.com/$username/$newRepo"

# Derived variables
repoPath="$pathToGitHub/$repo"
newRepoPath="$pathToGitHub/$newRepo"

# Check for GitHub Token in the environment and set up credentials
if [ -n "$GITHUB_TOKEN" ]; then
  git config --global credential.helper store
  echo "url=$new_repo_url\nusername=$username\npassword=$GITHUB_TOKEN" | git credential approve
fi

# Clone the repository
git clone $repoUrl $repoPath

# Navigate to the cloned repository
cd $repoPath

# Checkout the specific commit
git checkout $commitSha

# Initialize a new repository at this commit
cd $pathToGitHub
git init $newRepoPath
cd $newRepoPath
git pull $repoPath

# Set up remote for the new repository
git remote add origin $newRepoUrl

# Push to the new repository
git push -u origin main

# Cleanup: Navigate out of the repository
cd $pathToGitHub
