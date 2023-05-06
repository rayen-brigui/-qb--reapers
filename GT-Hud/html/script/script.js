const app = new Vue({
    el : '#app',
    data : {
        playerId : 0,
        bankMoney : 0,
        cash : 0,
        joblabel : '',
        grade_label : '',
        
        svg : [],
        currentHud : 'classic',
        selectSpeedUnit : 'kmh',
        hide : false,
        indicatorDegree : 0,
        enableCinematic : false,
        speed : 0,
        rpm : 0,
        fuel : 0,
        settingsOpen : false,
        showSpeedometer : false,
        heading : '',
        statusData : {
            health : 0,
            hunger : 0,
            thirst : 0,
            stamina : 0,
            stress : 0,
            armour : 0,
            altitude : 0,
            nitro : 0,
            mic_level : 1,
            talking : false,
        },
        bars : {
            bar_1 : null,
            bar_2 : null,
            bar_3 : null,
            bar_4 : null,
            bar_5 : null,
            bar_6 : null,
            bar_7 : false,

            bar_1_set : false,
            bar_2_set : false,
            bar_3_set : false,
            bar_4_set : false,
            bar_5_set : false,
            bar_6_set : false,
            bar_7_set : false,


        },
        text1 : '',
        text2 : '',
        addedMoney : null,
        isMinus : false,
        street : '',
        zone : '',
        clock : '',
        date : '',
        forceHide : true,
        DisplayRealTime : true,
        displayOnWalk : false,
        useStress: true,
        cruiseIsOn : false,
        engineIsOn: false,
        sealtBeltIsOn : false,
        lightsOn : false,
        locales : {},
        showParachute : false,
        showAltitude : false,
        altitude : 0,
        enableWaterMarkHud : true,
        useNitro : true,
        moneyType : 'cash',
        dateDisplay : true,
        seatbeltDisplayActive : false,
        cruiseDisplayActive : false,
    
    },

    
    methods : {
        SetCruiseDisplay(val){
            this.cruiseDisplayActive = val
        },
        SetSeatbeltDisplay(val){
            this.seatbeltDisplayActive = val
        },
        SetDateDisplay(val){
            this.dateDisplay = val
        },
        SetWaterMarkHud(val){
            this.enableWaterMarkHud = val
        },
        SetUseNitro(val){
            this.useNitro = val
        },
        UpdateAltitude(val){
            this.showAltitude = val
        },
        UpdateParachute(val){
            this.showParachute = val
        },
        UpdateJob(joblabel, gradelabel){
            this.joblabel = joblabel
            this.grade_label = gradelabel
        },
        SetLocales(val){
            this.locales = val
        },
        UpdateLights(val){
            this.lightsOn = val
        },
        UpdateSeatbelt(val){
            this.sealtBeltIsOn = val
        },
        ToggleCruise(val){
            this.cruiseIsOn = val
        },
        ToggleEngine(val){
            this.engineIsOn = val
        },
        UseStress(useStress){
            this.useStress = useStress
        },
        SetDisplayRealTime(val){
            this.DisplayRealTime = val
        },
        SetDate(clock,date){
            this.clock = clock
            this.date = date

        },
        SetId(val){
            this.playerId = val
        },
        SetBankMoney(val){
            this.bankMoney = val
        },
        SetCash(val){
            this.cash = val
        },
        UpdateSettings(data){
            if(data.speedtype){
                this.selectSpeedUnit = data.speedtype
            }
            if(data.hud){
                this.currentHud = data.hud
            }
            if(data.forceHide  != null && data.forceHide != undefined){
                this.forceHide = data.forceHide
            }

            if(data.hide != null && data.hide != undefined){
                this.hide = data.hide
            }
        },
        SetForceHide(val){
            this.forceHide = val
        },
        SetSpeedometerVisibility(visibility, displayOnWalk){
            this.showSpeedometer = visibility
            this.displayOnWalk = displayOnWalk
        },
        SetHudSettingsVisibilty(visibility){
            this.settingsOpen = visibility
            if(visibility){
                this.bar_1 = null 
                this.bar_2 = null 
                this.bar_3 = null 
                this.bar_4 = null 
                this.bar_5 = null 
                this.bar_6 = null 
                this.bar_7 = null 
                this.bar_8 = null 
                this.bar_9 = null 

                this.bar_1_set = false
                this.bar_2_set = false
                this.bar_3_set = false
                this.bar_4_set = false
                this.bar_5_set = false
                this.bar_6_set = false
                this.bar_7_set = false
                this.bar_8_set = false
                this.bar_9_set = false


            }
        },
        SetStatusData(type, val){
            if(type == "altitude"){
                if(val >= 2483){
                    val = 2483
                }else if(val <= 0){
                    val = 0
                }

            }
            if(type == 'health'){
                if(val < 0){
                    val = 0
                }
            }
            if(typeof(val) == 'boolean'){
                this.statusData[type] = val

            }else{

                this.statusData[type] = val.toFixed(0)
            }
     
            if(type == "nitro"){
                if(val <= 0){
                    val = 0
                }
                if(document.querySelector('#nitroLoader')){
                    init('nitroLoader', 'nitroBorder', val/100);
                    if(this.bar_8 == null){
                        this.bar_8 = new ProgressBar.Path('#nitroText', {
                            easing: 'easeInOut',
                            duration: 400
                        });
                    }
                  
                    if(this.bar_8 && !this.bar_8_set){
                        this.bar_8.set(0)
                        this.bar_8_set = true
                    }
                    this.bar_8.animate(val/100)

                }
          
            }
            if(type == "altitude"){
                if(document.querySelector('#altitudeLoader')){
               

                    init('altitudeLoader', 'altitudeBorder', 1.0-(val/2483));
                    if(this.bar_7 == null){
                        this.bar_7 = new ProgressBar.Path('#altitudeText', {
                            easing: 'easeInOut',
                            duration: 400
                        });
                    }
                  
                    if(this.bar_7 && !this.bar_7_set){
                        this.bar_7.set(0)
                        this.bar_7_set = true
                    }
                    this.bar_7.animate(1.0-(val/2483))
                }
                if(document.querySelector('#parachuteLoader')){
            
                    init('parachuteLoader', 'parachuteBorder', 1.0-(val/2483));
                    if(this.bar_9 == null){
                        this.bar_9 = new ProgressBar.Path('#parachuteText', {
                            easing: 'easeInOut',
                            duration: 400
                        });
                    }
                  
                    if(this.bar_9 && !this.bar_9_set){
                        this.bar_9.set(0)
                        this.bar_9_set = true
                    }
                    this.bar_9.animate(1.0-(val/2483))
                }
            }
            if(type == "health"){
                if(document.querySelector('#healthLoader')){
                    if(val <= 0){
                        val = 0
                    }
                    init('healthLoader', 'healthBorder', val/100);
                    if(this.bar_1 == null){
                        this.bar_1 = new ProgressBar.Path('#healthText', {
                            easing: 'easeInOut',
                            duration: 400
                        });
                    }
                  
                    if(this.bar_1 && !this.bar_1_set){
                        this.bar_1.set(0)
                        this.bar_1_set = true
                    }
                    this.bar_1.animate(val/100)
                }
            }
            if(type == "hunger"){

                if(document.querySelector('#hungerLoader')){
                    init('hungerLoader', 'hungerBorder', val/100);
                    if(this.bar_2 == null){
                        this.bar_2 = new ProgressBar.Path('#hungerText', {
                            easing: 'easeInOut',
                            duration: 400
                        });
                    }
                  
                    if(this.bar_2 && !this.bar_2_set){
                        this.bar_2.set(0)
                        this.bar_2_set = true
                    }
                    this.bar_2.animate(val/100)
                }
            }
            if(type == "thirst"){
                if(document.querySelector('#waterLoader')){
                    init('waterLoader', 'waterBorder', val/100);
                    if(this.bar_3 == null){
                        this.bar_3 = new ProgressBar.Path('#waterText', {
                            easing: 'easeInOut',
                            duration: 400
                        });
                    }
                  
                    if(this.bar_3 && !this.bar_3_set){
                        this.bar_3.set(0)
                        this.bar_3_set = true
                    }
                    this.bar_3.animate(val/100)
                }
            }
            if(type == "stamina"){

                if(document.querySelector('#staminaLoader')){
                    init('staminaLoader', 'staminaBorder', val/100);
                    if(this.bar_4 == null){
                        this.bar_4 = new ProgressBar.Path('#staminaText', {
                            easing: 'easeInOut',
                            duration: 400
                        });
                    }
                  
                    if(this.bar_4 && !this.bar_4_set){
                        this.bar_4.set(0)
                        this.bar_4_set = true
                    }
                    this.bar_4.animate(val/100)
                }
            }
            if(type == "armour"){
                if(document.querySelector('#armorLoader')){
                    init('armorLoader', 'armorBorder', val/100);
                    if(this.bar_5 == null){
                        this.bar_5 = new ProgressBar.Path('#armorText', {
                            easing: 'easeInOut',
                            duration: 400
                        });
                    }
                  
                    if(this.bar_5 && !this.bar_5_set){
                        this.bar_5.set(0)
                        this.bar_5_set = true
                    }
                    this.bar_5.animate(val/100)
                }
            }
            if(type == "stress" && this.useStress){
                if(document.querySelector('#stressLoader')){
                    init('stressLoader', 'stressBorder', val/100);
                    if(this.bar_6 == null){
                        this.bar_6 = new ProgressBar.Path('#stressText', {
                            easing: 'easeInOut',
                            duration: 400
                        });
                    }
                  
                    if(this.bar_6 && !this.bar_6_set){
                        this.bar_6.set(0)
                        this.bar_6_set = true
                    }
                    this.bar_6.animate(val/100)
                }
            }
    
        },
        LocationUpdate(zone, street, heading){
            street = street.length > 12 ? street.slice(0, 12)+'..' : street       
            this.street = street
            zone = zone.length > 12 ? zone.slice(0, 12)+'..' : zone

            this.zone = zone
            this.heading = heading
        },
        OnAddedMoney(amount, minus, moneyType){
            this.addedMoney = amount
            this.moneyType = moneyType
            this.isMinus = minus
            setTimeout(() =>{
                this.addedMoney = null
            }, 1500)
        },
        numberWithSpaces(x) {
            return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, " ");
        },
        SetCurrentHud(hud){
            $.post(`https://GT-hud/hudselected`, JSON.stringify({settingstype : 'hud', val : hud}));        
        },

        SetSelectSpeedUnit(val){
            $.post(`https://GT-hud/hudselected`, JSON.stringify({settingstype : 'speedtype', val}));

        },
        ToggleHud(){
            $.post(`https://GT-hud/hudselected`, JSON.stringify({settingstype : 'hide', val : !this.hide}));
        },
        ToggleCinematic(){
            $.post(`https://GT-hud/toggleCinematic`, JSON.stringify({}), (val) =>{
                this.enableCinematic = val
            });
        },
        ExitSettings(){
            this.SetHudSettingsVisibilty(false)
            $.post(`https://GT-hud/ExitSettings`, JSON.stringify({}));
        },
        SetFuel(fuel){
            this.fuel = fuel
        },
        GetSvg(type){
            let data = this.svg.filter((s) => s.type == type)
            return data[0] ? data[0].svg :  ''
        },
        SetIndicatorDegree(val, rpm){
            this.speed = val
            this.rpm = rpm
            if(val >= 100){
                if(val >= 240){
                    this.indicatorDegree = 240 - 140
                }else{
                    this.indicatorDegree = val - 140
                }
            }else{
                this.indicatorDegree = val - 124

            }
        },
        AddSvg(type, svg){

            this.svg.push({
                svg,
                type
            })
        },
        SetWaterMarkText(text1, text2){
            this.text1 = text1
            this.text2 = text2

        }
    },
    computed : {

        GetMphButton(){
            return this.selectSpeedUnit == 'mph' ? '<div  class="speedometerButtonActive">MPH</div>' : '<div @click=`SetSelectSpeedUnit(`mph`)` class="speedometerButton">MPH</div>'
        },
        GetKmhButton(){
            return this.selectSpeedUnit == 'kmh' ? '<div class="speedometerButtonActive">KMH</div>' : '<div class="speedometerButton">KMH</div>'

        },
        GetSpeed(){
            if(this.speed.length >= 3){
                return `<span class="activeSpeed">${this.speed}</span>`
            }else if(this.speed.length == 2){
                return `<span class="lightSpeed">0</span><span class="activeSpeed">${this.speed}</span>`
            }else if(this.speed.length == 1 && this.speed != 0){
                return `<span class="lightSpeed">00</span><span class="activeSpeed">${this.speed}</span>`
            }else{
                return `<span class="lightSpeed">000</span>`

            }
        },
        style () {
            return { transform: 'translate(-50%, -95%) rotate('+this.indicatorDegree+'deg)'}
        }
    },
    mounted(){
        
    

    }
})


if(app.DisplayRealTime){
    let interval = setInterval(() =>{
        const date = new Date();
        var dateD = date.getFullYear()+'.'+(date.getMonth()+1)+'.'+date.getDate();
        let minutes = date.getMinutes()
        let seconds = date.getSeconds()
        if(minutes < 10){
            minutes = "0"+minutes
        }
        if(seconds < 10){
            seconds = "0"+seconds
        }
        if(!app.DisplayRealTime){
            clearInterval(interval)
        }
        
        const time = date.getHours() + ":" + minutes + ":" +seconds;
        
        app.SetDate(time, dateD)
        
    }, 1000)
    const date = new Date();
    var dateD = date.getFullYear()+'.'+(date.getMonth()+1)+'.'+date.getDate();

    let minutes = date.getMinutes()
    let seconds = date.getSeconds()
    if(minutes < 10){
        minutes = "0"+minutes
    }
    if(seconds < 10){
        seconds = "0"+seconds
    }
    const time = date.getHours() + ":" + minutes + ":" +seconds;

    app.SetDate(time, dateD)
}

var bar
var fuel 

if(document.querySelector('#path-2')){
    bar = new ProgressBar.Path('#path-2', {
        easing: 'easeInOut',
    
        duration: 150
    });
    bar.set(1);
}
if(document.querySelector('#fuel')){
    fuel = new ProgressBar.Path('#fuel', {
        easing: 'easeInOut',
        duration: 150
    });
    fuel.set(1);
}

window.addEventListener("message", function (event) {
    var item = event.data;
    switch (item.type) {

        case "speed_update":
            let rpm = item.rpm;
            if(bar){
                if(item.speed >= 240){
                    bar.animate(240/550)
            
                }else{
                    if(item.speed >= 100){
                        bar.animate(item.speed/550)
                    }else{
                        bar.animate(item.speed/500)
                    }        
                }
       
            }else{
                if(document.querySelector('#path-2')){
                    bar = new ProgressBar.Path('#path-2', {
                        easing: 'easeInOut',
                    
                        duration: 150
                    });
                    bar.set(1);
                }
            }
            
            app.SetIndicatorDegree(item.speed, rpm)
            break
        case "fuel_update":
            if(fuel){
                fuel.animate(item.fuel/100)

            }else{
                if(document.querySelector('#fuel')){
                    fuel = new ProgressBar.Path('#fuel', {
                        easing: 'easeInOut',
                        duration: 150
                    });
                    fuel.set(1);
                }
            }
            app.SetFuel(item.fuel.toFixed(0))
            break
        case "open_hudsettings":
            app.SetHudSettingsVisibilty(true)
            break 
        case "show_speedometer":

            app.SetSpeedometerVisibility(true, item.displayOnWalk)
           
            break
        case "hide_speedometer":
     
            app.SetSpeedometerVisibility(false, item.displayOnWalk)
            break
        case "set_status":

            app.SetStatusData(item.statustype, item.value)
            break
        case "update_settings":
            app.UpdateSettings(item.val)
            break
        case "set_id":
            app.SetId(item.value)
            break
        case "update_bank":
            app.SetBankMoney(item.money)
            break
        case "update_money":
            app.SetCash(item.money)
            break      
        case "watermark_text":
            app.SetWaterMarkText(item.text1, item.text2)
            break
        case "on_added_money":
            app.OnAddedMoney(item.amount, item.minus, item.moneyType)
            break
        case "location_update":
            app.LocationUpdate(item.street, item.zone, item.heading)
            break
        case "UseStress":
            app.UseStress(item.value)
            break
        case "DisplayRealTime":
            
            app.SetDisplayRealTime(item.value)
            break
        case "clock_update":
            const date = new Date();
            var dateD = date.getFullYear()+'.'+(date.getMonth()+1)+'.'+date.getDate();
            app.SetDate(item.hours+":"+ item.minutes, dateD)
            break
        case "toggle_cruise":
            app.ToggleCruise(item.toggle)
            break
        case "toggle_engine":
            app.ToggleEngine(item.toggle)
            break
        case "update_seatbelt":
            app.UpdateSeatbelt(item.toggle)
            break
        case "unbuckle":
            const unbuckle = document.querySelector('#unbuckle')
            unbuckle.volume = event.data.volume;
            unbuckle.play();
            break;
        case "buckle":
            const buckle = document.querySelector('#buckle')
            buckle.volume = event.data.volume;
            buckle.play();
            break;
        case "update_ligths":
            app.UpdateLights(item.state)
            break
        case "set_locales":
            app.SetLocales(item.value)
            break
        case "set_force_hide": 
            app.SetForceHide(item.value)
            break
        case "update_job":
            app.UpdateJob(item.joblabel, item.grade_label)
            break
        case "update_parachute":
            app.UpdateParachute(item.val)
            break
        case "update_altitude":
            app.UpdateAltitude(item.val)
            break  
        case "set_watermarkhud":
            app.SetWaterMarkHud(item.value)
            break
        case "set_useNitro":
            app.SetUseNitro(item.value)
            break
        case "set_DateDisplay":
            app.SetDateDisplay(item.value)
            break
        case "set_cruiseDisplay":
            app.SetCruiseDisplay(item.value)
            break
        case "set_seatbeltDisplay":
            app.SetSeatbeltDisplay(item.value)
            break            
        default:
            break

    }
})

const handleEsc = (event) => {
    if (event.keyCode === 27) {
     app.ExitSettings()
   }
 };
 window.addEventListener('keydown', handleEsc);

