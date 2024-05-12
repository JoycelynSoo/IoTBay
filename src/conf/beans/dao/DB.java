package beans.dao;
import java.sql.Connection;

public abstract class DB {
    
    protected String URL = "jdbc:derby://localhost:1527/";
    protected String db = "shipment";
    protected String dbuser = "root";
    protected String dbpass = "root";
    protected String driver = "org.apache.derby.client.ClientAutoloadedDriver";
    protected Connection conn; //connection null-instance to be initialized in sub-classes
}