import Toybox.Graphics;
import Toybox.WatchUi;

class TesrDoubleView extends WatchUi.View {
    private var _countA = 0;
    private var _countB = 0;

    function initialize() {
        View.initialize();
    }

    function updateCounts(a, b) {
        _countA = a;
        _countB = b;
        WatchUi.requestUpdate();
    }

    function onUpdate(dc) {
        dc.setColor(Graphics.COLOR_BLACK, Graphics.COLOR_BLACK);
        dc.clear();

        var width = dc.getWidth();
        var height = dc.getHeight();

        // Draw a divider line
        dc.setColor(Graphics.COLOR_DK_GRAY, Graphics.COLOR_TRANSPARENT);
        dc.drawLine(width / 2, 40, width / 2, height - 40);

        // Draw Counter A (Left)
        dc.setColor(Graphics.COLOR_GREEN, Graphics.COLOR_TRANSPARENT);
        dc.drawText(width * 0.25, height / 2, Graphics.FONT_NUMBER_MEDIUM, _countA.toString(), Graphics.TEXT_JUSTIFY_CENTER | Graphics.TEXT_JUSTIFY_VCENTER);

        // Draw Counter B (Right)
        dc.setColor(Graphics.COLOR_BLUE, Graphics.COLOR_TRANSPARENT);
        dc.drawText(width * 0.75, height / 2, Graphics.FONT_NUMBER_MEDIUM, _countB.toString(), Graphics.TEXT_JUSTIFY_CENTER | Graphics.TEXT_JUSTIFY_VCENTER);
    }

}
