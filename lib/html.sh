#!/bin/bash

HTML="What HTML template engine would you like?: "
INVALID_OPTION="Select valid option"

STANDARD="html"
HAML="haml"
PUG="pug"
HANDLEBARS="hbs"

html_choices=(
  STANDARD
  HAML
  PUG
  HANDLEBARS
)

function get_loader_information() {
  case $1 in
    STANDARD)
      echo "
        {
          test: /\.html$/,
          loader: 'html-loader'
        },
      "
      ;;
    HAML)
      echo "
        {
          test: /\.(html|haml|hamlc)$/,
          loader: 'haml-loader'
        },
      "
      ;;
    PUG)
      echo "
        {
          test: /\.pug$/,
          loader: 'html-loader!pug-html-loader?pretty&exports=false'
        }
      "
      ;;
    HANDLEBARS)
      npm install --save-dev handlebars-loader handlebars
      echo ${HANDLEBARS}
      ;;
  esac
}

function get_html_extension() {
  case $1 in
    STANDARD)
      echo ${STANDARD}
      ;;
    HAML)
      npm install --save-dev haml-loader
      echo ${HAML}
      ;;
    PUG)
      npm install --save-dev pug pug-html-loader
      echo ${PUG}
      ;;
    HANDLEBARS)
      npm install --save-dev handlebars-loader handlebars
      echo ${HANDLEBARS}
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
      *)
        echo ${INVALID_OPTION}
        ;;
    esac
  done
}

export -f get_html_choice