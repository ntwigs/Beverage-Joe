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
▶ Minified CSS which is added to inline for fewer requests  
▶ Supports ES6  
▶ Supports [Class Properties](https://babeljs.io/docs/plugins/transform-class-properties/)  
▶ Hot reload  
▶ Import stylesheets into JavaScript


The script will work anywhere Bash works. If it however does **not** work on your machine, please [file an issue](https://github.com/NorthernTwig/Beverage-Joe/issues/new).

    The default file structure is as followed: 
    .
    ├── node_modules
    ├── package.json
    ├── package-lock.json
    ├── .gitignore
    ├── static
    │   ├── image
    │   ├── js
    │   │   └── index.js
    │   ├── style
    │   │   └── index.x
    │   └── views
    │       └── index.y
    └── webpack.config.js


Are you not agreeing with the name and file-structure presented above? Great! You can change that by configuring config.sh located in the root folder. 

## Quick Overview

### Build 
Run the shellscript by doing one of the two options in the Setup down below, and the run the following commands:

```sh
create-joe amazing-project
cd amazing-project
npm start
```
This will get everything up and running here:
[http://localhost:8080](http://localhost:8080)


### Production
When you get to the point of *weekend* and just want to get your stuff on the interwebs, run the following command to create a production build:

```sh
npm run build
```

which will place the production ready files in the *build*-folder ( or in the folder you specified ). 

You should now be ready to create something beautiful and place that piece of art on the internet.

## Setup
You basically have two options when it comes to using the script. Either run the script from the folder you want to place the project in:

    ~/path/to/index.sh name-of-project

Or create an alias for [Bash](http://www.hostingadvice.com/how-to/set-command-aliases-linuxubuntudebian/) or [Zsh](https://askubuntu.com/questions/31216/setting-up-aliases-in-zsh) which uses index.sh. When the alias has been created, use it in the folder you would like to place the project and run the command:

    alias-name name-of-project
