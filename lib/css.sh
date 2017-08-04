#!/bin/bash

source ${path}/lib/strings.sh # * CSS Loaders

# Extensions #
standard="css"
sass="scss"
stylus="styl"
less="less"

css_choices=(
  standard
  sass
  stylus
  less
)

function get_css_loader_information() {
  case $1 in
    standard)
      echo "$CSS_LOADER"
      ;;
    sass)
      echo "$SASS_LOADER"
      ;;
    stylus)
      echo "$STYLUS_LOADER"
      ;;
    less)
      echo "$LESS_LOADER"
      ;;
  esac
}

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

function get_css_extension() {
  case $1 in
    standard)
      echo ${standard}
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
  PS3=${css}
  select choice in "${css_choices[@]}"
  do
    case $choice in
      standard)
        echo standard
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
