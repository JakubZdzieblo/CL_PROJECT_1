package pl.coderslab.controller;

import pl.coderslab.dao.CustomerDao;
import pl.coderslab.dao.VehicleDao;
import pl.coderslab.model.Customer;
import pl.coderslab.model.Vehicle;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/customer-vehicles")
public class CustomerVehicles extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        int id = Integer.parseInt(req.getParameter("id"));

        List<Vehicle> vehicles = VehicleDao.loadAllByCustomerId(id);
        Customer customer = CustomerDao.getById(id);

        req.setAttribute("vehicles", vehicles);
        req.setAttribute("customer", customer);

        req.getRequestDispatcher("WEB-INF/views/customer_vehicles.jsp").forward(req, resp);

    }
}
