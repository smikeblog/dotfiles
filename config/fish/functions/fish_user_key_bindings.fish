function fish_user_key_bindings
  fzf_key_bindings
  # lf chabge dir by ctrl-o
  bind \co 'lfcd; commandline -f repaint'
end

