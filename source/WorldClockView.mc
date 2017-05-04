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
	var width = 0;
	
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
    	width = dc.getWidth();
    	
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
        var center = width/2;
        var sep = 1;
        var SizeSmall = 13;
        var SizeMedium = 14;
        var SizeLarge = 22;
        var LineSep = 11;
        
        // Set background
        dc.setColor(Gfx.COLOR_BLACK , Gfx.COLOR_BLACK);
        dc.fillRectangle(0, 0, dc.getWidth(), dc.getHeight());
        
        // Get current UTC time
        var now = Sys.getClockTime();
    	var UTC = now.hour*60 + now.min - now.timeZoneOffset/60;
    	
    	
    	// text TZ 1
    	var y = SizeMedium + sep;
    	dc.setColor(Gfx.COLOR_LT_GRAY, Gfx.COLOR_TRANSPARENT); 
        dc.drawText(center, y, Gfx.FONT_MEDIUM, TZ1_name, Gfx.TEXT_JUSTIFY_CENTER | Gfx.TEXT_JUSTIFY_VCENTER);
        
        // Time TZ1
        y += SizeMedium + sep + SizeLarge;
        dc.setColor(Gfx.COLOR_WHITE, Gfx.COLOR_TRANSPARENT);
        dc.drawText(center, y, Gfx.FONT_NUMBER_THAI_HOT, printTime(UTC+TZ1), Gfx.TEXT_JUSTIFY_CENTER | Gfx.TEXT_JUSTIFY_VCENTER);
        
        // Separator line
        y += SizeLarge + sep + LineSep;
        dc.setColor(Gfx.COLOR_DK_GRAY, Gfx.COLOR_TRANSPARENT); 
        dc.drawLine(10, y, width-10, y);
        
        // Text TZ2
        y += SizeMedium;
        dc.setColor(Gfx.COLOR_LT_GRAY, Gfx.COLOR_TRANSPARENT); 
        dc.drawText(center, y, Gfx.FONT_MEDIUM, TZ2_name, Gfx.TEXT_JUSTIFY_CENTER | Gfx.TEXT_JUSTIFY_VCENTER);
        
        // Time TZ2
        y += SizeMedium + sep + SizeLarge;
        dc.setColor(Gfx.COLOR_WHITE, Gfx.COLOR_TRANSPARENT);
        dc.drawText(center, y, Gfx.FONT_NUMBER_THAI_HOT, printTime(UTC+TZ2), Gfx.TEXT_JUSTIFY_CENTER | Gfx.TEXT_JUSTIFY_VCENTER);
        
        // Separator line
        y += SizeLarge + sep + LineSep;
        dc.setColor(Gfx.COLOR_DK_GRAY, Gfx.COLOR_TRANSPARENT); 
        dc.drawLine(10, y, width-10, y);
        
        // Current time
        y += sep + SizeSmall;
        dc.setColor(Gfx.COLOR_WHITE, Gfx.COLOR_TRANSPARENT); 
        dc.drawText(center, y, Gfx.FONT_NUMBER_MILD, Lang.format("$1$:$2$", [now.hour.format("%.2i"), now.min.format("%.2i")]), Gfx.TEXT_JUSTIFY_CENTER | Gfx.TEXT_JUSTIFY_VCENTER);        
    }


    function onHide() {
    	
    }

}
