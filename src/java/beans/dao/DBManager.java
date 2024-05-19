package beans.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import beans.model.Order;
import beans.model.Product;

public class DBManager extends DB {
    // Method to create an order
    public void createOrder(Order order) {
        String sql = "INSERT INTO orders (orderId, orderDate, total, userId) VALUES (?, ?, ?, ?)";
        try (Connection conn = getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, order.getOrderId());
            stmt.setDate(2, order.getOrderDate());
            stmt.setString(3, order.getTotal());
            stmt.setString(4, order.getUserId());
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // Method to get an order by ID
    public Order getOrder(String orderId) {
        Order order = null;
        String sql = "SELECT * FROM orders WHERE orderId = ?";
        try (Connection conn = getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, orderId);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                order = new Order();
                order.setOrderId(rs.getString("orderId"));
                order.setOrderDate(rs.getDate("orderDate"));
                order.setTotal(rs.getString("total"));
                order.setUserId(rs.getString("userId"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return order;
    }

    // Method to get all orders
    public List<Order> getOrders() {
        List<Order> orders = new ArrayList<>();
        String sql = "SELECT * FROM orders";
        try (Connection conn = getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                Order order = new Order();
                order.setOrderId(rs.getString("orderId"));
                order.setOrderDate(rs.getDate("orderDate"));
                order.setTotal(rs.getString("total"));
                order.setUserId(rs.getString("userId"));
                orders.add(order);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return orders;
    }

    // Method to update an order
    public void updateOrder(Order order) {
        String sql = "UPDATE orders SET orderDate = ?, total = ?, userId = ? WHERE orderId = ?";
        try (Connection conn = getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setDate(1, order.getOrderDate());
            stmt.setString(2, order.getTotal());
            stmt.setString(3, order.getUserId());
            stmt.setString(4, order.getOrderId());
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // Method to delete an order
    public void deleteOrder(String orderId) {
        String sql = "DELETE FROM orders WHERE orderId = ?";
        try (Connection conn = getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, orderId);
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // Method to get orders by user ID
    public List<Order> getOrdersByUser(String userId) {
        List<Order> orders = new ArrayList<>();
        String sql = "SELECT * FROM orders WHERE userId = ?";
        try (Connection conn = getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, userId);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                Order order = new Order();
                order.setOrderId(rs.getString("orderId"));
                order.setOrderDate(rs.getDate("orderDate"));
                order.setTotal(rs.getString("total"));
                order.setUserId(rs.getString("userId"));
                orders.add(order);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return orders;
    }

    // Method to get all products
    public List<Product> getProducts() {
        List<Product> products = new ArrayList<>();
        String sql = "SELECT * FROM products";
        try (Connection conn = getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                Product product = new Product();
                product.setProductId(rs.getInt("productId"));
                product.setProductName(rs.getString("productName"));
                product.setPrice(rs.getDouble("price"));
                product.setStock(rs.getInt("stock"));
                products.add(product);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return products;
    }
}
