# Discord-Wow_Register

## How to install ?

- Install lua on your Linux system:
  ```apt install lua5.1```
  
- Install luarocks
  ```apt install luarocks```
  
- Install luasql-mysql (for Mariadb & MySQL)
  ```luarock install luasql-mysql MYSQL_INCDIR=/usr/include/mysql/```
  
- Create a new folder for Luvit - > Install luvit
  ```mkdir luvit && cd luvit && curl -L https://github.com/luvit/lit/raw/master/get-lit.sh | sh```
  
- Create a folder for your bot in Luvit folder - > Install discordia
  ```mkdir Discord-Wow_Register && cd Discord-Wow_Register && ./../lit install SinisterRectus/discordia```
  
- Clone LuaBot
  ```git clone https://github.com/iThorgrim-Hub/Discord-Wow_Register.git```
  
- Edit config Files

- Launch Bot
  ```./../luvit Discord-Wow_Register.lua```
