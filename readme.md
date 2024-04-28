# Test Automation using Robotframework #

## Installation ##

### MacOS:  ###

1. `Install brew`
2. `open ~/.zprofile` > add `eval "$(/opt/homebrew/bin/brew shellenv)"` and save file
3. `brew install python@3.11`
4. `brew install virtualenv`
5. To set up virtual env
    5.1 go to your project
    5.2 run `virtualenv .workspace --python=3.11`
    5.3 run `source .workspace/bin/activate`
8. `pip install -r requirements.txt`

## VS code plugin ##

- `RobotCode` or `Robot Framework Language Server`

## Execute Test ##

`robot tests/TC01_Checkout.robot`
