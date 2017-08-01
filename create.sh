!#/bin/bash

echo "Hello! Starting a new project ey?"
echo "What HTML template engine would you like?"

INVALID_OPTION = "Select valid option"

STANDARD = "1. Standard"
SASS = "2. Sass"
SCSS = "3. SCSS"
STYLUS = "4. Stylus"
LESS = "5. LESS"
POSTCSS = "6. PostCSS"

css_choices = (
  STANDARD
  SASS
  SCSS
  STYLUS
  LESS
  POSTCSS
)

select choice in "${ css_choices[@] }"
do
  case $choice in
    STANDARD)
      echo STANDRAD
      ;;
    SASS)
      echo SASS
      ;;
    SCSS)
      echo SCSS
      ;;
    STYLUS)
      echo STYLUS
      ;;
    LESS)
      echo LESS
      ;;
    POSTCSS)
      echo POSTCSS
      ;;
    *)
      echo INVALID_OPTION
      ;;
  esac
done