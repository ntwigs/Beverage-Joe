#!/bin/bash

path="$(dirname "$0")" # Bash directory
source ${path}/lib/css.sh # get_css_choice
source ${path}/lib/html.sh # get_html_choice
source ${path}/lib/create.sh # create_project
source ${path}/lib/utils.sh # cls

## STRINGS ##
CONFIRMATION="Are you ok with this? (y/n/q) "

# Presents the selected choices to user for evaluation
function present_choices() {
  echo "
    Selected HTML: $1
    Selected CSS: $2
  "
}

# Gets one input from user
function get_confirm_choice() {
  read -p "$CONFIRMATION" -n 1 -r
  echo $REPLY
}

# Proceeds with selecting the task that matches the input
function proceed() {
  if [[ $1 =~ ^[Yy]$ ]]; then
    create_project $2 $3
  elif [[ $1 =~ ^[Nn]$ ]]; then
    cls
    initialize
  elif [[ $1 =~ ^[Qq]$ ]]; then
    exit 1
  fi
}

function initialize() {
  cls
  local html_choice=$(get_html_choice)
  cls
  local css_choice=$(get_css_choice)
  cls
  present_choices ${html_choice} ${css_choice}
  local confirm_choice=$(get_confirm_choice)
  cls
  proceed $confirm_choice $html_choice $css_choice
}

initialize