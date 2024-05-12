package beans;

public class Shipment {
    private String shipmentId;
    private String orderId;
    private String shipmentMethod;
    private String shipmentDate;
    private String shipmentAddress;

    public Shipment(String shipmentId, String orderId, String shipmentMethod, String shipmentDate, String shipmentAddress) {
        this.shipmentId = shipmentId;
        this.orderId = orderId;
        this.shipmentMethod = shipmentMethod;
        this.shipmentDate = shipmentDate;
        this.shipmentAddress = shipmentAddress;
    }

    public String getShipmentId() {
        return shipmentId;
    }

    public void setShipmentId(String shipmentId) {
        this.shipmentId = shipmentId;
    }

    public String getOrderId() {
        return orderId;
    }

    public void setOrderId(String orderId) {
        this.orderId = orderId;
    }
    
    public String getShipmentMethod() {
        return shipmentMethod;
    }

    public void setShipmentMethod(String shipmentMethod) {
        this.shipmentMethod = shipmentMethod;
    }

    public String getShipmentDate() {
        return shipmentDate;
    }

    public void setShipmentDate(String shipmentDate) {
        this.shipmentDate = shipmentDate;
    }

    public String getShipmentAddress() {
        return shipmentAddress;
    }

    public void setShipmentAddress(String shipmentAddress) {
        this.shipmentAddress = shipmentAddress;
    }
}