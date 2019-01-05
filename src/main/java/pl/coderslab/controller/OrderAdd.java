package pl.coderslab.controller;

import pl.coderslab.dao.EmployeeDao;
import pl.coderslab.dao.OrderDao;
import pl.coderslab.dao.VehicleDao;
import pl.coderslab.model.Employee;
import pl.coderslab.model.Order;
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

@WebServlet("/order-add")
public class OrderAdd extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        List<Vehicle> vehicles = VehicleDao.loadAll();
        List<Employee> employees = EmployeeDao.loadAll();

        req.setAttribute("vehicles", vehicles);
        req.setAttribute("employees", employees);

        req.getRequestDispatcher("WEB-INF/views/order_add.jsp").forward(req, resp);

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");

        LocalDate acceptanceDate = LocalDate.parse(req.getParameter("acceptanceDate"), formatter);
        LocalDate plannedServiceStartDate = LocalDate.parse(req.getParameter("plannedServiceStartDate"), formatter);
        int employeeId = Integer.parseInt(req.getParameter("employeeId"));
        int vehicleId = Integer.parseInt(req.getParameter("vehicleId"));
        String problemDescription = req.getParameter("problemDescription");
        double serviceCost = Double.parseDouble(req.getParameter("serviceCost"));
        double partsCost = Double.parseDouble(req.getParameter("partsCost"));

        Order order = new Order();

        order.setId(0);
        order.setAcceptanceDate(acceptanceDate);
        order.setPlannedServiceStartDate(plannedServiceStartDate);
        order.setEmployeeId(employeeId);
        order.setProblemDescription(problemDescription);
        order.setServiceDescription("Not in service yet");
        order.setStatus("car in");
        order.setVehicleId(vehicleId);
        order.setServiceCost(serviceCost);
        order.setPartsCost(partsCost);
        order.setWorkHours(0);

        OrderDao.save(order);

        resp.sendRedirect("/orders");

    }
}
