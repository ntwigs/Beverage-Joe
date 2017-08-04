#!/bin/bash

path="$(dirname "$0")" # Bash directory
source ${path}/lib/css.sh # get_css_choice
source ${path}/lib/html.sh # get_html_choice
source ${path}/lib/create.sh # create_project
source ${path}/lib/utils.sh # cls
source ${path}/lib/strings.sh # CONFIRMATION NO_NAME present_choices


# Gets one input from user
function get_confirm_choice() {
  read -p "$CONFIRMATION" -n 1 -r
  echo $REPLY
}

# Proceeds with selecting the task that matches the input
function proceed() {
  if [[ $1 =~ ^[Yy]$ ]]; then
    create_project $2 $3 $4
  elif [[ $1 =~ ^[Nn]$ ]]; then
    cls
    initialize
  elif [[ $1 =~ ^[Qq]$ ]]; then
    exit 1
  fi
}

function check_name() {
  if [[ -z "${1// }" ]]; then
    echo "$NO_NAME"
    exit 1
  fi
}

function initialize() {
  check_name $1 # $1 is the first argument which should be a name
  cls
  local html_choice=$(get_html_choice)
  cls
  local css_choice=$(get_css_choice)
  cls
  present_choices ${html_choice} ${css_choice}
  local confirm_choice=$(get_confirm_choice)
  cls
  proceed $confirm_choice $html_choice $css_choice $1
}

initialize $1