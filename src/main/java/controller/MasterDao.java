package controller;

//数据库连接DAO类

import model.Master;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class MasterDao {
    final String URL = "jdbc:mysql://localhost:3306/umr";
    final String USER = "root";
    final String PWD = "yswysyydxj";
    Connection connection;

    PreparedStatement preparedStatement;
    ResultSet resultSet;
    List<Master> list = new ArrayList<>();

    public Connection getConnection() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        try {
            connection = DriverManager.getConnection(URL, USER, PWD);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return connection;

    }

    public List<Master> selectAll() {

        //限制7条数据
        String selectAll = "select * from masterpet limit 7";
        System.out.println(selectAll);
        try {
            preparedStatement = connection.prepareStatement(selectAll);
            resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                Master master = new Master();
                master.setMasterId(resultSet.getInt("masterId"));
                master.setMasterName(resultSet.getString("masterName"));
                master.setMasterAge(resultSet.getInt("masterAge"));
                master.setMasterSex(resultSet.getString("masterSex"));
                list.add(master);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                resultSet.close();
                preparedStatement.close();
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return list;

    }

    public List<Master> selectName(String masterName) {
        String select = "select * from masterpet where masterName=?";
        try {
            String sql = "SELECT * FROM masterpet where masterName=? order by masterId";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, masterName);
            System.out.println(select+masterName);
            resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                Master master = new Master();
                master.setMasterId(resultSet.getInt("masterId"));
                master.setMasterName(resultSet.getString("masterName"));
                master.setMasterAge(resultSet.getInt("masterAge"));
                master.setMasterSex(resultSet.getString("masterSex"));
                list.add(master);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                resultSet.close();
                preparedStatement.close();
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return list;
    }


    public int insert(int masterId, String masterName, int masterAge, String masterSex) {
        String sql = "insert into masterpet (masterId,masterName,masterAge,masterSex) values(?,?,?,?) ";
        int i = 0;
        try {

            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, masterId);
            preparedStatement.setString(2, masterName);
            preparedStatement.setInt(3, masterAge);
            preparedStatement.setString(4, masterSex);
            //System.out.println(id);
            i = preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                preparedStatement.close();
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }

        }
        System.out.println(sql);
        return i;
    }

    public int delete(int masterId) {
        String sql = "delete  FROM masterpet where masterId=?";
        int i = 0;
        try {
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, masterId);
            i = preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                preparedStatement.close();
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }

        }
        System.out.println("delete  FROM masterpet where masterId="+masterId);
        return i;

    }

    public int update(String masterName, int masterAge, String masterSex, int masterId) {
        String sql = "update masterpet set masterName=?,masterAge=?,masterSex=? where masterId=?";
        int i = 0;
        try {
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, masterName);
            preparedStatement.setInt(2, masterAge);
            preparedStatement.setString(3, masterSex);
            preparedStatement.setInt(4, masterId);
            i = preparedStatement.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                preparedStatement.close();
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }

        }
        System.out.println(sql);
        return i;
    }
}