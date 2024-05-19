package beans.controller;
import beans.Payment;
import beans.User;
import beans.dao.DBConnector;
import beans.dao.DBManager;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
 
public class EditPaymentServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Validator validator = new Validator();
        String nameOnCard = request.getParameter("paymentNameOnCard");
        String cardNumber = request.getParameter("paymentCardNumber");
        int expMonth = Integer.parseInt(request.getParameter("paymentExpiryMonth"));
        int expYear = Integer.parseInt(request.getParameter("paymentExpiryYear"));
        int cvv = Integer.parseInt(request.getParameter("paymentCVV"));
        //double amount = Double.parseDouble(request.getParameter("totalOrderAmount"));
        String paymentDate = request.getParameter("date"); 
         paymentDate = "test";
        User user = (User) session.getAttribute("user");
        String email = user.getEmail();
       
        Payment payment = (Payment) session.getAttribute("payment");
        double amount = payment.getAmount();
        validator.clear(session);
        try {
            DBConnector connector = new DBConnector();
            Connection conn = connector.openConnection();
            DBManager db = new DBManager(conn);
           session.setAttribute("payment", payment);
            db.editPayment(nameOnCard, cardNumber, expMonth, expYear, cvv, amount, paymentDate, email);
            payment = new Payment(nameOnCard, cardNumber, expMonth, expYear, cvv, amount, paymentDate, email);
            session.setAttribute("payment", payment);
            request.getRequestDispatcher("paymentfinalise.jsp").forward(request, response);
                    } catch (SQLException | NullPointerException | ClassNotFoundException ex) {
                        //handle database or class loading errors
                          session.setAttribute("error", "An error occurred while editing your payment. Please try again.");
                        Logger.getLogger(EditPaymentServlet.class.getName()).log(Level.SEVERE, null, ex);
                    // forward to paymentedit.jsp with error messages
                        request.getRequestDispatcher("paymentedit.jsp").forward(request, response);
                    } catch (NumberFormatException e) {
                            //handle invalid number format errors
                            session.setAttribute("error", "Invalid number format. Please check your input.");
                            request.getRequestDispatcher("paymentedit.jsp").forward(request,response);
 
            
                }

          }
}