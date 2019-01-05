package pl.coderslab.dao;

import pl.coderslab.model.Vehicle;
import pl.coderslab.service.DBService;

import java.sql.SQLException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

public class VehicleDao {

    public static void save(Vehicle vehicle){

        if(vehicle.getId() == 0){
            addToDb(vehicle);
        }else{
            updateInDb(vehicle);
        }

    }


    public static Vehicle getById(int id){
        String query = "select * from `vehicles` where id=?;";
        String[] params = new String[1];
        params[0] = String.valueOf(id);

        return getSingleData(query, params);
    }

    public static List<Vehicle> loadAll(){
        String query = "Select * from `vehicles`;";

        //prepare list for data from DB
        List<Vehicle> result = new ArrayList<>();

        loadDataToList(query, null, result);

        return result;
    }

    public static List<Vehicle> loadAllByCustomerId(int id){
        String query = "Select * from `vehicles` where `customer_id`=?;";

        String[] params = new String[1];
        params[0] = String.valueOf(id);
        List<Vehicle> result = new ArrayList<>();

        loadDataToList(query, params, result);

        return result;
    }

    private static void loadDataToList(String query, String[] params, List<Vehicle> result) {
        try {
            List<String[]> data = DBService.getData(query, params);

            for (String[] row : data) {
                Vehicle vehicle = createSingleVehicleObject(row);
                result.add(vehicle);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    private static void addToDb(Vehicle vehicle){

        String query = "Insert into `vehicles` Values (null,?,?,?,?,?,?);";
        String[] params = new String[6];
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        params[0] = String.valueOf(vehicle.getCustomer_id());
        params[1] = vehicle.getMake();
        params[2] = String.valueOf(vehicle.getYear());
        params[3] = vehicle.getModel();
        params[4] = vehicle.getRegistration();
        params[5] = vehicle.getNextInspection().format(formatter);

        try {
            int newId = DBService.executeInsert(query, params);
            vehicle.setId(newId);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private static void updateInDb(Vehicle vehicle){

        String query = "update vehicles set `customer_id`=?, `make`=?, `year`=?, `model`=?, " +
                "`registration`=?, `next_inspection`=? where id=?;";

        String[] params = new String[7];
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        params[0] = String.valueOf(vehicle.getCustomer_id());
        params[1] = vehicle.getMake();
        params[2] = String.valueOf(vehicle.getYear());
        params[3] = vehicle.getModel();
        params[4] = vehicle.getRegistration();
        params[5] = vehicle.getNextInspection().format(formatter);
        params[6] = String.valueOf(vehicle.getId());

        try {
            DBService.executeQuery(query, params);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static void delete(Vehicle vehicle){
        String query = "Delete from `vehicles` where `id` = ?;";
        String[] params = new String[1];
        params[0] = String.valueOf(vehicle.getId());

        try {
            DBService.executeQuery(query, params);
            vehicle = null;
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static void delete(int id){
        Vehicle vehicle = getById(id);
        delete(vehicle);
    }


    private static Vehicle getSingleData(String query, String[] params) {
        try {
            List<String[]> data = DBService.getData(query, params);
            if (data.size() > 0) {
                String[] firstElement = data.get(0);
                return createSingleVehicleObject(firstElement);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    private static Vehicle createSingleVehicleObject(String[] elem) {

        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");

        int elemId = Integer.valueOf(elem[0]);
        int elemCustomerId = Integer.valueOf(elem[1]);
        String elemMake = elem[2];
        int elemYear = Integer.parseInt(elem[3]);
        String elemModel = elem[4];
        String elemReg = elem[5];

        LocalDate elemInspection = null;
        if (elem[6] != null) {
            elemInspection = LocalDate.parse(elem[6], formatter);
        }

        Vehicle vehicle = new Vehicle();
        vehicle.setId(elemId);
        vehicle.setCustomer_id(elemCustomerId);
        vehicle.setMake(elemMake);
        vehicle.setYear(elemYear);
        vehicle.setModel(elemModel);
        vehicle.setRegistration(elemReg);
        vehicle.setNextInspection(elemInspection);

        return vehicle;
    }

}



