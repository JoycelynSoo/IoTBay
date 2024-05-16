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
import java.sql.Timestamp;

public class LogoutServlet extends HttpServlet {
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
                    session.setAttribute("user", user);
                    logoutAccess(email); 
                    //invalidate session to log user out
                    session.invalidate();
                    response.sendRedirect("logout.jsp");
               
            //handles any exceptions that may occur whe executing the try block 
            } catch (SQLException | ClassNotFoundException ex) {
                Logger.getLogger(LogoutServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
   
    
    private void logoutAccess (String email) throws ServletException, IOException, ClassNotFoundException, SQLException {
        DBConnector connector = new DBConnector(); 
        Connection conn = connector.openConnection();
        DBManager db = new DBManager(conn);
        try {
            db.insertLogoutTime(email, new Timestamp(System.currentTimeMillis()));
        } catch (SQLException ex) {
            Logger.getLogger(LogoutServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
