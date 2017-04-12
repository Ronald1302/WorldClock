using Toybox.Application as App;

class WorldClockApp extends App.AppBase {

    function initialize() {
        AppBase.initialize();
        System.println("Initialized");
    }

    function onStart(state) {
    	System.println("Started");
    }

    function getInitialView() {
        return [ new WorldClockView() ];
    }
    
    function onStop(state) {
    	System.println("Stopped");
    }

}