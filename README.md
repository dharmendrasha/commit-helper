<p align="center">
  <a href="https://github.com/dharmendrasha/commit-helper" target="blank"><img src="https://www.drupal.org/files/project-images/github_commits_logo.png" width="180" alt="GIT HUB" /></a>
</p>

[circleci-image]: https://github.com/dharmendrasha/commit-helper
[circleci-url]: https://github.com/dharmendrasha/commit-helper

<p align="center">
  <a href="https://github.com/dharmendrasha/commit-helper" target="_blank">COMMIT-HELPER</a>
  <br/>
  Simple elegent efficient commit helper for your code
</p>

## Description

[Commit helper](https://github.com/dharmendrasha/commit-helper) standerd git commit helper for your code.

## Core Features

- Stash your code before commit
- Pull code before commit
- Push code in your current repo
- Default subject : feat
- Default module : current branch
- Current commit can be your last commit

## Installation

```bash
curl -o commit.sh https://raw.githubusercontent.com/dharmendrasha/commit-helper/main/commit.sh && chmod -R 777 commit.sh
```

## Usage
```bash
# Simple commit and push
./commit.sh

# Last commit and push
./commit.sh last

# Pull before commit and push
./commit.sh pull

# Stash before commit and push
./commit.sh stash
```


## Contribution Guidelines

### Git

1. Never commit directly to master, create a new branch from dev and submit a pull request to dev.
2. master will be only merged with dev branch.
3. New branch shall be created from dev.
4. PR to be sent to dev branch for review and code to be tested on dev branch after merge.
5. Branch name should be in following format:
   `{feat|fix|chore|revert}/NBX-{issue_number}/{small_description}`
   `Example: feat/NBX-1/project-setup`
6. Code commit should be done in following sample format. Note: Will also be linted via commitlint. Also check commitlint.config.js for detailed rules
   `{feat|fix|chore|refactor|test}({module_name}): [NBX-{issue_number}] {commit_desciption}`
   `Example: feat(user-auth): [NBX-9] user auth APIs added`

### Code

1. To be written in Typescript with no explict any.
2. Types should be scoped by modules and if used at multiple places should be scoped in common types
3. Create Nest modules for new features.
4. All features should be scoped such that they are unplugable and less interdependent.
5. In case of dependencies on other modules try to use and define mapper functions which call the other dependency. This will help in cases where we want to replace the module with another one. For example, if we are consuming a postgres module in the auth module, then create a mapper/helper class inside the auth module which handles conversations/calls to postgres module. Thus if we want to replace the postgres module with mysql or no-sql db then we'll just have to update the logic in this file only and not the whole module.

