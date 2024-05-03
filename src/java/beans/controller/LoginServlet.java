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

public class LoginServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(); 
        Validator validator = new Validator(); 
        //retrieves the email and password user has inputted in login.jsp
        String email = request.getParameter("email"); 
        String password = request.getParameter("password"); 
        
        //clears and resets error messages stored in the session
        validator.clear(session); 
        
        // if email or password is incorrect format, print error message 
        if (!validator.validateEmail(email)) { 
            session.setAttribute("emailErr", "Error: Email format incorrect");
            request.getRequestDispatcher("login.jsp").include(request, response); 
        } else if (!validator.validatePassword(password)) { 
            session.setAttribute("passErr", "Error: Password format incorrect");
            request.getRequestDispatcher("login.jsp").include(request, response); 
        } else {
            try {
                DBConnector connector = new DBConnector(); 
                Connection conn = connector.openConnection();
                DBManager db = new DBManager(conn);
                //Finds user with specified email and password 
                User user = db.findUser(email, password); 
                
                //if user is found in database, proceed to welcome page. Else, error message prints
                if (user != null) {
                    session.setAttribute("user", user);
                    request.getRequestDispatcher("welcome.jsp").include(request, response); 
                } else {
                    session.setAttribute("existErr", "User credentials are invalid!");
                    request.getRequestDispatcher("login.jsp").include(request, response); 
                }
               
            //handles any exceptions that may occur whe executing the try block 
            } catch (SQLException | NullPointerException | ClassNotFoundException ex) {
                Logger.getLogger(LoginServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }
}
