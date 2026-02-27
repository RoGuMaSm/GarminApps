import Toybox.Lang;
import Toybox.WatchUi;

class TesrCounterDelegate extends WatchUi.BehaviorDelegate {
    private var _view;
    private var _count = 0;

function initialize(view) {
        BehaviorDelegate.initialize();
        _view = view;
    }

        function onSelect() {
        _count++;
        _view.updateCount(_count);
        return true; // Tells the system we handled the input
    }

function onMenu() {
        var menu = new WatchUi.Menu2({:title=>"Settings"});
        menu.addItem(new WatchUi.MenuItem("Single Counter", null, "single", null));
        menu.addItem(new WatchUi.MenuItem("Double Counter", null, "double", null));
        
        // Push the menu on top of the current view
        WatchUi.pushView(menu, new TesrCounterMenuDelegate(), WatchUi.SLIDE_UP);
        return true;
    }

}
