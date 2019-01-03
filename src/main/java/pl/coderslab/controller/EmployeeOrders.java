package pl.coderslab.controller;

import pl.coderslab.dao.EmployeeDao;
import pl.coderslab.dao.OrderDao;
import pl.coderslab.model.Employee;
import pl.coderslab.model.Order;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/employee-orders")
public class EmployeeOrders extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        int id = Integer.parseInt(req.getParameter("id"));

        List<Order> orders = OrderDao.loadByEmployeeId(id);
        Employee employee = EmployeeDao.getById(id);

        req.setAttribute("orders", orders);
        req.setAttribute("employee", employee);

        req.getRequestDispatcher("WEB-INF/views/orders_by_employee.jsp").forward(req, resp);

    }
}
