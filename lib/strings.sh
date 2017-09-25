#!/bin/bash

source ${path}/config.sh # get_package get_webpack_content

# ENTRY MESSAGES #
confirmation="Are you ok with this? [y/n] "
no_name="
  You have to set a name
  Ex. create-joe amazing-project
"

## GENERATES SELECTION PRESENTATION ##
# $1: Html choice
# $2: Css choice
function present_choices() {
  echo "
    Selected HTML: $1
    Selected CSS: $2
  "
}

# COMMON MESSAGES #
invalid_option="Select valid option"

# HTML #

## HTML MESSAGES ##
html_message="What HTML template engine would you like?: "

## HTML LOADERS ##
html_loader="{
        test: /\.html$/,
        loader: 'html-loader'
      },"

haml_loader="{
        test: /\.(html|haml|hamlc)$/,
        loader: 'haml-loader'
      },"

pug_loader="{
        test: /\.pug$/,
        loader: 'html-loader!pug-html-loader?pretty&exports=false'
      },"

handlebars_loader="{
        test: /\.(hbs|handlebars)$/,
        loader: 'handlebars-loader'
      },"

# CSS #

## CSS MESSAGES ##
css_message="What CSS post-processor would you like?: "

## CSS LOADERS ##
css_loader="{
        test: /\.css$/,
        loaders: 'style-loader!css-loader?minimize=true'
      },"
          
sass_loader="{
        test: /\.scss$/,
        loaders: 'style-loader!css-loader?minimize=true!sass-loader'
      },"

stylus_loader="{
        test: /\.styl$/,
        loaders: 'style-loader!css-loader?minimize=true!stylus-loader'
      },"

less_loader="{
        test: /\.less$/,
        loaders: 'style-loader!css-loader?minimize=true!less-loader'
      },"

## GENERATE WEBPACK CONTENT ##
# $1: Chosen html extension
# $2: Html loader
# $3: Css loader
function get_webpack_content() {
  echo "
const path = require('path')
const webpack = require('webpack')
const HtmlWebpackPlugin = require('html-webpack-plugin')

module.exports = {
  context: path.resolve(__dirname, './$root_folder'), // Dev Source
  entry: [
    'webpack/hot/only-dev-server',
    './$javascript_folder/$javascript_index.js',
  ],
  output: {
    path: path.resolve(__dirname, './$build_folder'), // Build folder
    filename: '[name].bundle.js',
    publicPath: '' // The Build folder root
  },
  devServer: {
    contentBase: path.resolve(__dirname, './$root_folder'), // Dev Source
    watchContentBase: true,
    hot: true,
    inline: true,
    port: $port
  },
  plugins: [
    new webpack.HotModuleReplacementPlugin(),
    new HtmlWebpackPlugin({
      title: 'index.html',
      template: '$pages_folder/$pages_index.$1' // Index HTML file
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
}"
}

## GENERATE PACKAGE.JSON CONTENT ##
# $1: Project name
function get_package() {
  echo "{
    \"name\": \"$1\",
    \"version\": \"0.0.1\",
    \"description\": \"\",
    \"main\": \"js/index.js\",
    \"scripts\": {
      \"start\": \"webpack-dev-server\",
      \"build\": \"webpack\"
    },
    \"author\": \"\",
    \"license\": \"ISC\",
    \"devDependencies\": {}
  }"
}

## GITIGNORE ##
gitignore="node_modules"