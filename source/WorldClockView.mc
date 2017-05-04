using Toybox.WatchUi as Ui;
using Toybox.Graphics as Gfx;
using Toybox.System as Sys;
using Toybox.Lang as Lang;
using Toybox.Math as Math;
using Toybox.Timer as Timer;

class WorldClockView extends Ui.View {
	var TZ1 = 0;
	var TZ2 = 0;
	var TZ1_name = "";
	var TZ2_name = "";
	
	function printTime(time) {
		var hour = Math.floor(time/60) > 23 ? Math.floor(time/60)-24 : Math.floor(time/60);
		var minute = time % 60;
		return Lang.format("$1$:$2$", [hour.format("%.2i"), minute.format("%.2i")]); 
	}
	

    function initialize() {
        View.initialize();
    }

    // Load your resources here
    function onLayout(dc) {
    	TZ1 = Application.getApp().getProperty("TZ1");
    	TZ2 = Application.getApp().getProperty("TZ2");
    	TZ1_name = Application.getApp().getProperty("TZ1name");
    	TZ2_name = Application.getApp().getProperty("TZ2name");
    }

    function onShow() {
    	
    }

    // Update the view
    function onUpdate(dc) {
        // Prepare some constants
        dc.clear();
        var width = dc.getWidth();
        var height = dc.getHeight();
        var center = width/2;
        var strOffset = 40;
        
        // Set background
        dc.setColor(Gfx.COLOR_BLACK , Gfx.COLOR_BLACK);
        dc.fillRectangle(0, 0, width, height);
        
        // Get current UTC time
        var now = Sys.getClockTime();
    	var UTC = now.hour*60 + now.min - now.timeZoneOffset/60;
    	    	
    	// Draw timezone 1
        var y = height * 0.25;
        dc.setColor(Gfx.COLOR_WHITE, Gfx.COLOR_BLACK);
        dc.drawText(center, y, Gfx.FONT_NUMBER_THAI_HOT, printTime(UTC+TZ1), Gfx.TEXT_JUSTIFY_CENTER | Gfx.TEXT_JUSTIFY_VCENTER);
        
        dc.setColor(Gfx.COLOR_LT_GRAY, Gfx.COLOR_BLACK); 
        dc.drawText(center, y-strOffset, Gfx.FONT_MEDIUM, TZ1_name, Gfx.TEXT_JUSTIFY_CENTER | Gfx.TEXT_JUSTIFY_VCENTER);
        
        // Draw timezone 2
        y = height * 0.75;
        dc.setColor(Gfx.COLOR_WHITE, Gfx.COLOR_BLACK);
        dc.drawText(center, y, Gfx.FONT_NUMBER_THAI_HOT, printTime(UTC+TZ2), Gfx.TEXT_JUSTIFY_CENTER | Gfx.TEXT_JUSTIFY_VCENTER);
        
        dc.setColor(Gfx.COLOR_LT_GRAY, Gfx.COLOR_BLACK); 
        dc.drawText(center, y-strOffset, Gfx.FONT_MEDIUM, TZ2_name, Gfx.TEXT_JUSTIFY_CENTER | Gfx.TEXT_JUSTIFY_VCENTER);
        
        dc.setColor(Gfx.COLOR_DK_GRAY, Gfx.COLOR_BLACK); 
        dc.drawLine(10, height/2, width-10, height/2);
    }


    function onHide() {
    	
    }

}
