#!/bin/bash

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