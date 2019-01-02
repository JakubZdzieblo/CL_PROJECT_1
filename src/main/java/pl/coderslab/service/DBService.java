package pl.coderslab.service;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class DBService {


//    private static String dbUrl;
//    private final static String dbUser = "root";
//    private final static String dbPass = "coderslab";
//
//    private static void initParams(String dbName){
//        dbUrl = "jdbc:mysql://127.0.0.1:3306/"+dbName+"?useSSL=false&characterEncoding=UTF8&useOldAliasMetadataBehavior=true";
//    }

//    public static Connection getConnection(String dbName) throws SQLException {
//        initParams(dbName);
//        return DriverManager.getConnection(dbUrl, dbUser, dbPass);
//    }


    public static void executeUpdate(String query, String dbName) throws SQLException{

        executeQuery(query, null);
    }


    public static int executeInsert(String query, String[] params) throws Exception{

        try(Connection conn = DbUtil.getConn()){

            String generatedColumns[] = { "ID" };
            PreparedStatement st = conn.prepareStatement(query, generatedColumns);
            setParams(params, st);
            st.executeUpdate();
            ResultSet rs = st.getGeneratedKeys();
            if (rs.next()) {
                int id = rs.getInt(1);
                return id;
            }else{
                throw new Exception("No new id");
            }

        }catch (SQLException e){
            throw e;
        }

    }

    public static void executeQuery(String query, String[] params) throws SQLException{

        try(Connection conn = DbUtil.getConn()){

            PreparedStatement st = conn.prepareStatement(query);

            setParams(params, st);

            st.executeUpdate();


        }catch (SQLException e){
            throw e;
        }

    }

    public static List<String[]> getData(String query, String[] params) throws  SQLException{

        try(Connection conn = DbUtil.getConn()){

            PreparedStatement st = conn.prepareStatement(query);
            setParams(params, st);

            //execute preparestatement and get results
            ResultSet rs = st.executeQuery();

            //get informations about table ex. columns names, columns count
            ResultSetMetaData data = rs.getMetaData();

            //we create result LIST
            List<String[]> result = new ArrayList<>();

            while(rs.next()){

                String[] row = new String[data.getColumnCount()];

                //iterate over columns names and fill data to row array
                for(int i=1; i<=data.getColumnCount(); i++){
                    String currentColumnName = data.getColumnName(i);
                    row[i-1] = rs.getString(currentColumnName);
                }

                //we filled row array which add to resultList
                result.add(row);

            }

            return result;

        }catch (SQLException e){
            throw e;
        }
    }

    private static void setParams(String[] params, PreparedStatement st) throws SQLException {
        if (params != null) {
            int paramNumber = 1;
            for (String param : params) {
                st.setString(paramNumber, param);
                paramNumber++;
            }
        }
    }


}
