package utils;
import java.sql.*;

/*
   JDBC工具类：将常用的函数/重复调用代码量大 封装到此，方便调用
 */
public class MySqlUtils
{

    //访问网址为49.235.73.29的数据库testsql
    private static String url = "jdbc:mysql://49.235.73.29:3306/testdb?serverTimezone=UTC";
    //数据库的用户名
    private static String user = "root";
    //数据库的密码
    private static String password = "skplroot";
    //数据库连接
    private static Connection conn;
    //语句
    private Statement stmt;
    //结果集
    private ResultSet rs;

    /*
     * @Description: 创建连接：连接testdb数据库
     * @Param
     * @Return: java.sql.Connection
     */
    public
    MySqlUtils() {
        stmt = null;
        conn = null;
        try {
            //选择加载驱动
            Class.forName("com.mysql.cj.jdbc.Driver");
            //建立连接
            conn = DriverManager.getConnection(url, user, password);
        } catch (Exception e) {
            e.printStackTrace();
        }
        //如果发生异常，则返回一个空的连接
        rs = null;
    }

    //执行查询类的SQL语句，有返回集
    public static  Connection getConnection() {
        return conn;
    }
    public int executeUpdate(String sql){
        stmt = null;
        int flag=0;
        try {
            stmt = conn.createStatement();
            flag = stmt.executeUpdate(sql);
        } catch (SQLException e) {
            System.err.println("Data.executeUpdate: " + e.getMessage());
        }
        return flag;
    }
    public ResultSet executeQuery(String sql) {
        stmt = null;
        try {
            stmt = conn.createStatement();
            rs = stmt.executeQuery(sql);
        } catch (SQLException e) {
            System.err.println("Data.executeQuery: " + e.getMessage());
        }
        return rs;
    }

    public void closeStmt() {
        try {
            stmt.close();
        } catch (SQLException e) {
            System.err.println("Data.executeQuery: " + e.getMessage());
        }
    }

    public void closeConn() {
        try {
            conn.close();
        } catch (SQLException e) {
            System.err.println("Data.executeQuery: " + e.getMessage());
        }
    }

    public static  void init(ResultSet resultSet, Statement statement, Connection connection) {
        resultSet = null;
        statement = null;
        connection = null;
    }

    public static void closeAll(ResultSet resultSet, Statement statement, Connection connection) {
        /*
        不能放到同一个try、catch语句中：
        如果某一个在close过程中出现异常抛出，后面的将无法关闭资源
         */
        try {
            if (resultSet != null) resultSet.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        try {
            if (statement != null) statement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        try {
            if (connection != null) connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}

