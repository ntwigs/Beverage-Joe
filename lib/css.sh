#!/bin/bash

CSS="What CSS post-processor would you like?: "
INVALID_OPTION="Select valid option"

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
      echo "
        {
          test: /\.css$/,
          loaders: 'style-loader!css-loader?minimize=true'
        },
      "
      ;;
    SASS)
      echo "
        {
          test: /\.scss$/,
          loaders: 'style-loader!css-loader?minimize=true!sass-loader'
        },
      "
      ;;
    STYLUS)
      echo "
        {
          test: /\.styl$/,
          loaders: 'style-loader!css-loader?minimize=true!stylus-loader'
        },
      "
      ;;
    LESS)
      echo "
        {
          test: /\.less$/,
          loaders: 'style-loader!css-loader?minimize=true!less-loader'
        },
      "
      ;;
  esac
}

function get_css_extension() {
  case $1 in
    STANDARD)
      echo ${STANDARD}
      ;;
    SASS)
      npm install --save-dev sass-loader node-sass sass
      echo ${SASS}
      ;;
    STYLUS)
      npm install --save-dev stylus-loader stylus
      echo ${STYLUS}
      ;;
    LESS)
      npm install --save-dev less-loader less
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
