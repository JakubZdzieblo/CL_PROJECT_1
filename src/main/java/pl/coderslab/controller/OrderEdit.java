package pl.coderslab.controller;

import pl.coderslab.dao.EmployeeDao;
import pl.coderslab.dao.OrderDao;
import pl.coderslab.dao.VehicleDao;
import pl.coderslab.model.Employee;
import pl.coderslab.model.Order;
import pl.coderslab.model.Status;
import pl.coderslab.model.Vehicle;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@WebServlet("/order-edit")
public class OrderEdit extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        int id = Integer.parseInt(req.getParameter("id"));

        List<Vehicle> vehicles = VehicleDao.loadAll();
        List<Employee> employees = EmployeeDao.loadAll();
        Order order = OrderDao.getById(id);
        String[] statusArray = Status.getStatuses();
        List<String> statuses = Arrays.asList(statusArray);

        req.setAttribute("vehicles", vehicles);
        req.setAttribute("employees", employees);
        req.setAttribute("order", order);
        req.setAttribute("statuses", statuses);

        req.getRequestDispatcher("WEB-INF/views/order_edit.jsp").forward(req, resp);

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {


        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");

        int id = Integer.parseInt(req.getParameter("id"));
        LocalDate acceptanceDate = LocalDate.parse(req.getParameter("acceptanceDate"), formatter);
        LocalDate plannedServiceStartDate = LocalDate.parse(req.getParameter("plannedServiceStartDate"), formatter);
        LocalDate actualStartDate = null;
        LocalDate serviceEndDate = null;
        String actualStartString = req.getParameter("actualServiceStartDate");
        String serviceEndString = req.getParameter("serviceEndDate");
        if (!actualStartString.isEmpty()) {
            actualStartDate = LocalDate.parse(actualStartString, formatter);
        }
        if (!serviceEndString.isEmpty()) {
            serviceEndDate = LocalDate.parse(serviceEndString, formatter);
        }
        int employeeId = Integer.parseInt(req.getParameter("employeeId"));
        int vehicleId = Integer.parseInt(req.getParameter("vehicleId"));
        String problemDescription = req.getParameter("problemDescription");
        String serviceDescription = req.getParameter("serviceDescription");
        String status = req.getParameter("status");
        double serviceCost = Double.parseDouble(req.getParameter("serviceCost"));
        double partsCost = Double.parseDouble(req.getParameter("partsCost"));
        double workHours = Double.parseDouble(req.getParameter("workHours"));

        Order order = new Order();

        order.setId(id);
        order.setAcceptanceDate(acceptanceDate);
        order.setPlannedServiceStartDate(plannedServiceStartDate);
        order.setActualServiceStartDate(actualStartDate);
        order.setServiceEndDate(serviceEndDate);
        order.setEmployeeId(employeeId);
        order.setProblemDescription(problemDescription);
        order.setServiceDescription(serviceDescription);
        order.setStatus(status);
        order.setVehicleId(vehicleId);
        order.setServiceCost(serviceCost);
        order.setPartsCost(partsCost);
        order.setWorkHours(workHours);

        OrderDao.save(order);

        resp.sendRedirect("/orders");


    }
}
