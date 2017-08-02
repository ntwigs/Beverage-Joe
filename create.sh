#!/bin/bash

PATH="$(dirname "$0")"
source ${PATH}/css.sh
source ${PATH}/html.sh

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

function create_project() {
  cd $PWD
  npm init
  # npm install --save-dev\
  #   babel-core\
  #   babel-loader\
  #   babel-plugin-transform-class-properties\
  #   babel-preset-es2015\
  #   css-loader\
  #   html-loader\
  #   html-webpack-plugin\
  #   style-loader\
  #   url-loader\
  #   webpack\
  #   webpack-dev-server
  mkdir src
  cd src
  mkdir image
  mkdir js
  mkdir style
  mkdir view
  touch view/index.$1
  touch style/index.$2
  echo "import '../style/index.$2'" >> js/index.js
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
  echo $(clear)
  local html_choice=$(get_html_choice)
  echo $(clear)
  local css_choice=$(get_css_choice)
  echo $(clear)
  present_choices ${html_choice} ${css_choice}
  local confirm_choice=$(get_confirm_choice)
  echo $(clear)
  proceed $confirm_choice $html_choice $css_choice
}

initialize