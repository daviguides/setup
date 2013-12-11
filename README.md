#As3 Dev Env for dummies
__Simple setup.sh for configuring AS3 and player develop environment__

#Dependencies
To build swf, You must to have *ant* and *ant-contrib* installed.

If you not have run this command before
`sudo apt-get install -y ant ant-contrib`

##The automatic installer

### via curl
`curl -L https://raw.github.com/daviguides/setup/master/player_as3_env/setup.sh | zsh`

### via wget
`wget --no-check-certificate https://raw.github.com/daviguides/setup/master/player_as3_env/setup.sh -O -- | zsh`

##The manual way

1. Clone the repository

`git clone git://github.com/daviguides/setup.git`

2. Go to player_as3_env

`cd player_as3_env`

3. Run setup.sh

`setup.sh | zsh`