/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package beans;
import java.sql.Timestamp;

/**
 *
 * @author joycelyn.soo
 */
public class TimeStamp {
    Timestamp time; 

    public TimeStamp(Timestamp time) {
        this.time = time;
    }
    
    public TimeStamp() {}

    public Timestamp getTime() {
        return time;
    }

    public void setTime(Timestamp time) {
        this.time = time;
    }
    
    public void logoutBean() {
        this.time = null; 
    }
    
}

