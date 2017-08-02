#!/bin/bash

HTML="What HTML template engine would you like?: "
INVALID_OPTION="Select valid option"

STANDARD="html"
HAML="haml"
PUG="pug"
HANDLEBARS="hbs"
SLIM="slim"

html_choices=(
  STANDARD
  HAML
  PUG
  HANDLEBARS
  SLIM
)

function get_html_extension() {
  case $1 in
    STANDARD)
      echo ${STANDARD}
      ;;
    HAML)
      echo ${HAML}
      ;;
    PUG)
      echo ${PUG}
      ;;
    HANDLEBARS)
      echo ${HANDLEBARS}
      ;;
    SLIM)
      echo ${SLIM}
      ;;
  esac
}

function get_html_choice() {
  PS3=${HTML}
  select choice in "${html_choices[@]}"
  do
    case $choice in
      STANDARD)
        echo STANDARD
        break
        ;;
      HAML)
        echo HAML
        break
        ;;
      PUG)
        echo PUG
        break
        ;;
      HANDLEBARS)
        echo HANDLEBARS
        break
        ;;
      SLIM)
        echo SLIM
        break
        ;;
      *)
        echo ${INVALID_OPTION}
        ;;
    esac
  done
}

export -f get_html_choice