package pl.coderslab.service;

import java.sql.SQLException;

public class DBCreateTables {

    private static final String queryCustomers = "create table customers\n" +
            "(\n" +
            "  id         int auto_increment\n" +
            "    primary key,\n" +
            "  first_name varchar(50) not null,\n" +
            "  name       varchar(50) not null,\n" +
            "  birth_date date        null\n" +
            ");";

    private static final String queryEmployees = "create table employees\n" +
            "(\n" +
            "  id         int auto_increment\n" +
            "    primary key,\n" +
            "  first_name varchar(50)    not null,\n" +
            "  name       varchar(50)    not null,\n" +
            "  address    varchar(250)   null,\n" +
            "  phone      varchar(20)    null,\n" +
            "  note       varchar(250)   null,\n" +
            "  hour_cost  decimal(10, 2) null\n" +
            ");";

    private static final String queryOrders = "create table orders\n" +
            "(\n" +
            "  id                    int auto_increment\n" +
            "    primary key,\n" +
            "  acceptance            date                                                                 null,\n" +
            "  planned_service_start date                                                                 null,\n" +
            "  actual_service_start  date                                                                 null,\n" +
            "  service_end           date                                                                 null,\n" +
            "  employee_id           int                                                                  null,\n" +
            "  problem_desc          varchar(250)                                                         null,\n" +
            "  service_desc          varchar(250)                                                         null,\n" +
            "  status                enum ('car in', 'cost approved', 'in service', 'ready', 'cancelled') not null,\n" +
            "  vehicle_id            int                                                                  null,\n" +
            "  service_cost          decimal(10, 2)                                                       null,\n" +
            "  parts_cost            decimal(10, 2)                                                       null,\n" +
            "  work_hours            decimal(10, 2)                                                       null,\n" +
            "  constraint orders_employees__fk\n" +
            "  foreign key (employee_id) references employees (id),\n" +
            "  constraint orders_vehicles__fk\n" +
            "  foreign key (vehicle_id) references vehicles (id)\n" +
            ");";

    private static final String queryVehicles = "create table vehicles\n" +
            "(\n" +
            "  id              int auto_increment\n" +
            "    primary key,\n" +
            "  customer_id     int         null,\n" +
            "  make            varchar(50) null,\n" +
            "  year            smallint(6) null,\n" +
            "  model           varchar(50) null,\n" +
            "  registration    varchar(50) null,\n" +
            "  next_inspection date        null,\n" +
            "  constraint vehicles_customers__fk\n" +
            "  foreign key (customer_id) references customers (id)\n" +
            ");";


    public static void main(String[] args) {

        createTables();


    }

    public static void createTables(){
        createTable(queryCustomers);
        createTable(queryEmployees);
        createTable(queryOrders);
        createTable(queryVehicles);
    }

    private static void createTable(String query){
        try {
            DBService.executeQuery(query, null);
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

}
