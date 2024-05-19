package beans.model;

import java.sql.Date;

public class Order {
    private String orderId;
    private Date orderDate;
    private String total;
    private String userId;

    public Order() {
    }

    public Order(String orderId, Date orderDate, String total, String userId) {
        this.orderId = orderId;
        this.orderDate = orderDate;
        this.total = total;
        this.userId = userId;
    }

    // Getters and Setters
    public String getOrderId() { return orderId; }
    public void setOrderId(String orderId) { this.orderId = orderId; }

    public Date getOrderDate() { return orderDate; }
    public void setOrderDate(Date orderDate) { this.orderDate = orderDate; }

    public String getTotal() { return total; }
    public void setTotal(String total) { this.total = total; }

    public String getUserId() { return userId; }
    public void setUserId(String userId) { this.userId = userId; }
}