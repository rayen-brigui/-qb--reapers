# **[qb-inventory](https://github.com/qbcore-framework/qb-inventory)** reskin 

| If you are intested in recieving github updates join the community on **[Discord](https://discord.gg/NVsaunpesE)**! |
|----|

*Fan-made re-skin...*

# Showcase

**[Video-OUTDATED](https://streamable.com/5tpgg0)**

### 3.0 Reskin

![General](https://i.imgur.com/ZA393yr.png)

### 3.5 Reskin
![ItemBoxes](https://i.imgur.com/BlUvpQi.png)
![Hotbar](https://i.imgur.com/oi5Vaw3.png)
![Main](https://i.imgur.com/umPO1Zb.png)


# Info
- **[edited qb-weapons [W.I.P]](https://github.com/dojwun/qb-weapons)**  Mostly used for getting ammo values in qb-inventory tool tip (can be disabled)

- **[dp-clothing](https://github.com/andristum/dpclothing)** is required for clothing-menu to work in **[3.0 reskin](https://i.imgur.com/ZA393yr.png)**


### Settings Button Info
- Currently the "⚙️" button is set-up to use **[lj-menu](https://github.com/loljoshie/lj-menu)**
- You also have the option to trigger your own event or just disable the button in the **[config](https://i.imgur.com/Zp1yszj.png)**

# Common "errors"
### Fix Uncaught TypeError 
- To fix 
```[script:qb-inventory:nui] Uncaught TypeError: Cannot read property "toFixed" of undefined```
- Quality has to be manually added to the item u just recieved 
- For example: ```Player.Functions.AddItem(item, amount, slot, {["quality"] = 100})```

### Fix Item showing up as **[[+Undefined/-Undefined]](https://i.imgur.com/kHXFzWN.png)**
- You need to add the *amount* of items recieved in the 'inventory:client:ItemBox' event the item was triggered from 
- For example:

```TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['water'], "add", 1)``` <--
```TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['water'], "remove", 1)``` <--




