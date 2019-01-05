package pl.coderslab.dao;

import pl.coderslab.model.Order;
import pl.coderslab.service.DBService;

import java.sql.SQLException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

public class OrderDao {



    public static List<Order> loadByCustomerId(int id) {

        String query = "select o.* from orders o join vehicles v on o.vehicle_id = v.id where v.customer_id=?;";

        String[] params = {String.valueOf(id)};

        List<Order> result = new ArrayList<>();

        loadDataToList(query, params, result);

        return result;

    }

    private static void loadDataToList(String query, String[] params, List<Order> result) {
        try {
            List<String[]> data = DBService.getData(query, params);

            for (String[] row : data) {
                Order order = createSingleOrderObject(row);
                result.add(order);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static List<Order> loadByStatus(String status) {

        String query = "select * from `orders` where `status`=?;";

        String[] params = {status};

        List<Order> result = new ArrayList<>();

        loadDataToList(query, params, result);

        return result;

    }

    public static List<Order> loadByVehicleId(int id) {

        String query = "select * from `orders` where `vehicle_id`=?;";

        String[] params = {String.valueOf(id)};

        List<Order> result = new ArrayList<>();

        loadDataToList(query, params, result);

        return result;

    }

    public static List<Order> loadByEmployeeId(int id) {

        String query = "select * from `orders` where `employee_id`=?;";

        String[] params = {String.valueOf(id)};

        List<Order> result = new ArrayList<>();

        loadDataToList(query, params, result);

        return result;

    }


    public static void save(Order order){

        if(order.getId() == 0){
            addToDb(order);
        }else{
            updateInDb(order);
        }

    }


    public static Order getById(int id){
        String query = "select * from `orders` where id=?;";
        String[] params = new String[1];
        params[0] = String.valueOf(id);

        return getSingleData(query, params);
    }

    public static List<Order> loadAll(){
        String query = "Select * from `orders`;";

        //prepare list for data from DB
        List<Order> result = new ArrayList<>();

        loadDataToList(query, null, result);

        return result;
    }


    private static void addToDb(Order order){

        String query = "insert into `orders` " +
                "    (acceptance, planned_service_start, actual_service_start, service_end, employee_id, problem_desc, " +
                "service_desc, status, vehicle_id, service_cost, parts_cost, work_hours) " +
                "values (?,?,?,?,?,?,?,?,?,?,?,?);";
        String[] params = new String[12];
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        params[0] = order.getAcceptanceDate().format(formatter);
        params[1] = order.getPlannedServiceStartDate().format(formatter);
        params[2] = order.getActualServiceStartDate().format(formatter);
        params[3] = order.getServiceEndDate().format(formatter);
        params[4] = String.valueOf(order.getEmployeeId());
        params[5] = order.getProblemDescription();
        params[6] = order.getServiceDescription();
        params[7] = order.getStatus();
        params[8] = String.valueOf(order.getVehicleId());
        params[9] = String.valueOf(order.getServiceCost());
        params[10] = String.valueOf(order.getPartsCost());
        params[11] = String.valueOf(order.getWorkHours());

        try {
            int newId = DBService.executeInsert(query, params);
            order.setId(newId);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private static void updateInDb(Order order){

        String query = "update orders set acceptance=?, planned_service_start=?, actual_service_start=?, " +
                "                  service_end=?, employee_id=?, problem_desc=?, service_desc=?, " +
                "                  status=?, vehicle_id=?, service_cost=?, parts_cost=?, work_hours=? " +
                "where id=?;";

        String[] params = new String[13];
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        params[0] = order.getAcceptanceDate().format(formatter);
        params[1] = order.getPlannedServiceStartDate().format(formatter);
        params[2] = order.getActualServiceStartDate().format(formatter);
        params[3] = order.getServiceEndDate().format(formatter);
        params[4] = String.valueOf(order.getEmployeeId());
        params[5] = order.getProblemDescription();
        params[6] = order.getServiceDescription();
        params[7] = order.getStatus();
        params[8] = String.valueOf(order.getVehicleId());
        params[9] = String.valueOf(order.getServiceCost());
        params[10] = String.valueOf(order.getPartsCost());
        params[11] = String.valueOf(order.getWorkHours());
        params[12] = String.valueOf(order.getId());

        try {
            DBService.executeQuery(query, params);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static void delete(Order order){
        String query = "Delete from `orders` where `id` = ?;";
        String[] params = new String[1];
        params[0] = String.valueOf(order.getId());

        try {
            DBService.executeQuery(query, params);
            order = null;
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static void delete(int id){
        Order order = getById(id);
        delete(order);
    }


    private static Order getSingleData(String query, String[] params) {
        try {
            List<String[]> data = DBService.getData(query, params);
            if (data.size() > 0) {
                String[] firstElement = data.get(0);
                return createSingleOrderObject(firstElement);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    private static Order createSingleOrderObject(String[] element) {

        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        int elId = Integer.valueOf(element[0]);
        LocalDate elAcceptanceDate = null;
        LocalDate elPlannedServiceDate = null;
        LocalDate elActualServiceDate = null;
        LocalDate elServiceEndDate = null;

        if (element[1] != null) {
            elAcceptanceDate = LocalDate.parse(element[1], formatter);
        }
        if (element[2] != null) {
            elPlannedServiceDate = LocalDate.parse(element[2], formatter);
        }
        if (element[3] != null) {
            elActualServiceDate = LocalDate.parse(element[3], formatter);
        }
        if (element[4] != null) {
            elServiceEndDate = LocalDate.parse(element[4], formatter);
        }

        int elEmployeId = Integer.parseInt(element[5]);
        String elProblemDesc = element[6];
        String elServiceDesc = element[7];
        String elStatus = element[8];
        int elVehicleId = Integer.parseInt(element[9]);
        double elServiceCost = Double.parseDouble(element[10]);
        double elpartsCost = Double.parseDouble(element[11]);
        double elWorkHours = Double.parseDouble(element[12]);


        Order order = new Order();
        order.setId(elId);
        order.setAcceptanceDate(elAcceptanceDate);
        order.setPlannedServiceStartDate(elPlannedServiceDate);
        order.setActualServiceStartDate(elActualServiceDate);
        order.setServiceEndDate(elServiceEndDate);
        order.setEmployeeId(elEmployeId);
        order.setProblemDescription(elProblemDesc);
        order.setServiceDescription(elServiceDesc);
        order.setStatus(elStatus);
        order.setVehicleId(elVehicleId);
        order.setServiceCost(elServiceCost);
        order.setPartsCost(elpartsCost);
        order.setWorkHours(elWorkHours);

        return order;
    }

}



