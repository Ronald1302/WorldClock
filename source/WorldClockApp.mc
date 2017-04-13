using Toybox.Application as App;


class WorldClockApp extends App.AppBase {

    function initialize() {
        AppBase.initialize();
    }


    function onStart(state) {
    }
    

    function getInitialView() {
        return [ new WorldClockView() ];
    }
    
    
    function onStop(state) {
    }

}