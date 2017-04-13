using Toybox.Application as App;
using Toybox.System as Sys;



class WorldClockApp extends App.AppBase {

    function initialize() {
        AppBase.initialize();
        System.println("Initialized");
    }


    function onStart(state) {
    }
    

    function getInitialView() {
        return [ new WorldClockView() ];
    }
    
    
    function onStop(state) {
    }

}