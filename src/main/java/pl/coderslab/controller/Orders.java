package pl.coderslab.controller;

import pl.coderslab.dao.OrderDao;
import pl.coderslab.model.Order;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/orders")
public class Orders extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        List<Order> orders = OrderDao.loadAll();

        req.setAttribute("orders", orders);

        req.getRequestDispatcher("WEB-INF/views/orders.jsp").forward(req, resp);


    }
}
