/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package beans.dao;

/**
 *
 * @author joycelyn.soo
 */

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnector extends DB {

 

    public DBConnector() throws ClassNotFoundException, SQLException { //uses jdbc driver to build connection with database, IOTBay

        Class.forName(driver);

        conn = DriverManager.getConnection(URL+db, dbuser, dbpass);

    }



    public Connection openConnection(){ //RETURNS CONECTION TO BE USED IN dbmanager and execute sql 

        return this.conn;

    }



    public void closeConnection() throws SQLException { //close connection

        this.conn.close();

    }

}