Config, Types, Bones = {}, {}, {}
Types[1], Types[2], Types[3] = {}, {}, {}

-- This is the vehicle bones table, this is needed to verify if the vehicle bone exists when checking them, here is a list of vehicle bones you can use, all of them are included in this table: https://wiki.rage.mp/index.php?title=Vehicle_Bones
Config.VehicleBones = {'chassis', 'chassis_lowlod', 'chassis_dummy', 'seat_dside_f', 'seat_dside_r', 'seat_dside_r1', 'seat_dside_r2', 'seat_dside_r3', 'seat_dside_r4', 'seat_dside_r5', 'seat_dside_r6', 'seat_dside_r7', 'seat_pside_f', 'seat_pside_r', 'seat_pside_r1', 'seat_pside_r2', 'seat_pside_r3', 'seat_pside_r4', 'seat_pside_r5', 'seat_pside_r6', 'seat_pside_r7', 'window_lf1', 'window_lf2', 'window_lf3', 'window_rf1', 'window_rf2', 'window_rf3', 'window_lr1', 'window_lr2', 'window_lr3', 'window_rr1', 'window_rr2', 'window_rr3', 'door_dside_f', 'door_dside_r', 'door_pside_f', 'door_pside_r', 'handle_dside_f', 'handle_dside_r', 'handle_pside_f', 'handle_pside_r', 'wheel_lf', 'wheel_rf', 'wheel_lm1', 'wheel_rm1', 'wheel_lm2', 'wheel_rm2', 'wheel_lm3', 'wheel_rm3', 'wheel_lr', 'wheel_rr', 'suspension_lf', 'suspension_rf', 'suspension_lm', 'suspension_rm', 'suspension_lr', 'suspension_rr', 'spring_rf', 'spring_lf', 'spring_rr', 'spring_lr', 'transmission_f', 'transmission_m', 'transmission_r', 'hub_lf', 'hub_rf', 'hub_lm1', 'hub_rm1', 'hub_lm2', 'hub_rm2', 'hub_lm3', 'hub_rm3', 'hub_lr', 'hub_rr', 'windscreen', 'windscreen_r', 'window_lf', 'window_rf', 'window_lr', 'window_rr', 'window_lm', 'window_rm', 'bodyshell', 'bumper_f', 'bumper_r', 'wing_rf', 'wing_lf', 'bonnet', 'boot', 'exhaust', 'exhaust_2', 'exhaust_3', 'exhaust_4', 'exhaust_5', 'exhaust_6', 'exhaust_7', 'exhaust_8', 'exhaust_9', 'exhaust_10', 'exhaust_11', 'exhaust_12', 'exhaust_13', 'exhaust_14', 'exhaust_15', 'exhaust_16', 'engine', 'overheat', 'overheat_2', 'petrolcap', 'petrolcap', 'petroltank', 'petroltank_l', 'petroltank_r', 'steering', 'hbgrip_l', 'hbgrip_r', 'headlight_l', 'headlight_r', 'taillight_l', 'taillight_r', 'indicator_lf', 'indicator_rf', 'indicator_lr', 'indicator_rr', 'brakelight_l', 'brakelight_r', 'brakelight_m', 'reversinglight_l', 'reversinglight_r', 'extralight_1', 'extralight_2', 'extralight_3', 'extralight_4', 'numberplate', 'interiorlight', 'siren1', 'siren2', 'siren3', 'siren4', 'siren5', 'siren6', 'siren7', 'siren8', 'siren9', 'siren10', 'siren11', 'siren12', 'siren13', 'siren14', 'siren15', 'siren16', 'siren17', 'siren18', 'siren19', 'siren20', 'siren_glass1', 'siren_glass2', 'siren_glass3', 'siren_glass4', 'siren_glass5', 'siren_glass6', 'siren_glass7', 'siren_glass8', 'siren_glass9', 'siren_glass10', 'siren_glass11', 'siren_glass12', 'siren_glass13', 'siren_glass14', 'siren_glass15', 'siren_glass16', 'siren_glass17', 'siren_glass18', 'siren_glass19', 'siren_glass20', 'spoiler', 'struts', 'misc_a', 'misc_b', 'misc_c', 'misc_d', 'misc_e', 'misc_f', 'misc_g', 'misc_h', 'misc_i', 'misc_j', 'misc_k', 'misc_l', 'misc_m', 'misc_n', 'misc_o', 'misc_p', 'misc_q', 'misc_r', 'misc_s', 'misc_t', 'misc_u', 'misc_v', 'misc_w', 'misc_x', 'misc_y', 'misc_z', 'misc_1', 'misc_2', 'weapon_1a', 'weapon_1b', 'weapon_1c', 'weapon_1d', 'weapon_1a_rot', 'weapon_1b_rot', 'weapon_1c_rot', 'weapon_1d_rot', 'weapon_2a', 'weapon_2b', 'weapon_2c', 'weapon_2d', 'weapon_2a_rot', 'weapon_2b_rot', 'weapon_2c_rot', 'weapon_2d_rot', 'weapon_3a', 'weapon_3b', 'weapon_3c', 'weapon_3d', 'weapon_3a_rot', 'weapon_3b_rot', 'weapon_3c_rot', 'weapon_3d_rot', 'weapon_4a', 'weapon_4b', 'weapon_4c', 'weapon_4d', 'weapon_4a_rot', 'weapon_4b_rot', 'weapon_4c_rot', 'weapon_4d_rot', 'turret_1base', 'turret_1barrel', 'turret_2base', 'turret_2barrel', 'turret_3base', 'turret_3barrel', 'ammobelt', 'searchlight_base', 'searchlight_light', 'attach_female', 'roof', 'roof2', 'soft_1', 'soft_2', 'soft_3', 'soft_4', 'soft_5', 'soft_6', 'soft_7', 'soft_8', 'soft_9', 'soft_10', 'soft_11', 'soft_12', 'soft_13', 'forks', 'mast', 'carriage', 'fork_l', 'fork_r', 'forks_attach', 'frame_1', 'frame_2', 'frame_3', 'frame_pickup_1', 'frame_pickup_2', 'frame_pickup_3', 'frame_pickup_4', 'freight_cont', 'freight_bogey', 'freightgrain_slidedoor', 'door_hatch_r', 'door_hatch_l', 'tow_arm', 'tow_mount_a', 'tow_mount_b', 'tipper', 'combine_reel', 'combine_auger', 'slipstream_l', 'slipstream_r', 'arm_1', 'arm_2', 'arm_3', 'arm_4', 'scoop', 'boom', 'stick', 'bucket', 'shovel_2', 'shovel_3', 'Lookat_UpprPiston_head', 'Lookat_LowrPiston_boom', 'Boom_Driver', 'cutter_driver', 'vehicle_blocker', 'extra_1', 'extra_2', 'extra_3', 'extra_4', 'extra_5', 'extra_6', 'extra_7', 'extra_8', 'extra_9', 'extra_ten', 'extra_11', 'extra_12', 'break_extra_1', 'break_extra_2', 'break_extra_3', 'break_extra_4', 'break_extra_5', 'break_extra_6', 'break_extra_7', 'break_extra_8', 'break_extra_9', 'break_extra_10', 'mod_col_1', 'mod_col_2', 'mod_col_3', 'mod_col_4', 'mod_col_5', 'handlebars', 'forks_u', 'forks_l', 'wheel_f', 'swingarm', 'wheel_r', 'crank', 'pedal_r', 'pedal_l', 'static_prop', 'moving_prop', 'static_prop2', 'moving_prop2', 'rudder', 'rudder2', 'wheel_rf1_dummy', 'wheel_rf2_dummy', 'wheel_rf3_dummy', 'wheel_rb1_dummy', 'wheel_rb2_dummy', 'wheel_rb3_dummy', 'wheel_lf1_dummy', 'wheel_lf2_dummy', 'wheel_lf3_dummy', 'wheel_lb1_dummy', 'wheel_lb2_dummy', 'wheel_lb3_dummy', 'bogie_front', 'bogie_rear', 'rotor_main', 'rotor_rear', 'rotor_main_2', 'rotor_rear_2', 'elevators', 'tail', 'outriggers_l', 'outriggers_r', 'rope_attach_a', 'rope_attach_b', 'prop_1', 'prop_2', 'elevator_l', 'elevator_r', 'rudder_l', 'rudder_r', 'prop_3', 'prop_4', 'prop_5', 'prop_6', 'prop_7', 'prop_8', 'rudder_2', 'aileron_l', 'aileron_r', 'airbrake_l', 'airbrake_r', 'wing_l', 'wing_r', 'wing_lr', 'wing_rr', 'engine_l', 'engine_r', 'nozzles_f', 'nozzles_r', 'afterburner', 'wingtip_1', 'wingtip_2', 'gear_door_fl', 'gear_door_fr', 'gear_door_rl1', 'gear_door_rr1', 'gear_door_rl2', 'gear_door_rr2', 'gear_door_rml', 'gear_door_rmr', 'gear_f', 'gear_rl', 'gear_lm1', 'gear_rr', 'gear_rm1', 'gear_rm', 'prop_left', 'prop_right', 'legs', 'attach_male', 'draft_animal_attach_lr', 'draft_animal_attach_rr', 'draft_animal_attach_lm', 'draft_animal_attach_rm', 'draft_animal_attach_lf', 'draft_animal_attach_rf', 'wheelcover_l', 'wheelcover_r', 'barracks', 'pontoon_l', 'pontoon_r', 'no_ped_col_step_l', 'no_ped_col_strut_1_l', 'no_ped_col_strut_2_l', 'no_ped_col_step_r', 'no_ped_col_strut_1_r', 'no_ped_col_strut_2_r', 'light_cover', 'emissives', 'neon_l', 'neon_r', 'neon_f', 'neon_b', 'dashglow', 'doorlight_lf', 'doorlight_rf', 'doorlight_lr', 'doorlight_rr', 'unknown_id', 'dials', 'engineblock', 'bobble_head', 'bobble_base', 'bobble_hand', 'chassis_Control'}

----------------------------------------------------------------------------------------
-- Settings
----------------------------------------------------------------------------------------

-- Set to true to enable standalone functionality
Config.Standalone = false

-- It's possible to interact with entities through walls so this should be low
Config.MaxDistance = 3.0

-- Enable debug options and distance preview
Config.Debug = false

-- Enable outlines around the entity you're looking at
Config.EnableOutline = false

-- Enable default options (Toggling vehicle doors)
Config.EnableDefaultOptions = false

-- Key to open the target
Config.OpenKey = 'LMENU' -- Left Alt
Config.OpenControlKey = 19 -- Control for keypress detection also Left Alt, controls are found here https://docs.fivem.net/docs/game-references/controls/

-- Key to open the menu
Config.MenuControlKey = 238 -- Control for keypress detection, this is the Right Mouse Button, controls are found here https://docs.fivem.net/docs/game-references/controls/

----------------------------------------------------------------------------------------
-- Target Configs
----------------------------------------------------------------------------------------

-- These are all empty for you to fill in, refer to the .md files for help in filling these in

Config.CircleZones = {
    
}

Config.BoxZones = {

    ["weedpro"] = {
        name = 'weedpro',
        coords = vector3(2328.57, 2570.7, 46.68),
        length = 1.6,
        width = 1,
        heading = 60,
        debugPoly = false,
      minZ=43.08,
      maxZ=47.08,
              options = {
                {
                    type = "client",
                    event = "weed:process",
                    icon = "fas fa-leaf",
                    label = "Processing Weed",
                },
            },	
        distance = 2.5,	 
    },
   
    ["craft12"] = {
        name = "Craft12",
        coords = vector3(95.7, 3747.0, 41.83),
        length = 1.9,
        width = 1.5,
        heading = 0,
        debugPoly = false,
        minZ=40.44,
        maxZ=41.00,
        options = {
		    {
                event = "inventory:client:WeaponAttachmentCrafting",
                icon = "fas fa-wrench",
                label = "Weapon Attachment Crafting", 
            },
            {
                event = "inventory:client:Crafting",
                icon = "fas fa-wrench",
                label = "Item Crafting", 
            },
		},
        distance = 2.5
    },

    


    ["mechaniccraft"] = {
        name = "Mechanic Toolbox",
        coords = vector3(136.7, -3051.41, 7.04),
        length = 1,
        width = 1,
        heading = 0,
        debugPoly = false,
        minZ=3.44,
        maxZ=7.44,
        options = {
            {
                type = "client",
                event = "craft:mechanicparts", 
                icon = "fas fa-wrench",
                label = "Craft",
                job = "tuner",
            },
        },
        distance = 2.5
    },

    
    ["boxzone1"] = {                                                                         
        name = "MissionRowDutyClipboard",
        coords = vector3(441.7989, -982.0529, 30.67834),
        length = 0.45,
        width = 0.35,
        heading = 11.0,
        debugPoly = false,
        minZ = 30.77834,
        maxZ = 30.87834,
        options = {
            {
              type = "client",
              event = "Toggle:Duty",
              icon = "fas fa-sign-in-alt",
              label = "Sign In / Out",
              job = "police",
            },
            {
                event = "cr-licensing:OpenUI",
                icon = "fas fa-sign-in-alt",
                label = "Create Business License",
                job = "police",
            },
        },
        distance = 3.5
    },
    ["PDArmory"] = {
        name = "PDArmory",
        coords = vector3(482.31, -995.27, 30.69),
        length = 2,
        width = 1,
        heading = 110,
        debugPoly = false,
        minZ = 45.77834,
        maxZ = 28.87834,
        options = {
            {
                type = "client",
                event = "police:openPDArmory",
                icon = "fas fa-clipboard",
                label = "Open Police Armory",
                job = "police",
            }
        },
        distance = 1.5
    }, 

}

Config.PolyZones = {
    -- ["weazel01"] = {
    --     name = "weazel01",
    --     coords = vector3(-592.364, -929.826, 23.869),
    --     length = 1.00,
    --     width = 1.00,
    --     heading = 92.42,
    --     debugPoly = true,
    --     minZ = 23.00,
    --     maxZ = 25.00,
    --     options = {
    --         {
    --             type = "client",
    --             event = "qb-newsjob:client:menu",
    --             parameters = {},
    --             icon = "fas fa-newspaper",
    --             label = "Open Job Menu",
    --             --job = {"all"},
    --         },
    --     },
    --     distance = 2.5
    -- },

}

Config.TargetBones = {
    ["Vehicle"] = {
        bones = {
            "door_dside_f",
            "door_dside_r",
            "door_pside_f",
            "door_pside_r",
            "wheel_lr"
        },
        options = {
			{
				type = "client",
                event = "vehiclekeys:client:GiveKeys",
                icon = "fas fa-key",
                label = "GIVE KEYS",
			},
			{	
				type = "client",
                event = "police:client:PutPlayerInVehicle",
                icon = "fas fa-chevron-circle-left",
                label = "PLACE IN VEHICLE",
                job = {["police"] = 1, ["police"] = 2, ["police"] = 3, ["ambulance"] = 1, ["ambulance"] = 2, ["ambulance"] = 3},
			 },
			 {
                type = "client",
                event = "police:client:SetPlayerOutVehicle",
                icon = "fas fa-chevron-circle-right",
                label = "TAKE OUT OF VEHICLE",
                job = {["police"] = 1, ["ambulance"] = 2},
            },
            {
                type = "client",
                event = "police:client:ImpoundVehicle",
                icon = "fas fa-car",
                label = "IMPOUND VEHICLE",
                job = 'police',
            },
            {
                type = "client",
                event = "mechanic:client:ImpoundVehicle",
                icon = "fas fa-car",
                label = "IMPOUND VEHICLE",
                job = 'mechanic',
            },
            {
                type = "client",
                event = "craft:vehmenu2",
                icon = "fas fa-wrench",
                label = "Examine Vehicle",
                job = 'mechanic',
            },
            {
                type = "client",
                event = "qb-vehiclefailure:client:RepairVehicleFull",
                icon = "fas fa-wrench",
                label = "REPAIR VEHICLE",
                job = 'mechanic',
                item = "advancedrepairkit",
            },
            {
                type = "client",
                event = "repair:mechanic",
                icon = "fas fa-hand-sparkles",
                label = "CLEAN VEHICLE",
                job = 'mechanic',
            },
            {
                type = "client",
                event = "qb-trunk:client:GetIn",
                icon = "fas fa-user-secret",
                label = "GET IN TRUNK",
            },
        
		},
		distance = 2.5,
	},
	-- ["bones"] = {
	-- 		bones = {
	-- 			'wheel_lr',
	-- 		},
	-- 		options = {
	-- 	  {
	-- 		type = "client",
	-- 		event = "lj-fuel:client:RefuelVehicle2",
	-- 		icon = "fas fa-gas-pump",
    --         --item = "weapon_petrolcan",
	-- 		label = "Refuel Vehicle 2",
	-- 	  },
	-- 		},
	-- 		  distance = 1.0
	-- 	},	
    ["mechanic"] = {
            bones = {
                "door_dside_f",
                "door_dside_r",
                "door_pside_f",
                "door_pside_r"
            },
            options = {
                {
                    type = "client",
                    event = "craft:vehmenu",
                    icon = "fas fa-key",
                    label = "Vehicle Menu",
                    job = "tuner",
                },
            },
            distance = 3.0
        },
}

Config.TargetEntities = {

}

Config.TargetModels = {
    ['weedpick'] = {
        models = `prop_weed_02`,
        options = {
            {
                type = "client",
                event = "weee:pick", 
                icon = "fas fa-cannabis",
                label = "Picking Weed",
                --price = 5,
            },
        },
        distance = 2.5
    },

    ["weedsell"] = {
        models = {
            "g_m_y_mexgang_01", 
        },
        options = {
            {
                type = "client",
                event = "weed:sell",
                icon = "fas fa-cannabis",
                label = "Sell WeedBag",
            },
        },
        distance = 2.5,
    },

    ["burgershotgarage"] = {
        models = {
            "ig_floyd"
        },
        options = {
            {
                type = "client",
                event = "garage:BurgerShotGarage",
                icon = "fas fa-car",
                label = "BurgerShot Garage",
                job = "burgershot",
            }
        },
        distance = 2.5,
    },

	["trashsearch"] = {
        models = {
			-1096777189,--normal small
			666561306,--big
			1437508529,--small circle
			-1426008804,--small open circle
			-228596739,--open small circle
			161465839,--werid blue small circle
			651101403,--open medium circle
			218085040,
			682791951,
			1511880420,

        },
        options = {
            {
                type = "client",
                event = "qb-trashsearch:client:searchtrash",
                icon = "fas fa-pencil-ruler",
                label = "Search Trash",
            },
        },
        distance = 2.1
    },

	["atm"] = {
		models = {-870868698, -1126237515, -1364697528, 506770882, 150237004, -239124254},
		options = {
			{
                type = "client",
                event = "qb-banking:client:atm:openUI",
                icon = "fas fa-pencil-ruler",
                label = "Open ATM",
            },
		},
		distance = 2.1
	  },
	
	["VehicleRental"] = {
        models = {
            `u_f_y_princess`,
        },
        options = {
            {
                type = "client",
                event = "qb-rental:openMenu",
                icon = "fas fa-car",
                label = "Rent Vehicle",
            },
        },
        distance = 4.0
    },

    


    ["PDGarage"] = {
		models = {
			`ig_trafficwarden`
		},
		options = {
			{
				event = "garage:menu",
				icon = "fas fa-shopping-cart",
				label = "Take out PD vehicle",
				job = "police",
				
			},
		},
		distance = 4.5,
	},
    ["emsgarage"] = {
		models = {
			`s_m_m_doctor_01`
		},
		options = {
			{
				event = "garage:ambulance",
				icon = "fas fa-shopping-cart",
				label = "Take out EMS vehicle",
				job = "ambulance",
				
			},
		},
		distance = 4.5,
	},
    

    
}




Config.GlobalPedOptions = {
    
}

Config.GlobalVehicleOptions = {

}

Config.GlobalObjectOptions = {

}



Config.GlobalPlayerOptions = {
    options = {
        { 
            type = "client",
            event = "police:client:CuffPlayerSoft",
            icon = 'fas fa-circle',
            label = 'Soft Cuff',
            job = 'police',
        },
        -- { 
        --     type = "client",
        --     event = "hospital:client:TreatWounds",
        --     icon = 'fas fa-circle',
        --     label = 'Heal Wounds',
        --     job = 'ambulance',
        --     item = "bandage",
        -- },
        -- { 
        --     type = "client",
        --     event = "hospital:client:RevivePlayer",
        --     icon = 'fas fa-circle',
        --     label = 'Revive Person',
        --     job = 'ambulance',
        --     item = "firstaid",
        -- },
        { 
            type = "client",
            event = "police:client:CuffPlayer",
            icon = 'fas fa-circle',
            label = 'Hard Cuff',
            job = 'police',
            item = 'handcuffs',
        },
        
        { 
            type = "client", 
            event = "police:client:EscortPlayer", 
            icon = 'fas fa-circle', 
            label = 'Escort',
        },
        { 
            type = "client", 
            event = "police:client:RobPlayer", 
            icon = 'fas fa-circle', 
            label = 'Rob Player',
        },
        { 
            type = "client", 
            event = "police:client:KidnapPlayer", 
            icon = 'fas fa-circle', 
            label = 'Kidnap Player',
        },
    },
      distance = 2.5,

}




Config.Peds = {

    -- ['tuner'] =  { 
    --     model = 's_m_y_xmech_01',
    --     coords = vector4(149.0, -3050.15, 6.04, 56.86),
    --     gender = 'male',
    --     freeze = true,
    --     invincible = true,
    --     blockevents = true,
    --     scenario = "WORLD_HUMAN_CLIPBOARD",
    -- },
        

    ["Mechanic1"] = {
		model = 'mp_m_waremech_01', 
		coords = vector4(-321.27, -131.41, 38.97, 95.98),
		minusOne = true, 
		freeze = true, 
		invincible = true, 
		blockevents = true,
		scenario = 'WORLD_HUMAN_DRUG_DEALER',
		target = { 
			options = {
				{
					type="client",
					event = "openweaponshop",
					icon = "fas fa-user-secret",
					label = "Mechanic Shop",
                    job = "mechanic"
				}
			},
		 distance = 3,
	 	}
	},
    

    ["OxyPed"] = {
		model = 'a_m_m_og_boss_01', 
		coords = vector4(-1563.44, -441.36, 36.96, 97.07),
		minusOne = true, 
		freeze = true, 
		invincible = true, 
		blockevents = true,
		scenario = 'WORLD_HUMAN_DRUG_DEALER',
		target = { 
			options = {
				{
					type="client",
					event = "oxyrun:client:sendToOxy",
					icon = "fas fa-user-secret",
					label = "Start Oxy"
				}
			},
		 distance = 3,
	 	}
	},

    ["Pharmacy"] = {
		model = 'g_m_y_lost_03', 
		coords = vector4(2885.22, 1519.04, 24.97, 1.08),
		minusOne = true, 
		freeze = true, 
		invincible = true, 
		blockevents = true,
		scenario = 'WORLD_HUMAN_DRUG_DEALER',
		target = { 
			options = {
				{
					type="client",
					event = "openweaponshop",
					icon = "fas fa-user-secret",
					label = "Open Pharmacy"
				}
			},
		 distance = 3,
	 	}
	},

	["OxyBoxPed"] = {
		model = 'a_m_m_salton_03', 
		coords = vector4(-2981.43, 1586.23, 23.69, 13.68),
		minusOne = true, 
		freeze = true, 
		invincible = true, 
		blockevents = true,
		target = {
			options = {
				{
					type="client",
					event = "oxyrun:client:getBox",
					icon = "fas fa-user-secret",
					label = "Grab Package"
				}
			},
		 distance = 3,
	 	}
	},
   
    

    [123] = {
        model = 's_m_m_doctor_01',
        coords = vector4(328.67, -590.88, 28.8, 334.36),
        currentpednumber = 0,
        freeze = true,
        blockevents = true,
        invincible = true,
		minusOne = true,
    },


    
	[1] = {
        model = 'mp_m_shopkeep_01',
        coords = vector4(24.470445, -1347.322, 29.497026, 278.51702),
        currentpednumber = 0,
        target = {
			options = {
				{
					event = "openweaponshop",
					icon = 'fas fa-shopping-basket',
					label = 'Purchase Goods',
				}
			},
			distance = 2.0
        },
        freeze = true,
        blockevents = true,
        invincible = true,
		minusOne = true,
    },
    -- [2] = {
    --     model = 'mp_m_shopkeep_01',
    --     coords = vector4(24.480998, -1344.977, 29.497026, 277.46746),
    --     currentpednumber = 0,
    --     freeze = true,
    --     blockevents = true,
    --     invincible = true,
	-- 	minusOne = true,
    -- },
    [2] = {
        model = 'mp_m_shopkeep_01',
        coords = vector4(-46.76187, -1757.88, 29.420993, 53.286235),
        currentpednumber = 0,
        freeze = true,
        blockevents = true,
        invincible = true,
		minusOne = true,
    },


    [659] = { 
        model = `g_m_y_mexgang_01`, 
        coords = vector4(-1164.92, -1566.67, 3.45, 307.22),
        gender = 'male',
        freeze = true,
        invincible = true,
        blockevents = true,
    },

    -- [4] = {
    --     model = 'mp_m_shopkeep_01',
    --     coords = vector4(-47.87234, -1759.253, 29.420993, 59.485439),
    --     currentpednumber = 0,
    --     freeze = true,
    --     blockevents = true,
    --     invincible = true,
	-- 	minusOne = true,
    -- },
    -- [5] = {
    --     model = 'mp_m_shopkeep_01',
    --     coords = vector4(2676.0439, 3280.5568, 55.24113, 336.40908),
    --     currentpednumber = 0,
    --     freeze = true,
    --     blockevents = true,
    --     invincible = true,
	-- 	minusOne = true,
    -- },
    [3] = {
        model = 'mp_m_shopkeep_01',
        coords = vector4(2678.069, 3279.4299, 55.24113, 333.71856),
        currentpednumber = 0,
        freeze = true,
        blockevents = true,
        invincible = true,
		minusOne = true,
    },
    -- [7] = {
    --     model = 'mp_m_shopkeep_01',
    --     coords = vector4(2554.8686, 380.92068, 108.62292, 357.84951),
    --     currentpednumber = 0,
    --     freeze = true,
    --     blockevents = true,
    --     invincible = true,
	-- 	minusOne = true,
    -- },
    [4] = {
        model = 'mp_m_shopkeep_01',
        coords = vector4(2557.2089, 380.8511, 108.62292, 2.3647084),
        currentpednumber = 0,
        freeze = true,
        blockevents = true,
        invincible = true,
		minusOne = true,
    },
    -- [9] = {
    --     model = 'mp_m_shopkeep_01',
    --     coords = vector4(373.14135, 328.63272, 103.56636, 255.98464),
    --     currentpednumber = 0,
    --     freeze = true,
    --     blockevents = true,
    --     invincible = true,
	-- 	minusOne = true,
    -- },
    [5] = {
        model = 'mp_m_shopkeep_01',
        coords = vector4(372.56628, 326.40258, 103.56636, 255.32598),
        currentpednumber = 0,
        freeze = true,
        blockevents = true,
        invincible = true,
		minusOne = true,
    },
    -- [11] = {
    --     model = 'mp_m_shopkeep_01',
    --     coords = vector4(-3041.194, 583.81359, 7.9089279, 19.277315),
    --     currentpednumber = 0,
    --     freeze = true,
    --     blockevents = true,
    --     invincible = true,
	-- 	minusOne = true,
    -- },
    [6] = {
        model = 'mp_m_shopkeep_01',
        coords = vector4(-3038.974, 584.56732, 7.9089279, 17.196483),
        currentpednumber = 0,
        freeze = true,
        blockevents = true,
        invincible = true,
		minusOne = true,
    },
    -- [13] = {
    --     model = 'mp_m_shopkeep_01',
    --     coords = vector4(1728.9183, 6417.2875, 35.037212, 243.59709),
    --     currentpednumber = 0,
    --     freeze = true,
    --     blockevents = true,
    --     invincible = true,
	-- 	minusOne = true,
    -- },
    [7] = {
        model = 'mp_m_shopkeep_01',
        coords = vector4(1727.7976, 6415.2319, 35.037212, 244.32299),
        currentpednumber = 0,
        freeze = true,
        blockevents = true,
        invincible = true,
		minusOne = true,
    },
    -- [15] = {
    --     model = 'mp_m_shopkeep_01',
    --     coords = vector4(549.33709, 2669.0356, 42.156482, 102.02597),
    --     currentpednumber = 0,
    --     freeze = true,
    --     blockevents = true,
    --     invincible = true,
	-- 	minusOne = true,
    -- },
    [8] = {
        model = 'mp_m_shopkeep_01',
        coords = vector4(549.12097, 2671.3535, 42.156482, 96.755142),
        currentpednumber = 0,
        freeze = true,
        blockevents = true,
        invincible = true,
		minusOne = true,
    },
    -- [17] = {
    --     model = 'mp_m_shopkeep_01',
    --     coords = vector4(1958.941, 3742.0305, 32.34373, 299.14047),
    --     currentpednumber = 0,
    --     freeze = true,
    --     blockevents = true,
    --     invincible = true,
	-- 	minusOne = true,
    -- },
    [9] = {
        model = 'mp_m_shopkeep_01',
        coords = vector4(1960.0323, 3739.9472, 32.34373, 300.66125),
        currentpednumber = 0,
        freeze = true,
        blockevents = true,
        invincible = true,
		minusOne = true,
    },
    -- [19] = {
    --     model = 'mp_m_shopkeep_01',
    --     coords = vector4(1696.6143, 4923.9008, 42.063632, 325.65075),
    --     currentpednumber = 0,
    --     freeze = true,
    --     blockevents = true,
    --     invincible = true,
	-- 	minusOne = true,
    -- },
    [10] = {
        model = 'mp_m_shopkeep_01',
        coords = vector4(1698.2056, 4922.8369, 42.063632, 324.48135),
        currentpednumber = 0,
        freeze = true,
        blockevents = true,
        invincible = true,
		minusOne = true,
    },

    [126] = {

        ---tunershop----
        model = 's_m_y_xmech_01',
	    coords = vector4(149.0, -3050.15, 6.04, 56.86),
	    gender = 'male',
        target = {

           
			options = {
                {
					event = "openweaponshop",
					icon = 'fas fa-circle',
					label = 'Open Shop',
                    job = 'tuner'
				}
			},
			distance = 2.0
        },
	    freeze = true,
	    invincible = true,
	    blockevents = true,
        scenario = "WORLD_HUMAN_CLIPBOARD",
    },
    -- [21] = {
    --     model = 'mp_m_shopkeep_01',
    --     coords = vector4(-3244.653, 1000.1612, 12.830703, 356.74475),
    --     currentpednumber = 0,
    --     freeze = true,
    --     blockevents = true,
    --     invincible = true,
	-- 	minusOne = true,
    -- },
    [11] = {
        model = 'mp_m_shopkeep_01',
        coords = vector4(-3242.285, 1000.0032, 12.830703, 352.69186),
        currentpednumber = 0,
        freeze = true,
        blockevents = true,
        invincible = true,
		minusOne = true,
    },
    -- [23] = {
    --     model = 'mp_m_shopkeep_01',
    --     coords = vector4(1165.0498, -324.5133, 69.205047, 102.96902),
    --     currentpednumber = 0,
    --     freeze = true,
    --     blockevents = true,
    --     invincible = true,
	-- 	minusOne = true,
    -- },
    [12] = {
        model = 'mp_m_shopkeep_01',
        coords = vector4(1164.7598, -322.7398, 69.205047, 91.003005),
        currentpednumber = 0,
        freeze = true,
        blockevents = true,
        invincible = true,
		minusOne = true,
    },
    -- [25] = {
    --     model = 'mp_m_shopkeep_01',
    --     coords = vector4(-706.1646, -915.3622, 19.215585, 86.595108),
    --     currentpednumber = 0,
    --     freeze = true,
    --     blockevents = true,
    --     invincible = true,
	-- 	minusOne = true,
    -- },
    [13] = {
        model = 'mp_m_shopkeep_01',
        coords = vector4(-706.0683, -913.6127, 19.215585, 85.84362),
        currentpednumber = 0,
        freeze = true,
        blockevents = true,
        invincible = true,
		minusOne = true,
    },
    -- [27] = {
    --     model = 'mp_m_shopkeep_01',
    --     coords = vector4(-1818.891, 792.94079, 138.08157, 136.09786),
    --     currentpednumber = 0,
    --     freeze = true,
    --     blockevents = true,
    --     invincible = true,
	-- 	minusOne = true,
    -- },
    [14] = {
        model = 'mp_m_shopkeep_01',
        coords = vector4(-1820.148, 794.25732, 138.089, 129.06069),
        currentpednumber = 0,
        freeze = true,
        blockevents = true,
        invincible = true,
		minusOne = true,
    },
    [15] = {
        model = 'mp_m_shopkeep_01',
        coords = vector4(-1486.3, -378.0245, 40.163436, 127.81726),
        currentpednumber = 0,
        freeze = true,
        blockevents = true,
        invincible = true,
		minusOne = true,
    },
    [16] = {
        model = 'mp_m_shopkeep_01',
        coords = vector4(1134.1445, -982.4488, 46.415794, 280.09643),
        currentpednumber = 0,
        freeze = true,
        blockevents = true,
        invincible = true,
		minusOne = true,
    },
    [17] = {
        model = 'mp_m_shopkeep_01',
        coords = vector4(-1222.018, -908.3048, 12.326345, 34.040473),
        currentpednumber = 0,
        freeze = true,
        blockevents = true,
        invincible = true,
		minusOne = true,
    },
    [18] = {
        model = 'mp_m_shopkeep_01',
        coords = vector4(1165.9462, 2710.7958, 38.157714, 177.69526),
        currentpednumber = 0,
        freeze = true,
        blockevents = true,
        invincible = true,
		minusOne = true,
    },
    [19] = {
        model = 'mp_m_shopkeep_01',
        coords = vector4(-2966.356, 390.91439, 15.043301, 84.220359),
        currentpednumber = 0,
        freeze = true,
        blockevents = true,
        invincible = true,
		minusOne = true,
    },
    [20] = {
        model = 's_m_m_gaffer_01',
        coords = vector4(2748.0466, 3472.6481, 55.674034, 246.37159),
        currentpednumber = 0,
		target = {
			options = {
				{
					event = "openweaponshop",
					icon = 'fas fa-circle',
					label = 'Tool Shop',
				}
			},
			distance = 2.0
        },
        freeze = true,
        blockevents = true,
        invincible = true,
		minusOne = true,
    },
    [21] = {
        model = 's_m_m_gaffer_01',
        coords = vector4(45.651863, -1749.072, 29.611156, 50.418632),
        currentpednumber = 0,
        freeze = true,
        blockevents = true,
        invincible = true,
		minusOne = true,
    },
    [22] = {
        model = 's_m_y_ammucity_01',
        coords = vector4(23.530004, -1105.781, 29.797002, 145.90115),
        currentpednumber = 0,
		target = {
			options = {
				{
					event = "openweaponshop",
					icon = 'fas fa-circle',
					label = 'Purchase Weapons',
				}
			},
			distance = 2.0
        },
        freeze = true,
        blockevents = true,
        invincible = true,
		minusOne = true,
    },
    [23] = {
        model = 's_m_y_ammucity_01',
        coords = vector4(2566.8322, 292.64425, 108.73484, 334.33978),
        currentpednumber = 0,
        freeze = true,
        blockevents = true,
        invincible = true,
		minusOne = true,
    },
    [24] = {
        model = 's_m_y_ammucity_01',
        coords = vector4(-330.8014, 6085.7416, 31.454763, 205.01104),
        currentpednumber = 0,
        freeze = true,
        blockevents = true,
        invincible = true,
		minusOne = true,
    },

    [639] = {
        model = `a_f_y_business_02`, -- Model name as a hash.
        coords = vector4(-592.364, -929.826, 23.869, 92.42), -- (X, Y, Z, Heading)
        gender = 'female', -- The gender of the ped, used for the CreatePed native.
        scenario = 'WORLD_HUMAN_CLIPBOARD', -- Task Scenario
        freeze = true,
        blockevents = true,
        invincible = true,
		minusOne = true,
    },

    -- [634] = {
    --     model = 'a_f_y_business_02',
    --     coords = vector4(-592.364, -929.826, 23.869, 92.42),
    --     currentpednumber = 0,
    --     freeze = true,
    --     blockevents = true,
    --     invincible = true,
	-- 	minusOne = true,
        
    -- },
    [25] = {
        model = 's_m_y_ammucity_01',
        coords = vector4(-661.0814, -933.6092, 21.829221, 157.16574),
        currentpednumber = 0,
        freeze = true,
        blockevents = true,
        invincible = true,
		minusOne = true,
    },
    [26] = {
        model = 's_m_y_ammucity_01',
        coords = vector4(-1118.136, 2700.4506, 18.554126, 200.775),
        currentpednumber = 0,
        freeze = true,
        blockevents = true,
        invincible = true,
		minusOne = true,
    },
    [27] = {
        model = 's_m_y_ammucity_01',
        coords = vector4(253.36781, -51.6715, 69.941055, 41.868831),
        currentpednumber = 0,
        freeze = true,
        blockevents = true,
        invincible = true,
		minusOne = true,
    },
    [28] = {
        model = 's_m_y_ammucity_01',
        coords = vector4(808.98162, -2158.985, 29.618989, 331.44378),
        currentpednumber = 0,
        freeze = true,
        blockevents = true,
        invincible = true,
		minusOne = true,
    },
    [29] = {
        model = 's_m_y_ammucity_01',
        coords = vector4(841.09906, -1035.295, 28.194868, 333.85577),
        currentpednumber = 0,
        freeze = true,
        blockevents = true,
        invincible = true,
		minusOne = true,
    },
    [30] = {
        model = 's_m_y_ammucity_01',
        coords = vector4(1693.1195, 3761.8916, 34.70531, 197.20341),
        currentpednumber = 0,
        freeze = true,
        blockevents = true,
        invincible = true,
		minusOne = true,
    },
	-- [31] = {
	-- 	model = 's_m_m_doctor_01',
	-- 	coords = vector4(309.64569, -593.7731, 43.284057, 25.065393),
	-- 	currentpednumber = 0,
	-- 	target = {
	-- 		options = {
	-- 			{
	-- 				event = "xz-ems:client:OpenPharmacy",
	-- 				icon = "fas fa-circle",
	-- 				label = "Open Pharamcy"
	-- 			}
	-- 		},
	-- 		distance = 2.0,
	-- 	},
	-- 	freeze = true,
	-- 	blockevents = true,
	-- 	invincible = true,
	-- 	minusOne = true,
	-- },
    -- [32] = {
	-- 	model = 's_m_m_doctor_01',
	-- 	coords = vector4(349.49304, -587.7797, 28.796838, 244.13285),
	-- 	currentpednumber = 0,
	-- 	target = {
	-- 		options = {
	-- 			{
	-- 				event = "xz-ems:client:OpenPharmacy",
	-- 				icon = "fas fa-circle",
	-- 				label = "Open Pharamcy"
	-- 			}
	-- 		},
	-- 		distance = 2.0,
	-- 	},
	-- 	freeze = true,
	-- 	blockevents = true,
	-- 	invincible = true,
	-- 	minusOne = true,
	-- },
    -- [33] = {
    --     model = "csb_trafficwarden",
    --     coords = vector4(-193.4324, -1162.354, 23.67136, 268.79577),
    --     currentpednumber = 0,
    --     target = {
    --         options = {
    --             {
    --                 event = "xz-garages-ido:client:requestOutOfImpound",
    --                 icon = "fas fa-circle",
    --                 label = "Impound"
    --             }
    --         }, 
    --         distnace = 2.0
    --     },
    --     freeze = true,
    --     blockevents = true,
    --     invincible = true, 
    --     minusOne = true,
    -- },
    -- [34] = {
    --     model = "cs_hunter",
    --     coords = vector4(-679.8368, 5838.8764, 17.331438, 222.90434),
    --     currentpednumber = 0,
    --     target = {
    --         options = {
    --             {
    --                 event = "starthunting",
    --                 icon = "fas fa-circle",
    --                 label = "Start Hunting"
    --             },
    --             {
    --                 event = "xz-hunting:server:sellMeat",
    --                 icon = "fas fa-circle",
    --                 label = "Sell meats"
    --             }
    --         }, 
    --         distnace = 2.0
    --     },
    --     freeze = true,
    --     blockevents = true,
    --     invincible = true,
    --     minusOne = true,
    -- },
    -- [35] = {
    --     model = 'cs_movpremmale',
    --     coords = vector4(-7.754626, 468.1943, 145.86357, 343.79757),
    --     currentpednumber = 0,
    --     target = {
    --         options = {
    --             {
    --                 event = 'xz-pawnshop:client:trySell',
    --                 icon = 'fas fa-dollar-sign',
    --                 label = 'Sell Valuables'
    --             }
    --         },
    --         distance = 2.5,
    --         canInteract = function()
    --             if #(GetEntityCoords(PlayerPedId()) - vector3(-7.754626, 468.1943, 145.86357)) < 3.0 then
    --                 return true
    --             end
    --             return false
    --         end,
    --     },
    --     freeze = true,
    --     blockevents = true,
    --     invincible = true,
    --     minusOne = true,
    -- },
    -- [36] = {
    --     model = 'ig_lifeinvad_01',
    --     coords = vector4(48.492279, -1594.352, 29.59778, 49.147617),
    --     currentpednumber = 0,
    --     target = {
    --         options = {
    --             {
    --                 event = 'xz-pawnshop:client:trySell',
    --                 icon = 'fas fa-dollar-sign',
    --                 label = 'Sell Hardware'
    --             }
    --         },
    --         distance = 2.5,
    --         canInteract = function()
    --             if #(GetEntityCoords(PlayerPedId()) - vector3(48.492279, -1594.352, 29.59778)) < 3.0 then
    --                 return true
    --             end
    --             return false
    --         end,
    --     },
    --     freeze = true,
    --     blockevents = true,
    --     invincible = true,
    --     minusOne = true,
    -- },
    -- [37] = {
    --     model = 'cs_old_man2',
    --     coords = vector4(-732.3901, -1312.173, 5.000379, 48.43991),
    --     currentpednumber = 0,
    --     target = {
    --         options = {
    --             {
    --                 event = 'xz-phone:client:boatMenu',
    --                 icon = 'fas fa-key',
    --                 label = 'Rent a Boat'
    --             }
    --         },
    --         distance = 2.5,
    --         canInteract = function()
    --             if #(GetEntityCoords(PlayerPedId()) - vector3(-732.3901, -1312.173, 5.000379)) < 3.0 then
    --                 return true
    --             end
    --             return false
    --         end,
    --     },
    --     freeze = true,
    --     blockevents = true,
    --     invincible = true,
    --     minusOne = true,
    -- },
    -- [38] = {
    --     model = 'cs_old_man2',
    --     coords = vector4(3854.6093, 4458.9965, 1.8497662, 358.31735),
    --     currentpednumber = 0,
    --     target = {
    --         options = {
    --             {
    --                 event = 'xz-phone:client:boatMenu',
    --                 icon = 'fas fa-key',
    --                 label = 'Rent a Boat'
    --             }
    --         },
    --         distance = 2.5,
    --         canInteract = function()
    --             if #(GetEntityCoords(PlayerPedId()) - vector3(3854.6093, 4458.9965, 1.8497662)) < 3.0 then
    --                 return true
    --             end
    --             return false
    --         end,
    --     },
    --     freeze = true,
    --     blockevents = true,
    --     invincible = true,
    --     minusOne = true,
    -- },
    -- [39] = {
    --     model = 'cs_old_man2',
    --     coords = vector4(-3425.839, 952.20977, 8.3466939, 356.87887),
    --     currentpednumber = 0,
    --     target = {
    --         options = {
    --             {
    --                 event = 'xz-phone:client:boatMenu',
    --                 icon = 'fas fa-key',
    --                 label = 'Rent a Boat'
    --             }
    --         },
    --         distance = 2.5,
    --         canInteract = function()
    --             if #(GetEntityCoords(PlayerPedId()) - vector3(-3425.839, 952.20977, 8.3466939)) < 3.0 then
    --                 return true
    --             end
    --             return false
    --         end,
    --     },
    --     freeze = true,
    --     blockevents = true,
    --     invincible = true,
    --     minusOne = true,
    -- },

    ["Bankpad2"] = {
		model = 'ig_bankman', 
		coords = vector4(-112.24, 6471.07, 31.63, 131.64),
		minusOne = true, 
		freeze = true, 
		invincible = true, 
		blockevents = true,
		target = { 
		  options = {
            {
                type = "client",
                event = "qb-banking:client:bank:openUI",
                icon = "fas fa-sign-in-alt",
                label = "Open Bank",
            },
		 },
		 distance = 1.5,
	 },

    },


    ["Huntingshop"] = {
		model = 'ig_hunter', 
		coords = vector4(-680.37, 5839.14, 17.34, 220.99),
		minusOne = true, 
		freeze = true, 
		invincible = true, 
		blockevents = true,
		target = { 
		  options = {
            {
                type = "client",
                event = "openweaponshop",
                icon = "fas fa-sign-in-alt",
                label = "Hunting Shop",
            },
		 },
		 distance = 1.5,
	 },

    },

    

    ["Bankpad3"] = {
		model = 'ig_bankman', 
		coords = vector4(1174.94, 2708.31, 38.09, 177.22),
		minusOne = true, 
		freeze = true, 
		invincible = true, 
		blockevents = true,
		target = { 
		  options = {
            {
                type = "client",
                event = "qb-banking:client:bank:openUI",
                icon = "fas fa-sign-in-alt",
                label = "Open Bank",
            },
		 },
		 distance = 1.5,
	 },

    },

    
    
    ["Bankpad4"] = {
		model = 'ig_bankman', 
		coords = vector4(-1212.03, -332.08, 37.78, 22.7),
		minusOne = true, 
		freeze = true, 
		invincible = true, 
		blockevents = true,
		target = { 
		  options = {
            {
                type = "client",
                event = "qb-banking:client:bank:openUI",
                icon = "fas fa-sign-in-alt",
                label = "Open Bank",
            },
		 },
		 distance = 1.5,
	 },

    },
    
    ["Bankpad5"] = {
		model = 'ig_bankman', 
		coords = vector4(-351.36, -51.34, 49.04, 343.25),
		minusOne = true, 
		freeze = true, 
		invincible = true, 
		blockevents = true,
		target = { 
		  options = {
            {
                type = "client",
                event = "qb-banking:client:bank:openUI",
                icon = "fas fa-sign-in-alt",
                label = "Open Bank",
            },
		 },
		 distance = 1.5,
	 },

    },

    
    ["Bankpad6"] = {
		model = 'ig_bankman', 
		coords = vector4(313.75, -280.52, 54.16, 341.44),
		minusOne = true, 
		freeze = true, 
		invincible = true, 
		blockevents = true,
		target = { 
		  options = {
            {
                type = "client",
                event = "qb-banking:client:bank:openUI",
                icon = "fas fa-sign-in-alt",
                label = "Open Bank",
            },
		 },
		 distance = 1.5,
	 },

    },


    
    ["Bankpad13"] = {
		model = 'ig_bankman', 
		coords = vector4(254.16, 222.42, 106.29, 157.98),
		minusOne = true, 
		freeze = true, 
		invincible = true, 
		blockevents = true,
		target = { 
		  options = {
            {
                type = "client",
                event = "qb-banking:client:bank:openUI",
                icon = "fas fa-sign-in-alt",
                label = "Open Bank",
            },
		 },
		 distance = 2.5,
	 },

    },
    ["Bankpad12"] = {
		model = 'ig_bankman', 
		coords = vector4(252.15, 223.17, 106.29, 163.41),
		minusOne = true, 
		freeze = true, 
		invincible = true, 
		blockevents = true,
		target = { 
		  options = {
            {
                type = "client",
                event = "qb-banking:client:bank:openUI",
                icon = "fas fa-sign-in-alt",
                label = "Open Bank",
            },
		 },
		 distance = 2.5,
	 },

    },

    ["Bankpad11"] = {
		model = 'ig_bankman', 
		coords = vector4(248.9, 224.39, 106.29, 161.93),
		minusOne = true, 
		freeze = true, 
		invincible = true, 
		blockevents = true,
		target = { 
		  options = {
            {
                type = "client",
                event = "qb-banking:client:bank:openUI",
                icon = "fas fa-sign-in-alt",
                label = "Open Bank",
            },
		 },
		 distance = 2.5,
	 },

    },
    
    ["Bankpad10"] = {
		model = 'ig_bankman', 
		coords = vector4(247.18, 225.08, 106.29, 156.86),
		minusOne = true, 
		freeze = true, 
		invincible = true, 
		blockevents = true,
		target = { 
		  options = {
            {
                type = "client",
                event = "qb-banking:client:bank:openUI",
                icon = "fas fa-sign-in-alt",
                label = "Open Bank",
            },
		 },
		 distance = 2.5,
	 },

    },
    ["Bankpad9"] = {
		model = 'ig_bankman', 
		coords = vector4(243.75, 226.24, 106.29, 154.25),
		minusOne = true, 
		freeze = true, 
		invincible = true, 
		blockevents = true,
		target = { 
		  options = {
            {
                type = "client",
                event = "qb-banking:client:bank:openUI",
                icon = "fas fa-sign-in-alt",
                label = "Open Bank",
            },
		 },
		 distance = 2.5,
	 },

    },

    ["Bankpad8"] = {
		model = 'ig_bankman', 
		coords = vector4(241.93, 226.88, 106.29, 162.03),
		minusOne = true, 
		freeze = true, 
		invincible = true, 
		blockevents = true,
		target = { 
		  options = {
            {
                type = "client",
                event = "qb-banking:client:bank:openUI",
                icon = "fas fa-sign-in-alt",
                label = "Open Bank",
            },
		 },
		 distance = 1.5,
	 },

    },

    ["Bankpad7"] = {
		model = 'ig_bankman', 
		coords = vector4(-2961.08, 483.04, 15.7, 83.94),
		minusOne = true, 
		freeze = true, 
		invincible = true, 
		blockevents = true,
		target = { 
		  options = {
            {
                type = "client",
                event = "qb-banking:client:bank:openUI",
                icon = "fas fa-sign-in-alt",
                label = "Open Bank",
            },
		 },
		 distance = 1.5,
	 },

    },
    ["GarbagePed"] = {
		model = 's_m_y_garbage', 
		coords = vector4(-349.96, -1569.92, 25.22, 296.46),
		minusOne = true, 
		freeze = true, 
		invincible = true, 
		blockevents = true,
		target = { 
		  options = {
			 {
				 type = "server",
				 event = "garbage:server:getGarbageJob",
				 icon = "fas fa-sign-in-alt",
				 label = "Get Garbage Job",
			 },
			 {
				 type = "client",
				 event = "garbage:getTruck",
				 icon = "fas fa-sign-in-alt",
				 label = "Get Garbage Truck",
			 },
			 {
				 type = "server",
				 event = "garbagejob:server:PayShift",
				 icon = "fas fa-sign-in-alt",
				 label = "Collect Pay Check",
			 },
		 },
		 distance = 1.5,
	 },
 },

 ["bankped"] = {
	model = `ig_bankman`,
	coords = vector4(149.46, -1042.09, 29.37, 335.43),
	minusOne = true, 
	freeze = true, 
	invincible = true, 
	blockevents = true,
	target = { 
	  options = {
		 {
			 type = "client",
			 event = "qb-banking:client:bank:openUI",
			 icon = "fas fa-sign-in-alt",
			 label = "Open Bank",
		 },
	 },
	 distance = 1.5,
    },
},

}

----------------------------------------------------------------------------------------
-- Functions
----------------------------------------------------------------------------------------

if Config.EnableDefaultOptions then
	function Config.ToggleDoor(vehicle, door)
		if GetVehicleDoorLockStatus(vehicle) ~= 2 then
			if GetVehicleDoorAngleRatio(vehicle, door) > 0.0 then
				SetVehicleDoorShut(vehicle, door, false)
			else
				SetVehicleDoorOpen(vehicle, door, false)
			end
		end
	end
end

----------------------------------------------------------------------------------------
-- Default options
----------------------------------------------------------------------------------------

-- These options don't represent the actual way of making TargetBones or filling out Config.TargetBones, refer to the TEMPLATES.md for a template on that, this is only the way to add it without affecting the config table

if Config.EnableDefaultOptions then
	Bones['seat_dside_f'] = {
		["Toggle Front Door"] = {
			icon = "fas fa-door-open",
			label = "Toggle Front Door",
			canInteract = function(entity)
				return GetEntityBoneIndexByName(entity, 'door_dside_f') ~= -1
			end,
			action = function(entity)
				Config.ToggleDoor(entity, 0)
			end,
			distance = 1.2
		}
	}

	Bones['seat_pside_f'] = {
		["Toggle Front Door"] = {
			icon = "fas fa-door-open",
			label = "Toggle Front Door",
			canInteract = function(entity)
				return GetEntityBoneIndexByName(entity, 'door_pside_f') ~= -1
			end,
			action = function(entity)
				Config.ToggleDoor(entity, 1)
			end,
			distance = 1.2
		}
	}

	Bones['seat_dside_r'] = {
		["Toggle Rear Door"] = {
			icon = "fas fa-door-open",
			label = "Toggle Rear Door",
			canInteract = function(entity)
				return GetEntityBoneIndexByName(entity, 'door_dside_r') ~= -1
			end,
			action = function(entity)
				Config.ToggleDoor(entity, 2)
			end,
			distance = 1.2
		}
	}

	Bones['seat_pside_r'] = {
		["Toggle Rear Door"] = {
			icon = "fas fa-door-open",
			label = "Toggle Rear Door",
			canInteract = function(entity)
				return GetEntityBoneIndexByName(entity, 'door_pside_r') ~= -1
			end,
			action = function(entity)
				Config.ToggleDoor(entity, 3)
			end,
			distance = 1.2
		}
	}

	Bones['bonnet'] = {
		["Toggle Hood"] = {
			icon = "fa-duotone fa-engine",
			label = "Toggle Hood",
			action = function(entity)
				Config.ToggleDoor(entity, 4)
			end,
			distance = 0.9
		}
	}
end