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
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;

@WebServlet("/vehicle-add")
public class VehicleAdd extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        List<Customer> customers = CustomerDao.loadAll();
        req.setAttribute("customers", customers);
        req.getRequestDispatcher("WEB-INF/views/vehicle_add.jsp").forward(req, resp);

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        int customer_id = Integer.parseInt(req.getParameter("customer_id"));
        String make = req.getParameter("make");
        String model = req.getParameter("model");
        int year = Integer.parseInt(req.getParameter("year"));
        String registration = req.getParameter("registration");
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        LocalDate nextInspection = LocalDate.parse(req.getParameter("nextInspection"), formatter);

        Vehicle vehicle = new Vehicle();

        vehicle.setId(0);
        vehicle.setCustomer_id(customer_id);
        vehicle.setMake(make);
        vehicle.setModel(model);
        vehicle.setYear(year);
        vehicle.setRegistration(registration);
        vehicle.setNextInspection(nextInspection);

        VehicleDao.save(vehicle);

        resp.sendRedirect("/vehicles");
    }
}
