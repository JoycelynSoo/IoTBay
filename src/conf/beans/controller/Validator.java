package beans.controller;

import java.io.Serializable;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import javax.servlet.http.HttpSession;

public class Validator implements Serializable {
    
    private final String shipmentIdPattern = "\\d{3}";

    public Validator() {}

    public boolean validateShipmentId(String shipmentId) {
        Pattern regEx = Pattern.compile(shipmentIdPattern);
        Matcher match = regEx.matcher(shipmentId);
        return match.matches();
    }

    public void clear(HttpSession session) {
        session.setAttribute("shipmentIdErr", "Shipment ID does not exist");
    }
}
