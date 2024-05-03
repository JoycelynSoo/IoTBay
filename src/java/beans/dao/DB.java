/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package beans.dao;
import java.sql.Connection;



/**
 *
 * @author joycelyn.soo
 */

//creates connection with the specific database 
public abstract class DB {
    
    protected String URL = "jdbc:derby://localhost:1527/";
    protected String db = "student";
    protected String dbuser = "root";
    protected String dbpass = "root";
    protected String driver = "org.apache.derby.client.ClientAutoloadedDriver";
    protected Connection conn; //connection null-instance to be initialized in sub-classes
}
