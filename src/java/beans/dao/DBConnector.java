/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package beans.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnector extends DB {

    public DBConnector() throws ClassNotFoundException, SQLException { 
        Class.forName(driver); // Load the JDBC driver
        conn = DriverManager.getConnection(URL + db, dbuser, dbpass); // Establish connection to the database
    }

    public Connection openConnection() { 
        return this.conn; // Return the connection instance
    }

    public void closeConnection() throws SQLException { 
        if (this.conn != null && !this.conn.isClosed()) {
            this.conn.close(); // Close the connection if it is open
        }
    }

    public static void main(String[] args) {
        try {
            DBConnector dbConnector = new DBConnector();
            Connection connection = dbConnector.openConnection();
            System.out.println("Connected to the database");
            dbConnector.closeConnection();
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
    }
}