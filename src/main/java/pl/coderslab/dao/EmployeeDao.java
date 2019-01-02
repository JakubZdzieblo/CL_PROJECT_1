package pl.coderslab.dao;

import pl.coderslab.model.Employee;
import pl.coderslab.service.DBService;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class EmployeeDao {

    public static void save(Employee employee){

        if(employee.getId() == 0){
            addToDb(employee);
        }else{
            updateInDb(employee);
        }

    }

    public static Employee getById(int id){
        String query = "select * from `employees` where id=?;";
        String[] params = new String[1];
        params[0] = String.valueOf(id);

        return getSingleData(query, params);
    }

    public static Employee getByEmployeeName(String name){
        String query = "select * from `employees` where `name`=?;";
        String[] params = new String[1];
        params[0] = name;

        return getSingleData(query, params);
    }


    public static List<Employee> loadAll(){
        String query = "Select * from `employees`;";

        //prepare list for data from DB
        List<Employee> result = new ArrayList<>();

        try {
            List<String[]> data = DBService.getData(query, null);

            for(String[] row : data){
                Employee employee = createSingleEmployeeObject(row);
                result.add(employee);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return result;
    }


    private static void addToDb(Employee employee){

        String query = "Insert into `employees` Values (null,?,?,?,?,?,?);";
        String[] params = new String[6];

        params[0] = employee.getFirstName();
        params[1] = employee.getName();
        params[2] = employee.getAddress();
        params[3] = employee.getPhone();
        params[4] = employee.getNote();
        params[5] = String.valueOf(employee.getHourCost());


        try {
            int newId = DBService.executeInsert(query, params);
            employee.setId(newId);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private static void updateInDb(Employee employee){

        String query = "update employees set " +
                "`first_name`=?, `name`=?, `address`=?, `phone`=?, " +
                "`note`=?, `hour_cost`=? where id=?";

        String[] params = new String[7];

        params[0] = employee.getFirstName();
        params[1] = employee.getName();
        params[2] = employee.getAddress();
        params[3] = employee.getPhone();
        params[4] = employee.getNote();
        params[5] = String.valueOf(employee.getHourCost());
        params[6] = String.valueOf(employee.getId());

        try {
            DBService.executeQuery(query, params);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static void delete(Employee employee){
        String query = "Delete from `employees` where `id` = ?;";
        String[] params = new String[1];
        params[0] = String.valueOf(employee.getId());

        try {
            DBService.executeQuery(query, params);
            employee = null;
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static void delete(int id){
        Employee employee = getById(id);
        delete(employee);
    }


    private static Employee getSingleData(String query, String[] params) {
        try {
            List<String[]> data = DBService.getData(query, params);
            if (data.size() > 0) {
                String[] firstElement = data.get(0);
                return createSingleEmployeeObject(firstElement);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    private static Employee createSingleEmployeeObject(String[] element) {

        int elementId = Integer.valueOf(element[0]);
        String elementFirstName = element[1];
        String elementName = element[2];
        String elementAddress = element[3];
        String elementPhone = element[4];
        String elementNote = element[5];
        Double elementHourCost = Double.parseDouble(element[6]);

        Employee employee = new Employee();

        employee.setId(elementId);
        employee.setFirstName(elementFirstName);
        employee.setName(elementName);
        employee.setAddress(elementAddress);
        employee.setPhone(elementPhone);
        employee.setNote(elementNote);
        employee.setHourCost(elementHourCost);

        return employee;
    }

}



