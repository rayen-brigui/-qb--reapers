local QBCore = exports['qb-core']:GetCoreObject()

local Webhooks = {
    ['default'] = 'https://discord.com/api/webhooks/1090829357792112762/8RyQu5t-7iZqXb43spSHjMHDgvVw5t-bhPbIhJ5ds8CcwT52hRjZ2AcOhylOYDpRiauT',
    ['testwebhook'] = 'https://discord.com/api/webhooks/1105515705622876282/KU0Y0HrpC27147JYtX772a2HtvSdFhixuVlYlhaqQZJ2XhAbn47lc2eexN1oGCO9CABF',
    ['playermoney'] = 'https://discord.com/api/webhooks/1105515814561513593/cfuWv5XEqHlOS2yPGB75cO0NsBxSn3ayJERXclbz81iAHWbWglLOsY4CNH7ZmpCoTiHQ',
    ['playerinventory'] = 'https://discord.com/api/webhooks/1105515863882346568/qF2UrIDUM4r4RcW49AzYdqN_F8qclcOz4peQMhrVlTRuexSrJrCxR_guNiPzOORbJLTL',
    ['robbing'] = 'https://discord.com/api/webhooks/1105515942764621886/VJtJTc9UeggoD2UmRjrPWehB3PYBg_E1BaKB2zINyaEjBNuusmdnWpvaFBlv-9nBmQn8',
    ['cuffing'] = 'https://discord.com/api/webhooks/1105515996288131213/sA92hRXZf66KZS8i47ouXhaH3Sbg84lltepYYPVpsbTRtvSXe9JPj8eqgmL5kZlRPGSy',
    ['drop'] = 'https://discord.com/api/webhooks/1105516037094506657/O9KLC17-90RmMI5mikK_904h-U65QO1-qSjnNjlJZlwoifs6s672oBdQpECyQVQpmWBr',
    ['trunk'] = 'https://discord.com/api/webhooks/1105516099220553778/iM87silI0OYzbpqqI-c31MqWsfnwSqcKW7NCxsxdLXwckjkhOqh7AEQi2POMtB2KIelz',
    ['stash'] = 'https://discord.com/api/webhooks/1105516147689926766/WQPktY6EEsSbzhG-LEG8NUl9YaAZmJK8HXxVDXiKyUUstb4V-YNsESfCcYrIK1N7Tflw',
    ['glovebox'] = 'https://discord.com/api/webhooks/1105516198906564618/L4Ccil9XX3wAxPCaw9uMJPNMNm4GPvhui3r8sW2bH5WSe-X2mNTQbGw6T2UpDxOSi5C_',
    ['banking'] = 'https://discord.com/api/webhooks/1105516233744470107/ZrUNSZzgMPCCLGLhvz7uvQTLNxkTsTIh-WW7yEH_5bwAoTbcHSK80ZsNRUv4LyIe4raU',
    ['vehicleshop'] = 'https://discord.com/api/webhooks/1105516281362399362/5Uc-tD0Xdhu1HDYTLOgO95pGc6190LZ99vx6RKuFMF4xmIyKiS7M5iWV1MELWdCmeHfN',
    ['vehicleupgrades'] = 'https://discord.com/api/webhooks/1105516324798607491/zOg8yh4hgU6glPEptQpUPfyVzi5YWzt5GLNf52A6BAC8MRPEUSK5wWLpN_3RlqBqm1Qf',
    ['shops'] = 'https://discord.com/api/webhooks/1105516425872945192/HB_JIZSBvG74ICKOzvvreXDW63MkOZBrL8lVJdw9TK9UnTc9qGGF6RQehBDrR44UChWE',
    ['dealers'] = 'https://discord.com/api/webhooks/1105516480189190215/6RKwDJ--7vEVVO1-u2KcmsetPHfy_wkl9g1edd-kAuFKim-ByRLKKiAL3_EM8aB0yUXA',
    ['storerobbery'] = 'https://discord.com/api/webhooks/1105516518210555986/HuqsyjxEUGCgPzuE8pCrcRVFlOqCm8Au36IDdMmIt9YD68r0b14ofrEIRh3QYMJL4_ap',
    ['bankrobbery'] = 'https://discord.com/api/webhooks/1105516596367196180/0ddq0Uy_ecvfd3zV6vKROZTzZ5vcAyyxp4Q43yI5BcWqxOxQaePod2MkPaMEzhIHbHFk',
    ['powerplants'] = 'https://discord.com/api/webhooks/1105516640856182826/4kVDA9kk-n9thLtr979M2GawNMXHJHT4iBL43SpXEgtw_2fEtV45qLJXe45HQn-iCS4I',
    ['death'] = 'https://discord.com/api/webhooks/1105516740722561024/uz-tsJHCM7haFGvf_O4qxdeo4XVcoyL2QBpdVUf1ZHagTfDfq54fPFBoByPEFV62Wcac',
    ['joinleave'] = 'https://discord.com/api/webhooks/1105516800696926239/5vZAGlGsS6YQ0yfgAnZTCysiGfk242iE25Zgud-u5LIz3b7slBKtfTd8wf_0Y1jmpi9_',
    ['ooc'] = 'https://discord.com/api/webhooks/1105516847606022234/Nur3i93AMPHcuDPurk9J-e3tirIXeEuxIDol5wg811dGzLgD3uKUmwUKIyRwwVX1BzJY',
    ['report'] = '',
    ['me'] = 'https://discord.com/api/webhooks/1105516903893586003/1mqU0aw5pomKYide72ydR4q9lXdv4lN23rzY0Du4AkmwfiYPElHwPrOXeBpV4Bi2d15u',
    ['pmelding'] = 'https://discord.com/api/webhooks/1105516958838952016/eqYUCRESbbwfSkja3DefSCAJ7IOtfSPl6cacjbzqaisN53FnBe-_KUi45XsNHA1e2z3o',
    ['112'] = 'https://discord.com/api/webhooks/1105516999561457724/6s-ynG_sAweQRs4cpZ4N_eb2n-1pE40pJhecebig63H4TVJsV8dQwfmGIIEuYP9JcOvl',
    ['bans'] = 'https://discord.com/api/webhooks/1105517055966457918/ryYgpKsCX4E67NSL3GoTJNNeMMw8-SSSF4koqzQcBGK-9TOD9mRFdusI8yEnpwdoKVZW',
    ['anticheat'] = 'https://discord.com/api/webhooks/1105517100983918612/JiDitJqgwPLILzYICdQNlCL1cBIzt3ioyznUb8-THVXMJZIwp0SNDs9_xuV1iJ5rlMeS',
    ['weather'] = 'https://discord.com/api/webhooks/1105517154792644759/cVA6fdjw1JzFbGh26_I3-4XC8HA11ZPaxJ6TKUQy-ZoIgL7CrOKOAmjkXNZkjEJNGme_',
    ['moneysafes'] = 'https://discord.com/api/webhooks/1105517195016020029/RryKwyi6yR100PBFyIPxUbleN_mYmteNteuhu_RZEBIrI_MBi42Xg954rPpKMRDtXXjm',
    ['bennys'] = 'https://discord.com/api/webhooks/1105517238691307520/QD_vjH7duy7BM08xEdl7Bt2LkvDJ7HLk4vW6__fZE_xXBzbtUJCnBHrzfhzq_ywNeoUq',
    ['bossmenu'] = 'https://discord.com/api/webhooks/1105517286716096512/uySjJYvcB6NK2UVQmYc8ilK05e5KRkG6OxjmtCuYfIwVPGxYC15vKfKEw-u-gX5k0vHr',
    ['robbery'] = 'https://discord.com/api/webhooks/1105517329305055382/vsNBvz7LA5zGXjLQXNbvLCD1YzcYhEf-gH5CubJemtsAp-Bnm41HoU3RpaJrvXlDikKZ',
    ['casino'] = 'https://discord.com/api/webhooks/1105517367368351798/2MX_pxv5X0uxifFKgiVnfV6AnbzUe4xeyhoHODmq3e-yeQ71gH8BMs6eQkAcpnMnB5A2',
    ['traphouse'] = 'https://discord.com/api/webhooks/1105517415795793920/puiUOBmKlifuMed4VkYI1jXSr4PWDlLWfBmMs5DmxzAEPnX5s4bAFjKB7WEvFPrzZ_XR',
    ['911'] = 'https://discord.com/api/webhooks/1105517456136622100/4Y_WU0O7bgjm-bsk01X8tYdIxWKg4HRl6WgvcFqQ8Q0W50JlTp6ThZNNglzhxFSu_VvO',
    ['palert'] = 'https://discord.com/api/webhooks/1105517496188027110/ysJ0mPXJbNMVX8lr2hDxluxxFalnv9Gt9P688c8OkQXGnmeUmt-LrYBD7EXaEcSCKbGF',
    ['house'] = 'https://discord.com/api/webhooks/1105517557617791087/-u1k82vCCh1D449BQgO2fZcS7_saMNM1nGOJkqQILiqbHWAcwaESH2sqYjKQfdo5j6xx',
    ['qbjobs'] = 'https://discord.com/api/webhooks/1105517610944168066/aNqtqKxlaOO-nN6nx4AfDxfCAiWLDY_qaer8ipOYOE8h-oF_XR6EOZzlcPueVQZ3AMUd',
}

local Colors = { -- https://www.spycolor.com/
    ['default'] = 14423100,
    ['blue'] = 255,
    ['red'] = 16711680,
    ['green'] = 65280,
    ['white'] = 16777215,
    ['black'] = 0,
    ['orange'] = 16744192,
    ['yellow'] = 16776960,
    ['pink'] = 16761035,
    ["lightgreen"] = 65309,
}

RegisterNetEvent('qb-log:server:CreateLog', function(name, title, color, message, tagEveryone)
    local tag = tagEveryone or false
    local webHook = Webhooks[name] or Webhooks['default']
    local embedData = {
        {
            ['title'] = title,
            ['color'] = Colors[color] or Colors['default'],
            ['footer'] = {
                ['text'] = os.date('%c'),
            },
            ['description'] = message,
            ['author'] = {
                ['name'] = 'QBCore Logs',
                ['icon_url'] = 'https://cdn.discordapp.com/attachments/959479848068321301/1073056321613615114/LOGO33.gif',
            },
        }
    }
    PerformHttpRequest(webHook, function() end, 'POST', json.encode({ username = 'QB Logs', embeds = embedData}), { ['Content-Type'] = 'application/json' })
    Citizen.Wait(100)
    if tag then
        PerformHttpRequest(webHook, function() end, 'POST', json.encode({ username = 'QB Logs', content = '@everyone'}), { ['Content-Type'] = 'application/json' })
    end
end)

QBCore.Commands.Add('testwebhook', 'Test Your Discord Webhook For Logs (God Only)', {}, false, function()
    TriggerEvent('qb-log:server:CreateLog', 'testwebhook', 'Test Webhook', 'default', 'Webhook setup successfully')
end, 'god')
