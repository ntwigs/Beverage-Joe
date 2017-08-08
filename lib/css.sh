#!/bin/bash

source ${path}/lib/strings.sh # * CSS Loaders

# Extensions #
css="css"
sass="scss"
stylus="styl"
less="less"

css_choices=(
  css
  sass
  stylus
  less
)

# $1: Css choice
function get_css_loader_information() {
  case $1 in
    css)
      echo "$css_loader"
      ;;
    sass)
      echo "$sass_loader"
      ;;
    stylus)
      echo "$stylus_loader"
      ;;
    less)
      echo "$less_loader"
      ;;
  esac
}

# $1: Css choice
function install_css_dependency() {
  case $1 in
    sass)
      npm install --save-dev sass-loader node-sass sass
      ;;
    stylus)
      npm install --save-dev stylus-loader stylus
      ;;
    less)
      npm install --save-dev less-loader less
      ;;
  esac
}

# $1: Css choice
function get_css_extension() {
  case $1 in
    css)
      echo ${css}
      ;;
    sass)
      echo ${sass}
      ;;
    stylus)
      echo ${stylus}
      ;;
    less)
      echo ${less}
      ;;
  esac
}

function get_css_choice() {
  PS3=${css_message}
  select choice in "${css_choices[@]}"
  do
    case $choice in
      css)
        echo css
        break
        ;;
      sass)
        echo sass
        break
        ;;
      stylus)
        echo stylus
        break
        ;;
      less)
        echo less
        break
        ;;
      *)
        echo ${invalid_option}
        ;;
    esac
  done
}
