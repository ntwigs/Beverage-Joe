#!/bin/bash

HTML="What HTML template engine would you like?: "
INVALID_OPTION="Select valid option"

STANDARD="Standard"
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

export -f get_html_choice