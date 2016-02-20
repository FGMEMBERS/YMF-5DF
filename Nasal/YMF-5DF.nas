setprop("controls/gear/brake-parking",1);
setprop("instrumentation/fric-knob",0.01);
setprop("instrumentation/transponder/inputs/knob-mode",0);

setlistener("/consumables/fuel/tank-selector", func(sw){
         var pos = sw.getValue();
         #if(pos){setprop("consumables/fuel/tank[1]/selected",1)}else{setprop("consumables/fuel/tank/selected",1}
         setprop("/consumables/fuel/tank[0]/selected",0);
         setprop("/consumables/fuel/tank[1]/selected",0);
         setprop("/consumables/fuel/tank["~pos~"]/selected",1);
},1,0);

#controls.adjMixture = func {
#    var running = getprop("engines/engine[0]/running");
#    var onground = getprop("gears/gear[0]/wow");
#    if (onground and !running) {
#        adjEngControl("mixture", arg[0]);
#        var mixturelevel = getprop("/controls/engines/engine[0]/mixture");
#        print ("Mixture level (0~1): ",mixturelevel);
#    }
#    else print ("mixture can't be adjusted for now");
#}

#var startEngine = controls.startEngine;
controls.startEngine = func(v=1){
        setprop("controls/engines/engine/starter",0);
        var volts = getprop("systems/electrical/batt-volts");
	print("Starter Volts: ",volts);
	if (volts < 16) v=0;
        setprop("controls/engines/engine/starter",v);
	}




