package beans.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import beans.dao.DBManager;
import beans.model.Order;
import beans.model.Product;

@WebServlet("/data")
public class ConnServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private DBManager dbManager;

    @Override
    public void init() throws ServletException {
        dbManager = new DBManager();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            List<Product> products = dbManager.getProducts();
            List<Order> orders = dbManager.getOrders();
            request.setAttribute("products", products);
            request.setAttribute("orders", orders);
            request.getRequestDispatcher("display.jsp").forward(request, response);
        } else if ("view".equals(action)) {
            viewOrder(request, response);
        } else if ("list".equals(action)) {
            listOrders(request, response);
        } else if ("history".equals(action)) {
            orderHistory(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if ("create".equals(action)) {
            createOrder(request, response);
        } else if ("update".equals(action)) {
            updateOrder(request, response);
        } else if ("delete".equals(action)) {
            deleteOrder(request, response);
        }
    }

    private void createOrder(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String orderId = request.getParameter("orderId");
        String orderDateStr = request.getParameter("orderDate");
        String total = request.getParameter("total");

        Date orderDate = Date.valueOf(orderDateStr);

        Order order = new Order();
        order.setOrderId(orderId);
        order.setOrderDate(orderDate);
        order.setTotal(total);

        dbManager.createOrder(order);

        response.sendRedirect("orderHistory.jsp");
    }

    private void updateOrder(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String orderId = request.getParameter("orderId");
        Date orderDate = Date.valueOf(request.getParameter("orderDate"));
        String total = request.getParameter("total");
        String userId = request.getParameter("userId");

        Order order = new Order(orderId, orderDate, total, userId);

        dbManager.updateOrder(order);
        response.sendRedirect("data?action=list");
    }

    private void deleteOrder(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String orderId = request.getParameter("orderId");
        dbManager.deleteOrder(orderId);
        response.sendRedirect("data?action=list");
    }

    private void viewOrder(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String orderId = request.getParameter("orderId");
        Order order = dbManager.getOrder(orderId);
        request.setAttribute("order", order);
        request.getRequestDispatcher("orderView.jsp").forward(request, response);
    }

    private void listOrders(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Order> orders = dbManager.getOrders();
        request.setAttribute("orders", orders);
        request.getRequestDispatcher("orderList.jsp").forward(request, response);
    }

    private void orderHistory(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String userId = request.getParameter("userId");
        List<Order> orders = dbManager.getOrdersByUser(userId);
        request.setAttribute("orders", orders);
        request.getRequestDispatcher("orderHistory.jsp").forward(request, response);
    }
}