package beans;
import java.sql.*;

public class Shipment {
    private int shipmentId;
    private String shipmentStatus;
    private String shipmentMethod;
    private Date shipmentDate;
    private String shipmentAddress;
        
    public Shipment(int shipmentId, String shipmentStatus, String shipmentMethod, Date shipmentDate, String shipmentAddress) {
        this.shipmentId = shipmentId;
        this.shipmentStatus = shipmentStatus;
        this.shipmentMethod = shipmentMethod;
        this.shipmentDate = shipmentDate;
        this.shipmentAddress = shipmentAddress;
    }

    public int getShipmentId() {
        return shipmentId;
    }

    public void setShipmentId(int shipmentId) {
        this.shipmentId = shipmentId;
    }
    
    public String getShipmentStatus() {
        return shipmentStatus;
    }

    public void setShipmentStatus(String shipmentStatus) {
        this.shipmentStatus = shipmentStatus;
    }
    
    public String getShipmentMethod() {
        return shipmentMethod;
    }

    public void setShipmentMethod(String shipmentMethod) {
        this.shipmentMethod = shipmentMethod;
    }

    public Date getShipmentDate() {
        return shipmentDate;
    }

    public void setShipmentDate(Date shipmentDate) {
        this.shipmentDate = shipmentDate;
    }

    public String getShipmentAddress() {
        return shipmentAddress;
    }

    public void setShipmentAddress(String shipmentAddress) {
        this.shipmentAddress = shipmentAddress;
    }
}