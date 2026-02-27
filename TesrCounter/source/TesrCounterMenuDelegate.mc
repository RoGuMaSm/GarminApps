import Toybox.Lang;
import Toybox.System;
import Toybox.WatchUi;

class TesrCounterMenuDelegate extends WatchUi.MenuInputDelegate {

    function initialize() {
        MenuInputDelegate.initialize();
    }

    function onSelect(item) {
        if (item.getId().equals("single")) {
            var view = new TesrCounterView(); // Your 1st counter view
            var delegate = new TesrCounterDelegate(view);
            WatchUi.pushView(view, delegate, WatchUi.SLIDE_LEFT);
        } else if (item.getId().equals("double")) {
            var view = new TesrDoubleView(); // Your 2nd counter view
            var delegate = new TesrDoubleDelegate(view);
            WatchUi.pushView(view, delegate, WatchUi.SLIDE_LEFT);
        }
    }

}
