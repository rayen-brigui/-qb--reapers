Config = {}
Config.UsingTarget = false -- If you are using qb-target (uses entity zones to target vehicles)
Config.Commission = 0.0 -- Percent that goes to sales person from a full car sale 10%
Config.FinanceCommission = 0.05 -- Percent that goes to sales person from a finance sale 5%
Config.FinanceZone = vector3(109.84, -1520.68, 29.26) -- Where the finance menu is located
Config.PaymentWarning = 30 -- time in minutes that player has to make payment before repo
Config.PaymentInterval = 24 -- time in hours between payment being due
Config.MinimumDown = 10 -- minimum percentage allowed down
Config.MaximumPayments = 25 -- maximum payments allowed
Config.Shops = {
    ['pdm'] = {
        ['Type'] = 'free-use',  -- no player interaction is required to purchase a car
        ['Zone'] = {
            ['Shape'] = { --polygon that surrounds the shop
                vector2(-917.79, -2007.38),
                vector2(-897.7, -2026.73),
                vector2(-878.91, -2047.47),
                vector2(-896.91, -2068.77),
                vector2(-915.5, -2087.65),
                vector2(-936.84, -2109.31),
                vector2(-959.15, -2090.43),
                vector2(-982.99, -2068.18),
                vector2(-957.96, -2041.49)
            },
            ['minZ'] = 25.0,  -- min height of the shop zone
            ['maxZ'] = 28.0  -- max height of the shop zone
        },
        ['Job'] = 'none', -- Name of job or none
        ['ShopLabel'] = 'Car Dealership', -- Blip name
        ['showBlip'] = true,  --- true or false
        ['Categories'] = { -- Categories available to browse
            -- ['sedans'] = 'Sedans',
            -- ['coupes'] = 'Coupes',
            -- ['offroad'] = 'Offroad',
            -- ['muscle'] = 'Muscle',
            -- ['compacts'] = 'Compacts',
            -- ['motorcycles'] = 'Motorcycles',
            -- ['super'] = 'Super',
            -- ['sportsclassics'] = 'Sports Classics',
            -- ['suvs'] = 'SUVs',
            -- ['sports'] = 'Sports',
            -- ['vans'] = 'Vans',
            ['customcars'] = 'Custom Vehicles',
        },
        ['TestDriveTimeLimit'] = 2, -- Time in minutes until the vehicle gets deleted
        ['Location'] = vector3(93.72, -1507.27, 29.26), -- Blip Location
        ['ReturnLocation'] = vector3(117.83, -1486.22, 29.14), -- Location to return vehicle, only enables if the vehicleshop has a job owned
        ['VehicleSpawn'] = vector4(137.56, -1489.16, 29.14, 51.17), -- Spawn location when vehicle is bought
        ['ShowroomVehicles'] = {
            [1] = {
                coords =vector4(112.03, -1494.72, 29.97, 216.38), -- where the vehicle will spawn on display
                defaultVehicle = '488misha', -- Default display vehicle
                chosenVehicle = '488misha', -- Same as default but is dynamically changed when swapping vehicles
            },
            [2] = {
                coords = vector4(101.28, -1502.1, 29.26, 235.61),
                defaultVehicle = 'r8h',
                chosenVehicle = 'r8h',
            },
            [3] = {
                coords = vector4(100.81, -1510.81, 28.42, 321.94),
                defaultVehicle = 'lc500',
                chosenVehicle = 'lc500',
            },
            
        },
    } -- Add your next table under this comma
}
