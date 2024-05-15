package beans.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import beans.User;
import beans.dao.DBConnector;
import beans.dao.DBManager;
import java.sql.Connection;

public class CancelRegistrationServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(); 
        Validator validator = new Validator(); 
        // Retrieve user information from session
        User user = (User) session.getAttribute("user");
        String email = user.getEmail();
        //clears and resets error messages stored in the session
        validator.clear(session); 
        
        // if email or password is incorrect format, print error message 
            try {
                DBConnector connector = new DBConnector(); 
                Connection conn = connector.openConnection();
                DBManager manager = new DBManager(conn);

                //if user is found in database, proceed to cancelRegistration page. Else, error message prints
                if (user != null) {
                    session.setAttribute("user", user);
                    manager.deleteUser(email);
                    //invalidate session to log user out
                    session.invalidate();
                    response.sendRedirect("cancelRegistration.jsp");
                } else {
                    session.setAttribute("existErr", "Cannot delete Account");
                    request.getRequestDispatcher("edit.jsp").include(request, response); 
                }
               
            //handles any exceptions that may occur whe executing the try block 
            } catch (SQLException ex) {
                Logger.getLogger(LoginServlet.class.getName()).log(Level.SEVERE, null, ex);
            } catch (ClassNotFoundException ex) {
            Logger.getLogger(CancelRegistrationServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        }
}
