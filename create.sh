#!/bin/bash

## STRINGS ##
WELCOME="Hello! Starting a new project ey?"
HTML="What HTML template engine would you like?: "
CSS="What CSS post-processor would you like?: "
INVALID_OPTION="Select valid option"


## CHOICES ##

## COMMON ##
STANDARD="1. Standard"

## CSS ##
SASS="2. Sass"
SCSS="3. SCSS"
STYLUS="4. Stylus"
LESS="5. LESS"
POSTCSS="6. PostCSS"

css_choices=(
  STANDARD
  SASS
  SCSS
  STYLUS
  LESS
  POSTCSS
)

## HTML ##
HAML="2. Haml"
PUG="3. Pug"
HANDLEBARS="4. Handlebars"
SLIM="5. Slim"

html_choices=(
  STANDARD
  HAML
  PUG
  HANDLEBARS
  SLIM
)

function get_html_choice() {
  PS3=${HTML}
  select choice in "${html_choices[@]}"
  do
    case $choice in
      STANDARD)
        return ${STANDARD}
        ;;
      HAML)
        return ${HAML}
        ;;
      PUG)
        return ${PUG}
        ;;
      HANDLEBARS)
        return ${HANDLEBARS}
        ;;
      SLIM)
        return ${SLIM}
        ;;
      *)
        echo ${INVALID_OPTION}
        ;;
    esac
  done
}

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

function initialize() {
  local res=$(get_css_choice)
  echo $res
}

initialize