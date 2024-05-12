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
import beans.dao.DBConnector;
import beans.dao.DBManager;

public class DeleteShipmentServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(); 
        
        String shipmentId = request.getParameter("shipmentId");
        
        try {
            DBConnector connector = new DBConnector(); 
            Connection conn = connector.openConnection();
            DBManager manager = new DBManager(conn);

            if (shipmentId != null && !shipmentId.isEmpty()) {
                manager.deleteShipment(shipmentId);
                response.sendRedirect("deleteShipment.jsp");
            } else {
                session.setAttribute("existErr", "Cannot delete shipment without ID");
                request.getRequestDispatcher("editShipment.jsp").include(request, response); 
            }
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(DeleteShipmentServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
