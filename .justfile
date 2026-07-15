set default-list := true

# Show commits from a reference branch that are not in a target branch
compare-branch-commits:
    #!/usr/bin/env bash
    set -euo pipefail

    printf "Reference branch containing the commits to check from (ensure up-to-date): "
    read -r reference_branch

    printf "Target branch to compare against (ensure up-to-date): "
    read -r target_branch

    printf "Show per-commit file change stats? [y/N]: "
    read -r verbose_choice

    verbose_flag=()

    case "$verbose_choice" in
      y|Y|yes|YES)
        verbose_flag=(--stat)
        ;;
    esac

    git fetch
    git log "$target_branch..$reference_branch" --oneline --no-merges --cherry-pick "${verbose_flag[@]}"

# Create an agent worktree in ../<repo>.worktrees for a branch name
create-agent-worktree branch_name:
    #!/usr/bin/env bash
    set -euo pipefail

    worktrees_dir="../$(basename "$PWD").worktrees"
    git worktree add "$worktrees_dir/{{branch_name}}" -b "agent/{{branch_name}}" HEAD

# Remove an agent worktree in ../<repo>.worktrees for a branch name
rm-agent-worktree branch_name:
    #!/usr/bin/env bash
    set -euo pipefail

    worktrees_dir="../$(basename "$PWD").worktrees"
    git worktree remove "$worktrees_dir/{{branch_name}}"
    git branch -d "agent/{{branch_name}}" || true
