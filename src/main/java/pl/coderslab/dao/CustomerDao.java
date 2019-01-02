package pl.coderslab.dao;

import pl.coderslab.model.Customer;
import pl.coderslab.service.DBService;

import java.sql.SQLException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

public class CustomerDao {

        public static void save(Customer customer){

            if(customer.getId() == 0){
                addToDb(customer);
            }else{
                updateInDb(customer);
            }

        }
//
//        public static List<Customer> loadAllByGroupId(int id){
//            String query = "select * from users where user_group_id=?";
//            String[] param = { String.valueOf(id) };
//            List<User> result = new ArrayList<>();
//
//            try {
//                List<String[]> data = DBService.getData(query, param);
//                for (String[] row : data) {
//                    result.add(createSingleCustomerObject(row));
//                }
//            } catch (SQLException e) {
//                e.printStackTrace();
//            }
//            return result;
//        }


        public static Customer getById(int id){
            String query = "select * from `customers` where id=?;";
            String[] params = new String[1];
            params[0] = String.valueOf(id);

            return getSingleData(query, params);
        }

        public static Customer getByUsername(String name){
            String query = "select * from `customers` where `name`='Wong';";
            String[] params = new String[1];
            params[0] = name;

            return getSingleData(query, params);
        }


        public static List<Customer> loadAll(){
            String query = "Select * from `customers`;";

            //prepare list for data from DB
            List<Customer> result = new ArrayList<>();

            try {
                List<String[]> data = DBService.getData(query, null);

                for(String[] row : data){
                    Customer customer = createSingleCustomerObject(row);
                    result.add(customer);
                }

            } catch (SQLException e) {
                e.printStackTrace();
            }

            return result;
        }


        private static void addToDb(Customer customer){

            String query = "Insert into `customers` Values (null,?,?,?);";
            String[] params = new String[3];
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
            params[0] = customer.getFirstName();
            params[1] = customer.getName();
            params[2] = customer.getBirthdate().format(formatter);

            try {
                int newId = DBService.executeInsert(query, params);
                customer.setId(newId);

            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        private static void updateInDb(Customer customer){

            String query = "update customers set " +
                    "`first_name`=?, `name`=?, `birth_date`=? where id=?;";

            String[] params = new String[4];
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
            params[0] = customer.getFirstName();
            params[1] = customer.getName();
            params[2] = customer.getBirthdate().format(formatter);
            params[3] = String.valueOf(customer.getId());

            try {
                DBService.executeQuery(query, params);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        public static void delete(Customer customer){
            String query = "Delete from `customers` where `id` = ?;";
            String[] params = new String[1];
            params[0] = String.valueOf(customer.getId());

            try {
                DBService.executeQuery(query, params);
                customer = null;
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        public static void delete(int id){
            Customer customer = getById(id);
            delete(customer);
        }


        private static Customer getSingleData(String query, String[] params) {
            try {
                List<String[]> data = DBService.getData(query, params);
                if (data.size() > 0) {
                    String[] firstElement = data.get(0);
                    return createSingleCustomerObject(firstElement);
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
            return null;
        }

        private static Customer createSingleCustomerObject(String[] element) {

            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
            int elementId = Integer.valueOf(element[0]);
            String elementFirstName = element[1];
            String elementName = element[2];
            LocalDate elementBirthDate = null;
            if (element[3] != null) {
                elementBirthDate = LocalDate.parse(element[3], formatter);
            }

            Customer customer = new Customer();
            customer.setId(elementId);
            customer.setFirstName(elementFirstName);
            customer.setName(elementName);
            customer.setBirthdate(elementBirthDate);

            return customer;
        }

    }



