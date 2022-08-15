#!/usr/bin/bash
check() {
  if [[ -f $1 ]]; then
    echo Installation has done.
    exit 0
  else
    echo Installation has not success.
    exit 1
  fi
}
installation() {
  if [ $1 = "-c" ]; then
    cp copypath.nemo_action ~/.local/share/nemo/actions/
    check ~/.local/share/nemo/actions/copypath.nemo_action
  elif [ $1 = "-a" ]; then
    sudo cp copypath.nemo_action /usr/share/nemo/actions/
    check /usr/share/nemo/actions/copypath.nemo_action
  fi
}
PS3="Select to install for current user or all users: "
select reply in "Current user" "All users"; do
  case $reply in
    "Current user")
     	echo "Installing for current user." 
      if [ "$EUID" -eq 0 ]; then
        echo Root user cannot install for itself. To install for all user instead, press Enter. To abort press \"Ctrl+C\": 
        read
        if [ "$REPLY" = "" ]; then
          installation -a
        else
          echo Installation aborted by user.
        fi
      else
        installation -c
      fi
    ;;
    "All users")
      if [ "$EUID" -eq 0 ]; then
      	echo -n Installing for all users.
        installation -a
      else
        echo -n Installing for all users, needs root privileges. To install for current user only instead, press Enter. To abort press \"Ctrl+C\": 
        read
        if [ "$REPLY" = "" ]; then
          installation -c
        else
          echo Installation aborted by user.
        fi
      fi
    ;;
  esac
done
