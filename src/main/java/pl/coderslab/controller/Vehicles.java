package pl.coderslab.controller;

import pl.coderslab.dao.VehicleDao;
import pl.coderslab.model.Vehicle;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/vehicles")
public class Vehicles extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        List<Vehicle> vehicles = VehicleDao.loadAll();

        req.setAttribute("vehicles", vehicles);

        req.getRequestDispatcher("WEB-INF/views/vehicles.jsp").forward(req, resp);

    }
}
