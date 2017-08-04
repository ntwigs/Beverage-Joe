#!/bin/bash

source ${path}/lib/strings.sh # * CSS Loaders

STANDARD="css"
SASS="scss"
STYLUS="styl"
LESS="less"

css_choices=(
  STANDARD
  SASS
  STYLUS
  LESS
)

function get_css_loader_information() {
  case $1 in
    STANDARD)
      echo "$CSS_LOADER"
      ;;
    SASS)
      echo "$SASS_LOADER"
      ;;
    STYLUS)
      echo "$STYLUS_LOADER"
      ;;
    LESS)
      echo "$LESS_LOADER"
      ;;
  esac
}

function install_css_dependency() {
  case $1 in
    SASS)
      npm install --save-dev sass-loader node-sass sass
      ;;
    STYLUS)
      npm install --save-dev stylus-loader stylus
      ;;
    LESS)
      npm install --save-dev less-loader less
      ;;
  esac
}

function get_css_extension() {
  case $1 in
    STANDARD)
      echo ${STANDARD}
      ;;
    SASS)
      echo ${SASS}
      ;;
    STYLUS)
      echo ${STYLUS}
      ;;
    LESS)
      echo ${LESS}
      ;;
  esac
}

function get_css_choice() {
  PS3=${CSS}
  select choice in "${css_choices[@]}"
  do
    case $choice in
      STANDARD)
        echo STANDARD
        break
        ;;
      SASS)
        echo SASS
        break
        ;;
      STYLUS)
        echo STYLUS
        break
        ;;
      LESS)
        echo LESS
        break
        ;;
      *)
        echo ${INVALID_OPTION}
        ;;
    esac
  done
}
