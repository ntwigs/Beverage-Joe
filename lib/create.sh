#!/bin/bash

path="$(dirname "$0")"
source ${path}/lib/css.sh
source ${path}/lib/html.sh

function create_project() {
  cd $PWD
  local html_extension=$(get_html_extension $1)
  local css_extension=$(get_css_extension $2)
  # npm init
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
  # mkdir src
  # cd src
  # mkdir image
  # mkdir js
  # mkdir style
  # mkdir view
  # touch view/index.$1
  # touch style/index.$2
  # echo "import '../style/index.$2'" >> js/index.js
}