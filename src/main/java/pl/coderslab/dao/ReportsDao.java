package pl.coderslab.dao;

import pl.coderslab.service.DBService;

import java.sql.SQLException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

public class ReportsDao {

    public static List<String[]> workHours(LocalDate start, LocalDate end) {

        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        String startDate = start.format(formatter);
        String endDate = end.format(formatter);
        String query = "select employee_id, sum(work_hours) from orders where acceptance between ? and ? group by employee_id;";
        List<String[]> result = new ArrayList<>();

        String[] params = {startDate, endDate};
        try {
            result = DBService.getData(query, params);
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return result;

    }

    public static List<String[]> profitReport(LocalDate start, LocalDate end) {

        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        String startDate = start.format(formatter);
        String endDate = end.format(formatter);

        String query = "select o.id, o.service_end, o.service_cost, o.parts_cost, o.work_hours, e.hour_cost " +
                "from orders o join employees e on o.employee_id = e.id where service_end between ? and ?;";

        List<String[]> result = new ArrayList<>();
        String[] params = {startDate, endDate};
        try {
            result = DBService.getData(query, params);
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return result;
    }

}
