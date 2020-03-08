# Tenpureto propagate-changes GitHub Action

This action helps with [tenpureto](https://tenpureto.org/) templates maintenance by making sure template changes are propagated between branches.
Whenever a new change is pushed to a branch, the action will create pull-requests with the change to the child template branches.

## Inputs

### `pull-request-label`

**Optional** A label to assign to the pull requests created by the action. This may be useful by itself, or if you want to auto-merge these pull requests.

## Outputs

## Example usage

```yaml
name: Propagate template changes

on: [push]

jobs:
  propagate:
    name: Propagate template changes
    # Most likely you don't want to run this action on the template forks
    if: github.repository == 'my/repository'
    runs-on: ubuntu-latest
    steps:
    - uses: tenpureto/propagate-changes-action@v1
      with:
        pull-request-label: pr:propagating-changes
      env:
        GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
```
