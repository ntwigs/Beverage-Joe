#!/bin/bash

CSS="What CSS post-processor would you like?: "
INVALID_OPTION="Select valid option"

STANDARD="Standard"
SASS="Sass"
SCSS="SCSS"
STYLUS="Stylus"
LESS="LESS"
POSTCSS="PostCSS"

css_choices=(
  STANDARD
  SASS
  SCSS
  STYLUS
  LESS
  POSTCSS
)

function get_css_choice() {
  PS3=${CSS}
  select choice in "${css_choices[@]}"
  do
    case $choice in
      STANDARD)
        echo ${STANDARD}
        break
        ;;
      SASS)
        echo ${SASS}
        break
        ;;
      SCSS)
        echo ${SCSS}
        break
        ;;
      STYLUS)
        echo ${STYLUS}
        break
        ;;
      LESS)
        echo ${LESS}
        break
        ;;
      POSTCSS)
        echo ${POSTCSS}
        break
        ;;
      *)
        echo ${INVALID_OPTION}
        ;;
    esac
  done
}

export -f get_css_choice