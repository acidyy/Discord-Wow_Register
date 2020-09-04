local discordia = require('discordia');

local sha1 = require('sha1');
local driver = require("luasql.mysql");
local BotConf = require('Discord-Wow_RegisterConf');

local mysqlClient = assert(driver.mysql():connect(BotConf['authDB'], BotConf['username'], BotConf['password']));

local client = discordia.Client();
local Users = {};

local function resetUser(id)
  if (not(Users[id])) then
    Users[id] = {
      step = nil;
    };
  end

  return Users[id];
end

client:on('messageCreate', function(message)
  if (message.channel.type == 0)then
    if (message.content == '!account create')then
      resetUser(message.author.tag);
      Users[message.author.tag].step = 'createAccount';
    end
  end

  if (message.channel.type == 1) then
    resetUser(message.author.tag);
    if(Users[message.author.tag].step == 'createAccount')then
      local content = message.content
      -- thanks http://lua-users.org/wiki/SplitJoin
      for i in string.gmatch(content, "%S+") do
        Users[message.author.tag][#Users[message.author.tag]+1] = i;
      end

      local getUsername = assert(mysqlClient:execute('SELECT id FROM account WHERE username ="'..Users[message.author.tag][1]..'"'));
      local row = getUsername:fetch({}, "a");

      if((not row))then
        mysqlClient:execute('INSERT INTO account SET username ="'..Users[message.author.tag][1]..'", sha_pass_hash = "'..sha1(string.upper(Users[message.author.tag][1])..':'..string.upper(Users[message.author.tag][2]))..'"');

        message.author:send {
            embed = {
                title = "__SUCCESS :__ Your account is now create!",
                description = "**__For more security__** please delete message with your username & password !",
                thumbnail = {url = 'https://cdn.discordapp.com/avatars/741549380213014528/d01b405680a7362fa13cefc27552e77b.png'},
                color = discordia.Color.fromRGB(0, 255, 00).value;
            };
        };

      else
        message.author:send {
            embed = {
                title = "__ERROR :__ Username already exist",
                description = "Please choose another username",
                thumbnail = {url = 'https://cdn.discordapp.com/avatars/741549380213014528/d01b405680a7362fa13cefc27552e77b.png'},
                color = discordia.Color.fromRGB(255, 0, 0).value;
            };
        };
      end
      Users[message.author.tag] = nil;
    end

  end

	if (message.content == '!account create' and message.channel.type == 0)then
    message:delete();
    local author = message.author;
    --author:send('Coucou');
    author:send {
        embed = {
            title = "Account create Panel",
            description = "You have made a request to create an account.\n\nPlease send me your account name and password.\n\n__The format to be respected is the following:__\n- AccountName Password\n\nAccount name and password must be separated by a space.\n\n__Exemple:__\n**iThorgrim** **iPassword**",
            thumbnail = {url = 'https://cdn.discordapp.com/avatars/741549380213014528/d01b405680a7362fa13cefc27552e77b.png'},
            color = discordia.Color.fromRGB(114, 137, 218).value;
        };
    };
  else

	end
end)

client:run('Bot '..BotConf['BotToken']);
