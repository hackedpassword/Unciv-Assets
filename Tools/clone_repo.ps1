<#
    Make sure to create a blank new repository on GitHub before running this script.
    This script clones an existing repository at a specific commit and pushes it to a new repository.
#>

# Variables
$fullGitHubUrl = "https://github.com/[username]/[repo]/blob/[commit-sha]/..." # Ensure commit-sha is present
$username = "github-username"
$pathToGitHub = "~/Github"
$newRepo = "new-repo-name"

# Extract repository name and commit hash from the full URL
$repo = Split-Path (Split-Path (Split-Path $fullGitHubUrl -Parent) -Parent) -Leaf
$commitSha = Split-Path (Split-Path $fullGitHubUrl -Parent) -Leaf
$repoUrl = "https://github.com/$username/$repo"
$newRepoUrl = "https://github.com/$username/$newRepo"

# Derived variables
$repoPath = Join-Path $pathToGitHub $repo
$newRepoPath = Join-Path $pathToGitHub $newRepo

# Check for GitHub Token in the environment
if ($env:GITHUB_TOKEN) {
  # Set up credentials for GitHub token
  git config --global credential.helper store
  $credentialContent = "url=$newRepoUrl`nusername=$username`npassword=$env:GITHUB_TOKEN"
  [System.IO.File]::WriteAllText("${HOME}/.git-credentials", $credentialContent)
}

# Clone the repository
git clone $repoUrl $repoPath

# Navigate to the cloned repository
Set-Location $repoPath

# Checkout the specific commit
git checkout $commitSha

# Initialize a new repository at this commit
Set-Location $pathToGitHub
git init $newRepoPath
Set-Location $newRepoPath
git pull $repoPath

# Set up remote for the new repository
git remote add origin $newRepoUrl

# Push to the new repository
git push -u origin main
