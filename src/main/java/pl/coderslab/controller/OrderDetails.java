package pl.coderslab.controller;

import pl.coderslab.dao.CustomerDao;
import pl.coderslab.dao.EmployeeDao;
import pl.coderslab.dao.OrderDao;
import pl.coderslab.dao.VehicleDao;
import pl.coderslab.model.Customer;
import pl.coderslab.model.Employee;
import pl.coderslab.model.Order;
import pl.coderslab.model.Vehicle;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/order-details")
public class OrderDetails extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        int id = Integer.parseInt(req.getParameter("id"));

        Order order = OrderDao.getById(id);

        Vehicle vehicle = VehicleDao.getById(order.getVehicleId());

        Employee employee = EmployeeDao.getById(order.getEmployeeId());

        Customer customer = CustomerDao.getById(vehicle.getCustomer_id());

        req.setAttribute("order", order);
        req.setAttribute("vehicle", vehicle);
        req.setAttribute("employee", employee);
        req.setAttribute("customer", customer);

        req.getRequestDispatcher("WEB-INF/views/order_details.jsp").forward(req, resp);


    }
}
