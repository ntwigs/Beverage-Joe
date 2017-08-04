#!/bin/bash

path="$(dirname "$0")" # Bash directory
source ${path}/lib/css.sh # get_css_extension get_css_loader_information
source ${path}/lib/html.sh # get_html_extension get_html_loader_informationsven

function install_main_dependencies() {
  npm install --save-dev\
    babel-core\
    babel-loader\
    babel-plugin-transform-class-properties\
    babel-preset-es2015\
    css-loader\
    html-loader\
    html-webpack-plugin\
    style-loader\
    url-loader\
    webpack\
    webpack-dev-server
}

function write_webpack_config() {
  cat << EOF > webpack.config.js 
    $1
EOF
}

function write_package_config() {
  cat << EOF > package.json 
    $1
EOF
}

function create_folder_structure() {
  mkdir src
  cd src
  mkdir image
  mkdir js
  mkdir style
  mkdir view
  touch view/index.$1
  touch style/index.$2
  echo "import '../style/index.$2'" >> js/index.js
}

function get_webpack_content() {
  echo "
    const path = require('path')
    const webpack = require('webpack')
    const HtmlWebpackPlugin = require('html-webpack-plugin')

    module.exports = {
      context: path.resolve(__dirname, './src'),
      entry: {
        index: './view/index.$1',
        bundle: './js/index.js'
      },
      output: {
        path: path.resolve(__dirname, './build'),
        filename: '[name].bundle.js',
        publicPath: '/'
      },
      devServer: {
        contentBase: path.resolve(__dirname, './src'),
        watchContentBase: true,
        hot: true,
        inline: true,
      },
      plugins: [
        new webpack.HotModuleReplacementPlugin(),
        new HtmlWebpackPlugin({
          title: 'index.html',
          template: 'view/index.$1'
        })
      ],
      module: {
        rules: [
          {
            test: /\.js$/,
            exclude: [/node_modules/],
            use: [{
              loader: 'babel-loader',
              options: { 
                presets: ['es2015'],
                plugins: ['transform-class-properties']
              }
            }],
          },
          $2
          $3
          {
            test: /\.(png|jpg|gif)$/,
            loaders: 'url-loader'
          }
        ],
      },
    }
  "
}

function get_package() {
  echo "{
    \"name\": \"$1\",
    \"version\": \"0.0.1\",
    \"description\": \"\",
    \"main\": \"js/index.js\",
    \"scripts\": {
      \"start\": \"webpack-dev-server\"
    },
    \"author\": \"\",
    \"license\": \"ISC\",
    \"devDependencies\": {}
  }"
}

function set_directory() {
  mkdir "$1"
  cd "$1"
}

function create_project() {
  set_directory "$3"

  local package_content=$(get_package "$3")
  write_package_config "$package_content"

  install_main_dependencies
  install_html_dependency $1
  install_css_dependency $2
  
  local html_extension=$(get_html_extension $1)
  local css_extension=$(get_css_extension $2)
  local html_loader=$(get_html_loader_information $1)
  local css_loader=$(get_css_loader_information $2)
  local webpack_content=$(get_webpack_content "$html_extension" "$html_loader" "$css_loader")

  write_webpack_config "$webpack_content"
  create_folder_structure $html_extension $css_extension
}
