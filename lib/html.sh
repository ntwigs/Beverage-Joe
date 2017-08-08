#!/bin/bash

source ${path}/lib/strings.sh # * HTML Loaders

html="html"
haml="haml"
pug="pug"
handlebars="hbs"

html_choices=(
  html
  haml
  pug
  handlebars
)

# $1: Html choice
function get_html_loader_information() {
  case $1 in
    html)
      echo "$html_loader"
      ;;
    haml)
      echo "$haml_loader"
      ;;
    pug)
      echo "$pug_loader" 
      ;;
    handlebars)
      echo "$handlebars_loader"
      ;;
  esac
}

# $1: Html choice
function install_html_dependency() {
  case $1 in
    haml)
      npm install --save-dev haml-loader
      ;;
    pug)
      npm install --save-dev pug pug-html-loader
      ;;
    handlebars)
      npm install --save-dev handlebars-loader handlebars
      ;;
  esac
}

# $1: Html choice
function get_html_extension() {
  case $1 in
    html)
      echo ${html}
      ;;
    haml)
      echo ${haml}
      ;;
    pug)
      echo ${pug}
      ;;
    handlebars)
      echo ${handlebars}
      ;;
  esac
}

function get_html_choice() {
  PS3=${html_message}
  select choice in "${html_choices[@]}"
  do
    case $choice in
      html)
        echo html
        break
        ;;
      haml)
        echo haml
        break
        ;;
      pug)
        echo pug
        break
        ;;
      handlebars)
        echo handlebars
        break
        ;;
      *)
        echo ${invalid_option}
        ;;
    esac
  done
}
