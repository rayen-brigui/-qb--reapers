Config = {}
Config.StartingApartment = true -- Enable/disable starting apartments (make sure to set default spawn coords)
Config.Interior = vector3(-814.89, 181.95, 76.85) -- Interior to load where characters are previewed
Config.DefaultSpawn = vector3(-1035.71, -2731.87, 12.86) -- Default spawn coords if you have start apartments disabled
--Spawnstation
Config.PedCoords = vector4(-3962.103, 2013.484, 500.91, 66.137) -- Create preview ped at these coordinates
Config.HiddenCoords = vector4(-3968.355, 2005.308, 500.91, 67.523) -- Hides your actual ped while you are in selection
Config.CamCoords = vector4(-3963.967, 2014.232, 500.91, 250.553) -- Camera coordinates for character preview screen
Config.EnableDeleteButton = true -- Define if the player can delete the character or not
Config.customNationality = false -- Defines if Nationality input is custom of blocked to the list of Countries

Config.DefaultNumberOfCharacters = 1 -- Define maximum amount of default characters (maximum 5 characters defined by default)
Config.PlayersNumberOfCharacters = { -- Define maximum amount of player characters by rockstar license (you can find this license in your server's database in the player table)
    { license = "license:49d299158646ed9e921b646ce39432d78dcc4e67", numberOfChars = 2 },--RB
    { license = "license:6268a04fc7f8899ba9c29c63bcdc59975de7d88b", numberOfChars = 2 },--Lopez anas
}