package pl.coderslab.controller;

import pl.coderslab.dao.EmployeeDao;
import pl.coderslab.dao.ReportsDao;
import pl.coderslab.model.Employee;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;

@WebServlet("/reports")
public class Reports extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        req.getRequestDispatcher("WEB-INF/views/reports.jsp").forward(req, resp);

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        LocalDate startDate = LocalDate.parse(req.getParameter("startDate"), formatter);
        LocalDate endDate = LocalDate.parse(req.getParameter("endDate"), formatter);
        String report = req.getParameter("report");
        req.setAttribute("startDate", startDate);
        req.setAttribute("endDate", endDate);

        if (report.equals("workHoursReport")) {
            List<String[]> result = ReportsDao.workHours(startDate, endDate);
            for (String[] row : result) {
                int id = Integer.parseInt(row[0]);
                Employee employee = EmployeeDao.getById(id);
                row[0] = employee.getFirstName() + " " + employee.getName();
            }

            req.setAttribute("result", result);
            req.getRequestDispatcher("WEB-INF/views/report_work_hours.jsp").forward(req, resp);
        }

        if (report.equals("profitReport")) {

        }




    }
}
