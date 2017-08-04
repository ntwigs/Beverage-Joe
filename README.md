# BEVERAGE-JOE
Create applications without configuration.

## How does it work?
It's a Bash script which creates a set of files in order to get you up and running. It currently supports the following CSS preprocessors and HTML template engines:

| CSS Preprocessor | HTML Engine |
|------------------|---------------|
|       None       |      None     | 
|       Sass       |   Handlebars  |
|      Stylus      |       Pug     |
|       Less       |      Haml     |

▶ Configured with Weback  
▶ It runs on the Webpack Development Server  
▶ Minified CSS which is added to inline for less requests  
▶ Supports ES6  
▶ Supports [Class Properties](https://babeljs.io/docs/plugins/transform-class-properties/)  
▶ Hot reload  
▶ Import stylsheets into JavaScript


The script will work anywhere Bash works. If it however does **not** work on your machine, please [file an issue](https://github.com/NorthernTwig/Beverage-Joe/issues/new).

    The default file structure is as followed: 
    .
    ├── node_modules
    ├── package.json
    ├── package-lock.json
    ├── src
    │   ├── image
    │   ├── js
    │   │   └── index.js
    │   ├── style
    │   │   └── index.x
    │   └── view
    │       └── index.y
    └── webpack.config.js

    The file structure can however be configured by editing the file webpack.config.js in order to suit your needs.

## Quick Overview
Run the shellscript by doing one of the two options in the Setup down below, and the run the following commands:

```sh
create-joe amazing-project
cd amazing-project
npm start
```
This will get everything up and running here:
[http://localhost:8080](http://localhost:8080)

## Setup
You basically have two options when it comes to using the script. Either run the script from the folder you want to place the project in:

    ~/path/to/index.sh name-of-project

Or create an alias for [Bash](http://www.hostingadvice.com/how-to/set-command-aliases-linuxubuntudebian/) or [Zsh](https://askubuntu.com/questions/31216/setting-up-aliases-in-zsh) which uses index.sh. When the alias has been created, use it in the folder you would like to place the project and run the command:

    alias-name name-of-project
