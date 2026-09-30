#!/usr/bin/env bash

get_script_dir()
{
  local SOURCE_PATH="${BASH_SOURCE[0]}"
  local SYMLINK_DIR
  local SCRIPT_DIR
  # Resolve symlinks recursively
  while [ -L "$SOURCE_PATH" ]; do
    # Get symlink directory
    SYMLINK_DIR="$( cd -P "$( dirname "$SOURCE_PATH" )" >/dev/null 2>&1 && pwd )"
    # Resolve symlink target (relative or absolute)
    SOURCE_PATH="$(readlink "$SOURCE_PATH")"
    # Check if candidate path is relative or absolute
    if [[ $SOURCE_PATH != /* ]]; then
      # Candidate path is relative, resolve to full path
      SOURCE_PATH=$SYMLINK_DIR/$SOURCE_PATH
    fi
  done
  # Get final script directory path from fully resolved source path
  SCRIPT_DIR="$(cd -P "$( dirname "$SOURCE_PATH" )" >/dev/null 2>&1 && pwd)"
  echo "$SCRIPT_DIR"
}


function RevealHomeFolder() {

  files_dir=$(get_script_dir)

  Log 'Revealing $HOME folder\n'
  if [[ $aconfmgr_action == 'check' ]]; then
    rg '\$HOME' -. -q ${files_dir}/files || true
  elif [[ $aconfmgr_action == 'apply' ]] || [[ $aconfmgr_action == 'save' ]]; then
    for jsonfile in $(rg '\$HOME' -. -l --color=never ${files_dir}/files || echo ''); do
      #target=$(echo ${jsonfile} | sed -E "s/files\/homedots\///g" -)
      target=${files_dir}/${jsonfile}
      echo $jsonfile
      sed -i -E 's:$HOME:'"${HOME}"':g' ${jsonfile}
    done
  fi
}

function HideHomeFolder() {
  local files_dir=$(get_script_dir)
  echo 'Hiding real path with $HOME\n'
  if [[ $aconfmgr_action == 'check' ]]; then
    rg "${HOME}" -. ${files_dir}/files || true
  elif [[ $aconfmgr_action == 'apply' ]] || [[ $aconfmgr_action == 'save' ]]; then
    for jsonfile in $(rg "${HOME}" -. -l --color=never ${files_dir}/files || echo ''); do
      echo $jsonfile
      sed -i -E 's:'"${HOME}"':$HOME:g'  ${jsonfile}
    done
  fi
}
