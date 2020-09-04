# Discord Wow Register

![discord-wow_register](https://cdn.discordapp.com/attachments/617809275854651508/751404990383259688/unknown.png)

Discord Wow Register is a bot that allows you to create an account directly from Discord.

It uses several free technologies such as: Discordia, Luvit, Luarocks, LuaSQL, SHA1.

Discord Wow Register works with :
  - Debian 9
  - Debian 10
  - Ubuntu 16.04
  - Ubuntu 18.04

Emulators compatible : 
  - [AzerothCore](https://www.azerothcore.org/)
  - [TrinityCore](https://www.trinitycore.org/)
  
Made with ❤ and [Lua](http://www.lua.org/), [Discordia](https://github.com/SinisterRectus/Discordia), [Luvit](https://luvit.io).

## Support me

You can support all my projects by making a [donation with PayPal](https://www.paypal.me/LevelLouis).

## How to install it?

To start you need to install Lua:
  > `sudo apt install lua5.1`


We are going to install luarocks in order to fill in some dependencies :    
> `sudo apt install luarocks`


Let us continue by installing the so-called dependencies:  
> `luarock install luasql-mysql MYSQL_INCDIR=/usr/include/mysql/`
>
> `luarock install sha1`


We also need to install Luvit, to do this we will create a new folder : 
> `mkdir Luvit`
>
> `cd Luvit`
>
> `curl -L https://github.com/luvit/lit/raw/master/get-lit.sh | sh`


Once this is done, we need to create a folder for our Bot, we create it in the Luvit folder : 
> `mkdir Discord-Wow_Register`
>
> `cd Discord-Wow_Register`


Now that we are in our bot folder, we need to download Discordia : 
> `./../lit install SinisterRectus/discordia`


We also need to get our Super Bot back! 
> `git clone https://github.com/iThorgrim-Hub/Discord-Wow_Register.git`


Now that the bot is in our possession we will configure it (**It is important to add the token of a Discord bot [[See here](https://discordpy.readthedocs.io/en/latest/discord.html)]**) : 
> `nano Discord-Wow_RegisterConf.lua`


The configuration is complete, we can now launch the bot : 
> `./../luvit Discord-Wow_Register.lua`



## How does it work?

When one of your players wants to register, he will have to enter the following command in any channel : 
> `!account create`


Then the bot will ask him to send his information: Account name, Password.

The bot will check if the account name is already in use, if it is already the case then it will ask him to enter a new one
If the account name is not used then everything is fine, the player will receive a confirmation message, he will be able to instantly login to his newly created account.
