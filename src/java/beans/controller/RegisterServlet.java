/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
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

public class RegisterServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Validator validator = new Validator();
        //retrieves the information user has inputted in register.jsp
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String dob = request.getParameter("dob");
        
        //clears and resets error messages stored in the session
        validator.clear(session);
        
        // if email or password is incorrect format, print error message 
        if (!validator.validateEmail(email)) {
            session.setAttribute("emailErr", "Error: Email format incorrect");
            request.getRequestDispatcher("register.jsp").include(request, response);
        } else if (!validator.validatePassword(password)) {
            session.setAttribute("passErr", "Error: Password format incorrect");
            request.getRequestDispatcher("register.jsp").include(request, response); 
        } else {
            try {
                DBConnector connector = new DBConnector();
                Connection conn = connector.openConnection();
                DBManager db = new DBManager(conn);
                
                //Finds user with specified email and password 
                User user = db.findUser(email, password);
                
                //if user is found in the database, then error message print. Else, add user to db and direct to welcome.jsp
                if (user != null) { 
                    session.setAttribute("existErr", "Email is already registered!"); 
                    request.getRequestDispatcher("register.jsp").include(request, response); 
                } else {
                    db.addUser(firstName, lastName, email, dob, password);
                    User createUser = new User(firstName, lastName, email, dob, password); 
                    logAccess(email);
                    session.setAttribute("user", createUser);
                    request.getRequestDispatcher("welcome.jsp").include(request, response); 
                }
                
                 //handles any exceptions that may occur whe executing the try block 
            } catch (SQLException | NullPointerException | ClassNotFoundException ex) {
                Logger.getLogger(RegisterServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }
   private void logAccess(String email) throws ServletException, IOException, ClassNotFoundException, SQLException {
        DBConnector connector = new DBConnector(); 
        Connection conn = connector.openConnection();
        DBManager db = new DBManager(conn);
        try {
            db.addLog(email, new Timestamp(System.currentTimeMillis()));
        } catch (SQLException ex) {
            Logger.getLogger(LoginServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
