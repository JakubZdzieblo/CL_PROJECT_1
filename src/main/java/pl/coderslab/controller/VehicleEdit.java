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

@WebServlet("/vehicle-edit")
public class VehicleEdit extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        int id = Integer.parseInt(req.getParameter("id"));

        Vehicle vehicle = VehicleDao.getById(id);
        List<Customer> customers = CustomerDao.loadAll();
        req.setAttribute("customers", customers);
        req.setAttribute("vehicle", vehicle);

        req.getRequestDispatcher("WEB-INF/views/vehicle_edit.jsp").forward(req, resp);

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        int id = Integer.parseInt(req.getParameter("id"));
        int customer_id = Integer.parseInt(req.getParameter("customer_id"));
        String make = req.getParameter("make");
        String model = req.getParameter("model");
        int year = Integer.parseInt(req.getParameter("year"));
        String registration = req.getParameter("registration");
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        LocalDate nextInspection = LocalDate.parse(req.getParameter("nextInspection"), formatter);

        Vehicle vehicle = new Vehicle();

        vehicle.setId(id);
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
