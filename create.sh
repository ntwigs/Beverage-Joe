#!/bin/bash

## STRINGS ##
WELCOME="Hello! Starting a new project ey?"
HTML="What HTML template engine would you like?: "
CSS="What CSS post-processor would you like?: "
INVALID_OPTION="Select valid option"


## CHOICES ##

## COMMON ##
STANDARD="Standard"

## CSS ##
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

## HTML ##
HAML="Haml"
PUG="Pug"
HANDLEBARS="Handlebars"
SLIM="Slim"

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
        echo ${STANDARD}
        break
        ;;
      HAML)
        echo ${HAML}
        break
        ;;
      PUG)
        echo ${PUG}
        break
        ;;
      HANDLEBARS)
        echo ${HANDLEBARS}
        break
        ;;
      SLIM)
        echo ${SLIM}
        break
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

function present_choices() {
  echo "
    Selected HTML: $1
    Selected CSS: $2
  "
}

function get_confirm_choice() {
  read -p "Are you ok with this? (y/n/q) " -n 1 -r
  echo $REPLY
}

function initialize() {
  
  # Selection
  clear
  local html_choice=$(get_html_choice)
  clear
  local css_choice=$(get_css_choice)
  clear
  present_choices ${html_choice} ${css_choice}
  local confirm_choice=$(get_confirm_choice)
  clear
  if [[ $confirm_choice =~ ^[Yy]$ ]]; then
    echo "Creating project"
    exit 1  
  elif [[ $confirm_choice =~ ^[Nn]$ ]]; then
    clear
    initialize
  elif [[ $confirm_choice =~ ^[Qq]$ ]]; then
    exit 1
  fi
}

initialize