!#/bin/bash

## STRINGS ##
WELCOME="Hello! Starting a new project ey?"
HTML="What HTML template engine would you like?"
CSS="What CSS post-processor would you like?"
INVALID_OPTION="Select valid option"


## CHOICES ##

## CSS ##
STANDARD="1. Standard"
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


PS3='What CSS post-processor would you like?: '
select choice in "${css_choices[@]}"
do
  case $choice in
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
    POSTCSS)
      echo ${POSTCSS}
      ;;
    *)
      echo ${INVALID_OPTION}
      ;;
  esac
done