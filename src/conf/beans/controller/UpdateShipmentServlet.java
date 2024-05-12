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

public class UpdateShipmentServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();

        String shipmentId = request.getParameter("shipmentId");
        String shipmentMethod = request.getParameter("shipmentMethod");
        String shipmentAddress = request.getParameter("shipmentAddress");
        
        try {
            DBConnector connector = new DBConnector();
            Connection conn = connector.openConnection();
            DBManager manager = new DBManager(conn);

            if (shipmentId != null && !shipmentId.isEmpty()) {
                manager.updateShipment(shipmentId, shipmentMethod, shipmentAddress);
                session.setAttribute("updated", "Update was successful");
            } else {
                session.setAttribute("updated", "Update was not successful");
            }

            request.getRequestDispatcher("updateShipment.jsp").forward(request, response);
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(UpdateShipmentServlet.class.getName()).log(Level.SEVERE, null, ex);
            response.sendRedirect("updateShipment.jsp");
        }
    }
}
