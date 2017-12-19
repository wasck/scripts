apkgws=(
  htop
  sshfs
  zsh
  tree
  vim
  wget
  curl
  atom
  git
  i3
  dmenu
  feh
  gcc
  jdk8-openjdk
  jdk9-openjdk
);

apmpkg=(
  emmet
  linter
  linter-eslint
  linter-scss-lint
  highlight-selected
  minimap-highlight-selected
  file-icons
  pigments
  minimap
  autocomplete-paths
  autoclose-html
  simple-drag-drop-text
  atom-latex
  pdf-view
  ide-java
);

function setupManjaroClient{
  # update system
  sudo pacman -Syyu
  sudo pacman -S ${apkgws[*]}

  if [ ! -d ~/.config/i3 ]
  then
      mkdir -p ~/.config/i3
      cp /tmp/remoteData/i3/config.new ~/.config/i3/config
  fi

  for pack in ${apmpkg[*]}; do
    apm install $pack;
  done
}
