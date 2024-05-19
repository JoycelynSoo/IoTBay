/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package beans.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author shruti
 */
public abstract class DB {
    protected String URL = "jdbc:derby://localhost:1527/";
    protected String db = "student";
    protected String dbuser = "root";
    protected String dbpass = "root";
    protected String driver = "org.apache.derby.client.ClientAutoloadedDriver";
    protected Connection conn; // connection null-instance to be initialized in sub-classes

    public DB() {
        try {
            Class.forName(driver);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    public Connection getConnection() throws SQLException {
        if (conn == null || conn.isClosed()) {
            conn = DriverManager.getConnection(URL + db, dbuser, dbpass);
        }
        return conn;
    }
}
