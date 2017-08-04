#!/bin/bash

path="$(dirname "$0")" # Bash directory
source ${path}/lib/css.sh # get_css_extension get_css_loader_information
source ${path}/lib/html.sh # get_html_extension get_html_loader_information

function install_main_dependencies() {
  npm init
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
    $webpack_content
EOF # This cannot be indented (End of File)
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
          $4
          $5
          {
            test: /\.(png|jpg|gif)$/,
            loaders: 'url-loader'
          }
        ],
      },
    }
  "
}

function create_project() {
  cd $PWD

  install_main_dependencies
  
  local html_extension=$(get_html_extension $1)
  local css_extension=$(get_css_extension $2)
  local html_loader=$(get_html_loader_information $1)
  local css_loader=$(get_css_loader_information $2)
  local webpack_content=$(get_webpack_content $html_extension $css_extension $html_loader $css_loader)

  write_webpack_config
  create_folder_structure $html_extension $css_extension
}
