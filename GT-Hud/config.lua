

--░██████╗░████████╗  ░██████╗████████╗░█████╗░██████╗░███████╗
--██╔════╝░╚══██╔══╝  ██╔════╝╚══██╔══╝██╔══██╗██╔══██╗██╔════╝
--██║░░██╗░░░░██║░░░  ╚█████╗░░░░██║░░░██║░░██║██████╔╝█████╗░░
--██║░░╚██╗░░░██║░░░  ░╚═══██╗░░░██║░░░██║░░██║██╔══██╗██╔══╝░░
--╚██████╔╝░░░██║░░░  ██████╔╝░░░██║░░░╚█████╔╝██║░░██║███████╗
--░╚═════╝░░░░╚═╝░░░  ╚═════╝░░░░╚═╝░░░░╚════╝░╚═╝░░╚═╝╚══════╝
-----------------------[https://discord.gg/cy]-------------------

-------------------------------------------- General - عام -------------------------------------------
Config = {}
Config.Framework = "newqb" -- (newqb) - qbcore الجديد / (oldqb), - qbcore القديم / (esx), - نوع الظام الي عندك
Config.DefaultHud = "radial" -- من هنا تحدد لما الشخص يدخل لي اول مرا يطلع له شكل الهود[radial, classic, text]
Config.DefaultSpeedUnit = "kmh" -- تحدد من هنا العداد [kmh, mph]
Config.HudSettingsCommand = 'menu' -- الامر الي يفتح القائمة حقة الهود
Config.DisplayMapOnWalk = true -- true - اعرض الخريطة عند المشي * false - إخفاء الخريطة عند المشي
Config.DisplayRealTime = false --  هذا اذا شغلته يطلع لك الوقت الحقيق عند الاعب او اذا ما شغلته يطلع الوقت حق العبه
Config.EnableSpamNotification = true -- منع السبام حق الشعارات
Config.EnableDateDisplay = true -- يحدد ما إذا كان تاريخ العرض أم لا
-- false or true

-------------------------------------------- Watermark hud --------------------------------------------
Config.WaterMarkText1 = "" -- الكلام الي موجود على اليمين
Config.WaterMarkText2 = ""  -- الكلام الي موجود على اليمين
Config.EnableWaterMarkHud = true -- هنا تقدر تطلع الكلام او لا تطلع الكلام
-- false or true

-------------------------------------------- Keys - الازرار --------------------------------------------
Config.DefaultCruiseControlKey = "k" 
Config.DefaultSeatbeltControlKey = "g" -- الزر حق الحزام
Config.VehicleEngineToggleKey = "B" -- الزر حق تشغيل المركبة 
Config.NitroKey = "X" -- الزر حق النيترو


-------------------------------------------- Nitro - نيترو --------------------------------------------
Config.RemoveNitroOnpress = 2 -- تقدر تحدد من هنا مقدر استخدام من النيترو عندما يضغط اللاعب على زر النيترو
Config.NitroItem = "nitro" --  تقدر تغير الايتم على الايتم الي موجود عندك /item النيترو حق السيارة
Config.EnableNitro = true -- تشغيل النيترو او ايقاف النيترو 
Config.NitroForce = 40.0 -- قوة نيترو لما يستخدم اللاعب النيترو
-- false or true

--------------------------------------------Money commands - أوامر المال--------------------------------------------
Config.EnableCashAndBankCommands = true -- تشغيل الاوامر 
Config.CashCommand = "cash"  -- command to see cash
Config.BankCommand = "bank" -- command to see bank money
-- false or true

-------------------------------------------- Engine Toggle -تبديل المحرك  --------------------------------------------
Config.EnableEngineToggle = true 
-- false or true
-------------------------------------------- Vehicle Functionality - وظائف السيارة --------------------------------------------
Config.EnableCruise = true -- يحدد ما وضع الرحلات البحرية نشطًا
Config.EnableSeatbelt = true -- يحدد الحزام الأمان نشطًا
-- false or true

-------------------------------------------- Settings text - نص الإعدادات --------------------------------------------
Config.SettingsLocale = { -- قائمة الهود
    ["text_hud_1"] = "نصي",
    ["text_hud_2"] = "hud",
    ["classic_hud_1"] = "كلاسيكي",
    ["classic_hud_2"] = "hud",
    ["radial_hud_1"] = "شعاعي",
    ["radial_hud_2"] = "hud",
    ["hide_hud"] = "إخفاء هود",
    ["show_hud"] = "عرض هود",
    ["enable_cinematicmode"] = "الوضع السينمائي",
    ["disable_cinematicmode"] = "تعطيل سينمائي",
    ["exit_settings_1"] = "اخرج من",
    ["exit_settings_2"] = "الإعدادات",
    ["speedometer"] = "عداد السرعة",
    ["map"] = "خريطة",
}


-------------------------------------------- Fuel - البنزين --------------------------------------------
Config.UseLegacyFuel = false -- اذا كانت تستخدم سكربت الوقود القاديم شغله
-- false or true
Config.GetVehicleFuel = function(vehicle) --  تقدر تغيره LegacyFuel إذا كنت تستخدم سكربت آخر غير
    if Config.UseLegacyFuel then
        return exports["LegacyFuel"]:GetFuel(vehicle)
    else
        return GetVehicleFuelLevel(vehicle)
    end
end


-------------------------------------------- Stress - التوتر --------------------------------------------
Config.UseStress = true -- رح يتم ازالة التوتر false اذا حطيت هذا على 
Config.StressWhitelistJobs = { -- أضف هنا الوظائف التي تريد تعطيل التوتر عنها
    'police', 'ambulance'
}
-- false or true
Config.AddStress = {
    ["on_shoot"] = {
        min = 1,
        max = 3,
        enable = true,
    },
    ["on_fastdrive"] = {
        min = 1,
        max = 3,
        enable = true,
    },
}

Config.RemoveStress = { -- يمكنك تحديد المبالغ هنا حسب رغبتك
    ["on_eat"] = {
        min = 5,
        max = 10,
        enable = true,

    },
    ["on_drink"] = {
        min = 5,
        max = 10,
        enable = true,

    },
    ["on_swimming"] = {
        min = 5,
        max = 10,
        enable = true,

    },
    ["on_running"] = {
        min = 5,
        max = 10,
        enable = true,
    },

}

-- false or true


-------------------------------------------- Notifications - إشعارات --------------------------------------------

Config.Notifications = { -- إشعارات
    ["stress_gained"] = {
        message = 'Getting Stressed',
        type = "error",
    },
    ["stress_relive"] = {
        message =  'You Are Relaxing',
        type = "success",
    },
    ["took_off_seatbelt"] = {
        type = "error",
        message = "You took off seatbelt.",
    },
    ["took_seatbelt"] = {
        type = "success",
        message = "You took seatbelt.",
    },
    ["cruise_actived"] = {
        type = "success",
        message = "Cruise actived.",
    },
    ["cruise_disabled"] = {
        type = "error",
        message = "Cruise disabled.",
    },
    ["spam"] = {
        type = "error",
        message = "Please wait for a few seconds.",
    },
    ["engine_on"] = {
        type = "success",
        message = "Engine is on.",
    }, 
    ["engine_off"] = {
        type = "success",
        message = "Engine is off.",
    }, 
    ["cant_install_nitro"] = {
        type = "error",
        message = "You can't install nitro inside vehicle.",
    }, 
    ["no_veh_nearby"] = {
        type = "error",
        message = "No vehicle nearby.",
    }, 
    ["cash_display"] = {
        type = "success",
        message = "You have $%s in your pocket.",
    }, 
    ["bank_display"] = {
        type = "success",
        message = "You have $%s in your bank.",
    }, 
}

-- false or true

Config.Notification = function(message, type, isServer, src) -- للاشعارات eventsهنا تقدر تغييرالـ
    if isServer then
        if Config.Framework == "esx" then
            TriggerClientEvent("esx:showNotification", src, message)
        else
            TriggerClientEvent('QBCore:Notify', src, message, type, 1500)
        end
    else
        if Config.Framework == "esx" then
            TriggerEvent("esx:showNotification", message)
        else
            TriggerEvent('QBCore:Notify', message, type, 1500)
        end
    end
end 



-------------------------------------------- Seatbelt - الحزام --------------------------------------------
-- من الافضل انك لاتلعب في هذي 

-- ejectVelocity - The gta velocity at which ejection from the car should happen when not wearing seatbelt
--      This is NOT MPH or KPH but instead GTA Velocity. to convert:
--      MPH -> Vel = (MPH / 2.236936)
--      KPH -> Vel = (KPH / 3.6)
--  Default: (60 / 2.236936)
Config.ejectVelocity = (60 / 2.236936)

-- unknownEjectVelocity - ejectVelocityلازم تكون هذي القيمة مساوية أو أكبر من قيمة
--      The purpose of this variable is confusing https://docs.fivem.net/natives/?_0x4D3118ED
--  Default: (70 / 2.236936)
Config.unknownEjectVelocity = (70 / 2.236936)

-- unknownModifier - لا تلعب في هذي ابداّّ
Config.unknownModifier = 17.0 --  Default: 17.0,

-- minDamage - .الحد الأدنى من الضرر الناتج عند إخراجه من السيارة
Config.minDamage = 30



--░██████╗░████████╗  ░██████╗████████╗░█████╗░██████╗░███████╗
--██╔════╝░╚══██╔══╝  ██╔════╝╚══██╔══╝██╔══██╗██╔══██╗██╔════╝
--██║░░██╗░░░░██║░░░  ╚█████╗░░░░██║░░░██║░░██║██████╔╝█████╗░░
--██║░░╚██╗░░░██║░░░  ░╚═══██╗░░░██║░░░██║░░██║██╔══██╗██╔══╝░░
--╚██████╔╝░░░██║░░░  ██████╔╝░░░██║░░░╚█████╔╝██║░░██║███████╗
--░╚═════╝░░░░╚═╝░░░  ╚═════╝░░░░╚═╝░░░░╚════╝░╚═╝░░╚═╝╚══════╝
-----------------------[https://discord.gg/cy]-------------------