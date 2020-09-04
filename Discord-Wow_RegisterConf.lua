local botConf = {

  ['user'] = 'wowservers',
  ['password'] = 'wowservers',
  ['authDB'] = 'R0_Auth',

  ['header'] = 'Account create Panel',
  ['body'] = 'You have made a request to create an account.\n\nPlease send me your account name and password.\n\n__The format to be respected is the following:__\n- AccountName Password\n\nAccount name and password must be separated by a space.\n\n__Exemple:__\n**iThorgrim** **iPassword**',
  ['img'] = 'https://cdn.discordapp.com/avatars/741549380213014528/d01b405680a7362fa13cefc27552e77b.png',
  ['color'] = '114, 137, 218',

  ['failed'] = {
    ['header'] = '__ERROR :__ Username already exist',
    ['body'] = 'Please choose another username',
    ['img'] = 'https://cdn.discordapp.com/avatars/741549380213014528/d01b405680a7362fa13cefc27552e77b.png',
    ['color'] = '255, 0, 0',
  },

  ['success'] = {
    ['header'] = '__SUCCESS :__ Your account is now create!',
    ['body'] = '**__For more security__** please delete message with your username & password !',
    ['img'] = 'https://cdn.discordapp.com/avatars/741549380213014528/d01b405680a7362fa13cefc27552e77b.png',
    ['color'] = '0, 255, 0',
  },

  ['botToken'] = 'YOUR TOKEN HERE',
};

return botConf;
