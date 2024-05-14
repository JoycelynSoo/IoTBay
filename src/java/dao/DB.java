package dao;
import java.sql.Connection;
import beans.*;

public abstract class DB {
    protected String URL = "jdbc:derby://localhost:1527/";
    protected String db = "staff";
    protected String dbuser = "root";
    protected String dbpass = "1234";
    protected String driver = "org.apache.derby.jdbc.ClientDriver";
    protected Connection conn; //connection null-instance to be initialized in sub-classes
}