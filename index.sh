#!/bin/bash

path="$(dirname "$0")" # Bash directory
source ${path}/lib/css.sh # get_css_choice
source ${path}/lib/html.sh # get_html_choice
source ${path}/lib/create.sh # create_project
source ${path}/lib/utils.sh # cls
source ${path}/lib/strings.sh # confirmation no_name present_choices


# Gets one input from user
function get_confirm_choice() {
  read -p "$confirmation" -n 1 -r
  echo $REPLY
}

# Proceeds with selecting the task that matches the input
# $1: Selected option
# $2: html choice
# $3: css choice
# $4: project name
function proceed() {
  if [[ $1 =~ ^[Yy]$ ]]; then
    create_project $2 $3 $4 
  elif [[ $1 =~ ^[Nn]$ ]]; then
    cls
    initialize $4
  fi
}

# $1: Project name or Empty
function check_name() {
  if [[ -z "${1// }" ]]; then
    echo "$no_name"
    exit 1
  fi
}


# $1: Project name
function initialize() {
  check_name $1
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

initialize $1 # Initializes with project name