#!/bin/bash

path="$(dirname "$0")" # Bash directory
source ${path}/lib/css.sh # get_css_extension get_css_loader_information
source ${path}/lib/html.sh # get_html_extension get_html_loader_informationsven
source ${path}/lib/strings.sh # get_package get_webpack_content
source ${path}/config.sh # get_package get_webpack_content

function install_main_dependencies() {
  npm install --save-dev\
    babel-core\
    babel-loader\
    babel-plugin-transform-class-properties\
    babel-preset-es2015\
    css-loader\
    html-loader\
    html-webpack-plugin\
    style-loader\
    url-loader\
    webpack\
    webpack-dev-server
}

function write_webpack_config() {
  cat << EOF > webpack.config.js 
    $1
EOF
}

function write_package_config() {
  cat << EOF > package.json 
    $1
EOF
}

function create_folder_structure() {
  mkdir "$root_folder"
  cd "$root_folder"
  mkdir "$images_folder" # For images
  mkdir "$javascript_folder" # For JavaScript
  mkdir "$stylesheet_folder" # For Css
  mkdir "$pages_folder" # For html
  touch "$pages_folder"/"$pages_index"."$1"
  touch "$stylesheet_folder"/"$stylesheet_index"."$2"
  echo "import '../$stylesheet_folder/$stylesheet_index.$2'" >> "$javascript_folder"/"$javascript_index".js
}

function set_directory() {
  mkdir "$1"
  cd "$1"
}

function create_project() {
  set_directory "$3"

  local package_content=$(get_package "$3")
  write_package_config "$package_content"

  install_main_dependencies
  install_html_dependency $1
  install_css_dependency $2
  
  local html_extension=$(get_html_extension $1)
  local css_extension=$(get_css_extension $2)
  local html_loader=$(get_html_loader_information $1)
  local css_loader=$(get_css_loader_information $2)
  local webpack_content=$(get_webpack_content "$html_extension" "$html_loader" "$css_loader")

  write_webpack_config "$webpack_content"
  create_folder_structure $html_extension $css_extension
}
