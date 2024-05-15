   package beans.controller;

   //add JAVA EE WEB 7 API LIBRARY
   import java.io.IOException;

   import java.sql.Connection;

   import java.sql.SQLException;

   import java.util.logging.Level;

   import java.util.logging.Logger;

   import jakarta.servlet.ServletException;

   import jakarta.servlet.http.HttpServlet;

   import jakarta.servlet.http.HttpServletRequest;

   import jakarta.servlet.http.HttpServletResponse;

   import jakarta.servlet.http.HttpSession;

   import beans.dao.*;

 

   public class ConnServlet extends HttpServlet {

       private DBConnector db;

       private DBManager manager;

       private Connection conn;

        

       @Override //Create and instance of DBConnector for the deployment session

       public void init() { //starts when index.jsp is loaded. It creates an instance of DBCONNECTOR from beans.dao

           try {

               db = new DBConnector(); //create database when app starts

           } catch (ClassNotFoundException | SQLException ex) {

               Logger.getLogger(ConnServlet.class.getName()).log(Level.SEVERE, null, ex);

           }      

       }

      

       @Override //Add the DBConnector, DBManager, Connection instances to the session

       protected void doGet(HttpServletRequest request, HttpServletResponse response)

               throws ServletException, IOException {
  

           response.setContentType("text/html;charset=UTF-8");       

           HttpSession session = request.getSession();

           conn = db.openConnection();     //create DB connection   

           try {

               manager = new DBManager(conn); //create db manager

           } catch (SQLException ex) {

               Logger.getLogger(ConnServlet.class.getName()).log(Level.SEVERE, null, ex);

           }

           //export the DB manager to the view-session (JSPs)

           session.setAttribute("manager", manager);           

       }   

        

       @Override //Destroy the servlet and release the resources of the application (terminate also the db connection)

        public void destroy() {

           try {

               db.closeConnection();

           } catch (SQLException ex) {

               Logger.getLogger(ConnServlet.class.getName()).log(Level.SEVERE, null, ex);

           }

       }

   }