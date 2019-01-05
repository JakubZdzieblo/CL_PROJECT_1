package pl.coderslab.controller;

import pl.coderslab.dao.OrderDao;
import pl.coderslab.dao.VehicleDao;
import pl.coderslab.model.Order;
import pl.coderslab.model.Vehicle;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/vehicle-details")
public class VehicleDetails extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        int id = Integer.parseInt(req.getParameter("id"));

        Vehicle vehicle = VehicleDao.getById(id);

        List<Order> orders = OrderDao.loadByVehicleId(id);

        req.setAttribute("vehicle", vehicle);
        req.setAttribute("orders", orders);

        req.getRequestDispatcher("WEB-INF/views/vehicle_details.jsp").forward(req, resp);

    }
}
