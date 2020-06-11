[![Gem Version](https://badge.fury.io/rb/devfromcli.svg)](https://badge.fury.io/rb/devfromcli)

[*STATUS*] - Verion 0.1.0 out
## DEV-from-CLI

DEV-from-CLI is a command line tool that allows users interact with Dev.to
platform from the terminal.

> This project was inspired by [Oh-My-DEV](https://github.com/OPARA-PROSPER/0.0.1-Oh-My-Dev) an Oh-My-Zsh plugin

#### Usage
Usage: `devfromcli <command>`

Where \<command\> is either `start` or `help`

- `$ devfromcli start`    opens the interactive prompt
- `$ devfromcli help`     displays a help page

#### DEMO

[!Live Demo](https://www.youtube.com/watch?v=5Yj0VN5IdLw&t=128s)

### Installation
devfromcli is a registered ruby gem and can be installed by running `$ gem install devfromcli`

#### TESTING LOCALLY

To be able to use this you need the following prerequisite
- A working Ruby installation. Confirm by running `$ ruby -v`
- Bundler `$ bundler -v`
- DEV.to API key. [Follow the instructions here](https://docs.dev.to/api/#section/Authentication/api_key)

When you've got all three pre-requisite you can proceed with.
- Cloning this repository `$ git clone https://github.com/OPARA-PROSPER/DEV-from-CLI.git`
- Enter the cloned project directory `$ cd DEV-from-CLI`
- Run `$ bundle install`
- Create a **.env** file and copy the details from *.example.env*. Add your Dev.to api key ```API_KEY=<your api key>```
- Run `$ ruby dev-from-cli.rb`
- Follow the interactive prompt.   

What do you think? Awesome! right?

#### TODO
- Update Demo
- Currently looking to add more features based on what's possible with the current API from Dev.to (it's in BETA)

#### Contributing
Do you have any ideas or feature integrations or discovered bugs? You're welcome to send in a PR