package dao.impl;

import bean.Admin;
import dao.AdminDao;
import utils.JDBCUtils;
import utils.MySqlUtils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class AdminDaoImpl implements AdminDao {
    private Connection con;
    private PreparedStatement pStmt;
    private ResultSet rs;
    private String sql;

    /*
     * @Description: 通过学工号唯一标识获取管理员信息
     * @Param a_no
     * @Return: bean.Admin
     */
    public Admin getAdminByA_No(String a_no)
    {
        MySqlUtils mySqlUtils =new MySqlUtils();
        try
        {
            rs=null;
            sql = "select * from administrator where a_no = '" +a_no+
                    "'";

            rs = mySqlUtils.executeQuery(sql);

            if (rs.next())
            {
                return new Admin(rs.getString("a_no"), rs.getString("a_password"),rs.getString("a_name"), rs.getString("a_wechatid"),
                    rs.getString("a_type"), rs.getString("a_phone"), rs.getString("a_email"));
            }
            rs.close();
        }
        catch (SQLException e)
        {
            e.printStackTrace();
        }
        finally
        {
            mySqlUtils.closeConn();
            mySqlUtils.closeStmt();
        }
        return  null;
    }
    //判断管理员身份是否正确
    @Override
    public int isAdmin(String name, String password) {
        //初始化
        con = null;
        pStmt = null;
        rs = null;

        try
        {
            con = JDBCUtils.getConnection();
            sql = "select a_no,a_password from administrator";
            pStmt = con.prepareStatement(sql);

            rs = pStmt.executeQuery();

            while (rs.next())
            {
                if(rs.getString(1).equals(name) && rs.getString(2).equals(password))
                {
                    return 1;
                }
            }
        }
        catch (SQLException e)
        {
            e.printStackTrace();
        }
        finally
        {
            JDBCUtils.closeAll(rs, pStmt, con);
        }
        return 0;
    }

    @Override
    public int changeAdmin(Admin admin) {
        //初始化
        con = null;
        pStmt = null;
        rs = null;

        try
        {
            con = JDBCUtils.getConnection();
            sql = "update administrator set a_password=?,a_name=?,a_phone=?,a_email=? where a_no=?";
            pStmt = con.prepareStatement(sql);

            pStmt.setString(1,admin.getA_password());
            pStmt.setString(2,admin.getA_name());
            pStmt.setString(3,admin.getA_phone());
            pStmt.setString(4,admin.getA_email());
            pStmt.setString(5,admin.getA_no());
            int flag = pStmt.executeUpdate();
            return flag;
        }
        catch (SQLException e)
        {
            e.printStackTrace();
        }
        finally
        {
            JDBCUtils.closeAll(rs, pStmt, con);
        }
        return 0;
    }

}
