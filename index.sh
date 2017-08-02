#!/bin/bash

path="$(dirname "$0")"
source ${path}/lib/css.sh
source ${path}/lib/html.sh
source ${path}/lib/create.sh
source ${path}/lib/utils.sh

## STRINGS ##
CONFIRMATION="Are you ok with this? (y/n/q) "

function present_choices() {
  echo "
    Selected HTML: $1
    Selected CSS: $2
  "
}

function get_confirm_choice() {
  read -p "$CONFIRMATION" -n 1 -r
  echo $REPLY
}

function proceed() {
  if [[ $1 =~ ^[Yy]$ ]]; then
    create_project $2 $3
    exit 1
  elif [[ $1 =~ ^[Nn]$ ]]; then
    clear
    initialize
  elif [[ $1 =~ ^[Qq]$ ]]; then
    exit 1
  fi
}

function initialize() {

  # Selection
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