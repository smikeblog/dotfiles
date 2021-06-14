fzf.ch() {
  cd ~/Sync/Cheatsheets
local files
  IFS=$'\n' files=($(fzf-tmux --query="$1" --multi --select-1 --exit-0))
  [[ -n "$files" ]] && xdg-open "${files[@]}" &
}
