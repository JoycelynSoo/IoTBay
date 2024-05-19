package beans.controller;

import java.io.IOException;
import java.util.ArrayList;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import beans.dao.StaffDAO;
import beans.Staff;

public class StaffServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public StaffServlet() {
        super();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        StaffDAO staffDao = new StaffDAO();
        ArrayList<Staff> staffList = staffDao.getStaff();

        request.setAttribute("staffList", staffList);
        request.getRequestDispatcher("/StaffView.jsp").forward(request, response);
    }
}