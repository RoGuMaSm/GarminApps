import Toybox.Lang;
import Toybox.WatchUi;

class TesrDoubleDelegate extends WatchUi.BehaviorDelegate {
private var _view;
    private var _countA = 0;
    private var _countB = 0;

    function initialize(view) {
        BehaviorDelegate.initialize();
        _view = view;
    }

    // clickEvent contains the coordinates (x, y) of the touch
    function onTap(clickEvent) {
        var coords = clickEvent.getCoordinates();
        var screenWidth = System.getDeviceSettings().screenWidth;

        // Check if tap was on the left or right half of the screen
        if (coords[0] < (screenWidth / 2)) {
            _countA++;
        } else {
            _countB++;
        }

        _view.updateCounts(_countA, _countB);
        return true;
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
