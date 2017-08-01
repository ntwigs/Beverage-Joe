#!/bin/bash

## STRINGS ##
WELCOME="Hello! Starting a new project ey?"
HTML="What HTML template engine would you like?"
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