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

public class UpdateServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Validator validator = new Validator();
        //retrieves the information user has inputted in register.jsp
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String dob = request.getParameter("dob");
        User user = new User(firstName, lastName, email, dob, password);
        
        //clears and resets error messages stored in the session
        validator.clear(session);
        
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
            DBManager manager = new DBManager(conn);

            if (user != null) {
            session.setAttribute("user", user);
            manager.updateUser(firstName, lastName, email, dob, password);
            session.setAttribute("updated", "Update was successful");
            request.getRequestDispatcher("edit.jsp").forward(request, response);
            } else {
                session.setAttribute("updated", "Update was not successful");
                request.getRequestDispatcher("edit.jsp").forward(request, response);
            }
        } catch (SQLException ex) {
            Logger.getLogger(UpdateServlet.class.getName()).log(Level.SEVERE, null, ex);
            response.sendRedirect("edit.jsp");
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(UpdateServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    }
}
