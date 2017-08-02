#!/bin/bash

CSS="What CSS post-processor would you like?: "
INVALID_OPTION="Select valid option"

STANDARD="css"
SASS="sass"
SCSS="scss"
STYLUS="styl"
LESS="less"

css_choices=(
  STANDARD
  SASS
  SCSS
  STYLUS
  LESS
)

function get_css_extension() {
  case $1 in
    STANDARD)
      echo ${STANDARD}
      ;;
    SASS)
      echo ${SASS}
      ;;
    SCSS)
      echo ${SCSS}
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
      SCSS)
        echo SCSS
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
      POSTCSS)
        echo POSTCSS
        break
        ;;
      *)
        echo ${INVALID_OPTION}
        ;;
    esac
  done
}

export -f get_css_choice