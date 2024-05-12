package beans.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import beans.Shipment;
import beans.dao.DBConnector;
import beans.dao.DBManager;

public class CreateShipmentServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Connection conn = null;

        String shipmentMethod = request.getParameter("shipmentMethod");
        String shipmentAddress = request.getParameter("shipmentAddress");
        
        try {
            DBConnector connector = new DBConnector();
            conn = connector.openConnection();
            DBManager db = new DBManager(conn);
            
            Shipment shipment = new Shipment(null, null, shipmentMethod, null, shipmentAddress);
            db.addShipment(shipment);
            
            response.sendRedirect("viewShipment.jsp");
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(CreateShipmentServlet.class.getName()).log(Level.SEVERE, null, ex);
            session.setAttribute("error", "An error occurred while processing the request");
            response.sendRedirect("viewShipment.jsp");
        } finally {
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException ex) {
                    Logger.getLogger(CreateShipmentServlet.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
    }
}
