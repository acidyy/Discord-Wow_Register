--[[

  Requires all dependances

]]--
  -- Discordia : https://github.com/SinisterRectus/Discordia
    local discordia = require('discordia');
  -- Sha1 : https://luarocks.org/modules/mpeterv/sha1
    local sha1 = require('sha1');
  -- LuaSQL : https://luarocks.org/modules/tomasguisasola/luasql-mysql
    local mySQLDriver = require('luasql.mysql');
  -- Custom require
    local botConf = require('Discord-Wow_RegisterConf');

--[[

  Local

]]--
  -- Discordia
    local client = discordia.Client();
  -- LuaSQL
    local mysqlClient = assert(mySQLDriver.mysql():connect(botConf['authDB'], botConf['username'], botConf['password']));
  -- Custom local
    local users = {};
    local wowBot = {};

--[[

  Custom function

]]--
    function wowBot.setUserTable(id, flags)
      if(not(users[id])) then
        users[id] = {
          step = nil;
        };
      end

      return Users[id];
    end

--[[


  Discordia Event
    The main code ;)

]]--
  client:on('messageCreate',
    function(message)

      if (message.channel.type == 0)then
        if (message.content == '!account create')then
          wowBot.setUserTable(message.author.tag, false);
          users[message.author.tag].step = 'createAccount';

          author:send {
              embed = {
                  title = botConf['header'],
                  description = botConf['body'],
                  thumbnail = {url = botConf['img']},
                  color = discordia.Color.fromRGB(botConf['color']).value;
              };
          };
        end

      elseif(message.channel.type == 1)then
        wowBot.setUserTable(message.author.tag, false);
        if(users[message.author.tag].step == 'createAccount')then
          -- Custom local
          local content = message.content

          -- thanks http://lua-users.org/wiki/SplitJoin
          for i in string.gmatch(content, "%S+") do
            users[message.author.tag][#users[message.author.tag]+1] = i;
          end

          -- Custom local
          local getUsername = assert(mysqlClient:execute('SELECT id FROM account WHERE username ="'..users[message.author.tag][1]..'"'));
          local row = getUsername:fetch({}, "a");

          if(not(row)) then
            mysqlClient:execute('INSERT INTO account SET username ="'..users[message.author.tag][1]..'", sha_pass_hash = "'..sha1(string.upper(users[message.author.tag][1])..':'..string.upper(users[message.author.tag][2]))..'"');
            message.author:send {
                embed = {
                    title = botConf['success']['header'],
                    description = botConf['success']['body'],
                    thumbnail = {url = botConf['success']['img']},
                    color = discordia.Color.fromRGB(botConf['success']['color']).value;
                };
            };
          else
            message.author:send {
                embed = {
                    title = botConf['failed']['header'],
                    description = botConf['failed']['body'],
                    thumbnail = {url = botConf['failed']['img']},
                    color = discordia.Color.fromRGB(botConf['failed']['color']).value;
                };
            };
          end
          users[message.author.tag] = nil;
        end
      end

    end
  );

client:run('Bot '..botConf['botToken']);
