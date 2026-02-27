import Toybox.Communications;
import Toybox.WatchUi;
import Toybox.Lang;
import Toybox.System;

class KdeConnectDelegate extends WatchUi.BehaviorDelegate {
    function initialize() {
        BehaviorDelegate.initialize();
    }

    function onSelect() as Boolean {
        sendKDECommand();
        return true;
    }
function sendKDECommand() as Void {
        var url = "http://127.0.0.1:5000/playpause"; 
        
        // In Garmin's API:
        // HTTP_METHOD_GET is 0
        // HTTP_RESPONSE_CONTENT_TYPE_JSON is 0
        var options = {
            :method => 0,
            :responseType => 0
        };

        // We use the full Toybox prefix to ensure no resolution errors
        Toybox.Communications.makeWebRequest(
            url, 
            null, 
            options, 
            method(:onReceive)
        );
    }

    function onReceive(responseCode as Number, data as Dictionary or String or Null) as Void {
        System.println("Response: " + responseCode);
    }
}