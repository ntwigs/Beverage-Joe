#!/bin/bash

path="$(dirname "$0")"
source ${path}/lib/css.sh
source ${path}/lib/html.sh



function create_project() {
  cd $PWD
  local html_extension=$(get_html_extension $1)
  local css_extension=$(get_css_extension $2)
  
  # npm init
  # npm install --save-dev\
  #   babel-core\
  #   babel-loader\
  #   babel-plugin-transform-class-properties\
  #   babel-preset-es2015\
  #   css-loader\
  #   html-loader\
  #   html-webpack-plugin\
  #   style-loader\
  #   url-loader\
  #   webpack\
  #   webpack-dev-server
  local webpack_content=$(get_webpack_content $html_extension $css_extension)

  cat << EOF > webpack.config.js 
    $webpack_content
EOF # This cannot be indented

  # mkdir src
  # cd src
  # mkdir image
  # mkdir js
  # mkdir style
  # mkdir view
  # touch view/index.$html_extension
  # touch style/index.$css_extension
  # echo "import '../style/index.$css_extension'" >> js/index.js
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
          {
            test: /\.$2$/,
            loaders: 'style-loader!css-loader?minimize=true!stylus-loader'
          },
          {
            test: /\.pug$/,
            loader: 'html-loader!pug-html-loader?pretty&exports=false'
          },
          {
            test: /\.(png|jpg|gif)$/,
            loaders: 'url-loader'
          }
        ],
      },
    }
  "
}
