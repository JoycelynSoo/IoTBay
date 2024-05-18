package beans.controller;

import beans.Payment;
import beans.dao.DBConnector;
import beans.dao.DBManager;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;

public class AddPaymentServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Validator validator = new Validator();
        String nameOnCard = request.getParameter("paymentNameOnCard");
        String cardNumber = request.getParameter("paymentCardNumber");
        int expMonth = Integer.valueOf(request.getParameter("paymentExpiryMonth"));
        int expYear = Integer.valueOf(request.getParameter("paymentExpiryYear"));
        int cvv = Integer.valueOf(request.getParameter("paymentCVV"));
        double amount = Double.valueOf(request.getParameter("totalOrderAmount"));
        String paymentDate = request.getParameter("date"); 
        String email = "john.doe@example.com";  // FIX THIS -
        validator.clear(session);

        try {
            DBConnector connector = new DBConnector();
            Connection conn = connector.openConnection();
            DBManager db = new DBManager(conn);
                           
            db.addPayment(nameOnCard, cardNumber, expMonth, expYear, cvv, amount, paymentDate, email);
            Payment payment = new Payment(nameOnCard, cardNumber, expMonth, expYear, cvv, amount, paymentDate, email);
            session.setAttribute("payment", payment);
            request.getRequestDispatcher("payment1.jsp").forward(request, response);
        } catch (SQLException | NullPointerException | ClassNotFoundException ex) {
            // Handle database or class loading errors
            session.setAttribute("error", "An error occurred while processing your payment. Please try again.");
            Logger.getLogger(AddPaymentServlet.class.getName()).log(Level.SEVERE, null, ex);
            // Forward to payment.jsp with error message
            request.getRequestDispatcher("payment.jsp").forward(request, response);
        } catch (NumberFormatException e) {
            // Handle invalid number format errors
            session.setAttribute("error", "Invalid number format. Please check your input.");
            request.getRequestDispatcher("payment.jsp").forward(request, response);
        } 
    }
}
