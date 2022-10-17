package model;

import com.alibaba.druid.pool.DruidDataSourceFactory;

import javax.sql.DataSource;
import java.io.FileInputStream;
import java.sql.*;
import java.util.Properties;

//封装访问数据库的JavaBean类
public class DBConnectionManager {
//    private String driverName = "com.mysql.cj.jdbc.Driver";
//    private String url = "jdbc:mysql://localhost:3306/umr?useSSL=false&&server Timezone=UTC&useUnicode=true&characterEncoding=gbk";
//    private String user = "root";
//    private String password = "yswysyydxj";
//
//    public String getDriverName() {
//        return driverName;
//    }
//
//    public void setDriverName(String driverName) {
//        this.driverName = driverName;
//    }
//
//    public String getUrl() {
//        return url;
//    }
//
//    public void setUrl(String url) {
//        this.url = url;
//    }
//
//    public String getUser() {
//        return user;
//    }
//
//    public void setUser(String user) {
//        this.user = user;
//    }
//
//    public String getPassword() {
//        return password;
//    }
//
//    public void setPassword(String password) {
//        this.password = password;
//    }

    public Connection getConnection() throws Exception {
        Properties prop = new Properties();
        prop.load(new FileInputStream("D:\\IntelliJ IDEA 2021.1.2\\PetLoveSystem\\src\\main\\java\\druid.properties"));
        //4．获取连接池对象
        DataSource dataSource = DruidDataSourceFactory.createDataSource(prop);
        //5.获取数据库连接
        return dataSource.getConnection();
    }


    //返回Statement语句
    public Statement getStatement() {
        try {

            //ResultSet.TYPE_SCROLL_SENSITIVE 返回可滚动的结果集，当数据库变化时，当前结果集同步改变。
            //ResultSet.CONCUR_READ_ONLY 不能用结果集更新数据库中的表。

            Connection connection = getConnection();
            return connection.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
//        }finally {
//            try {
//                connection.close();
//            } catch (SQLException throwables) {
//                throwables.printStackTrace();
//            }
//        }
    }

    //返回PreparedStatement语句，传入参数为SQL语句
    public PreparedStatement getPreparedStatement(String sql) {

        try {
            Connection connection = getConnection();
            //ResultSet.TYPE_SCROLL_SENSITIVE 返回可滚动的结果集，当数据库变化时，当前结果集同步改变。
            //ResultSet.CONCUR_READ_ONLY 不能用结果集更新数据库中的表。
            return connection.prepareStatement(sql, ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }

    }


}




