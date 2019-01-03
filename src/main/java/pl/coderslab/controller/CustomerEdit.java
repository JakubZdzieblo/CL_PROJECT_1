package pl.coderslab.controller;

import pl.coderslab.dao.CustomerDao;
import pl.coderslab.model.Customer;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

@WebServlet("/customer-edit")
public class CustomerEdit extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        int id = Integer.parseInt(req.getParameter("id"));

        Customer customer = CustomerDao.getById(id);

        req.setAttribute("customer", customer);

        req.getRequestDispatcher("WEB-INF/views/customer_edit.jsp").forward(req, resp);

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        int id = Integer.parseInt(req.getParameter("id"));
        String firstName = req.getParameter("firstName");
        String name = req.getParameter("name");
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        LocalDate birthdate = LocalDate.parse(req.getParameter("birthdate"), formatter);

        Customer customer = new Customer();

        customer.setId(id);
        customer.setFirstName(firstName);
        customer.setName(name);
        customer.setBirthdate(birthdate);

        CustomerDao.save(customer);

        resp.sendRedirect("/customers");

    }
}
