package pl.coderslab.controller;

import pl.coderslab.dao.EmployeeDao;
import pl.coderslab.model.Employee;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/employees")
public class Employees extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        List<Employee> employees = EmployeeDao.loadAll();

        req.setAttribute("employees", employees);

        req.getRequestDispatcher("WEB-INF/views/employees.jsp").forward(req, resp);

    }
}
