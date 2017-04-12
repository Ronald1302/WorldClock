using Toybox.Application as App;
using Toybox.System as Sys;
using Toybox.Lang as Lang;
using Toybox.Math as Math;
using Toybox.Timer as Timer;

class WorldClockApp extends App.AppBase {
	var TZ1 = 0;
	var TZ2 = 0;
	hidden var timer = new Timer.Timer();
	
	
	function printTime(time) {
		var hour = Math.floor(time/60) > 23 ? Math.floor(time/60)-24 : Math.floor(time/60);
		var minute = time % 60;
    	System.println(Lang.format("$1$:$2$", [hour.format("%.2i"), minute.format("%.2i")]));
	}
	
	
	function processTime() {
		var now = Sys.getClockTime();
    	var UTC = now.hour*60 + now.min - now.timeZoneOffset/60;

		System.print("UTC: ");
        printTime(UTC);
        
        System.print("Corrected (1): ");
        printTime(UTC+TZ1);
        
        System.print("Corrected (2): ");
        printTime(UTC+TZ2);
	}
	
	

    /*function initialize() {
        AppBase.initialize();
        System.println("Initialized");
    }*/


    function onStart(state) {
    	TZ1 = Application.getApp().getProperty("TZ1");
    	TZ2 = Application.getApp().getProperty("TZ2");
    	
    	processTime();
    	
    	timer.start(method(:processTime), 1000, true);
    	System.println("Started");
    }
    

    function getInitialView() {
        return [ new WorldClockView() ];
    }
    
    
    function onStop(state) {
    	System.println("Stopped");
    }

}