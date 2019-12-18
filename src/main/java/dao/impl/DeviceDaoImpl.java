package dao.impl;

import bean.Device;
import com.alibaba.fastjson.JSONObject;
import dao.DeviceDao;
import utils.JDBCUtils;
import utils.MySqlUtils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import static utils.MySqlUtils.getConnection;

public class DeviceDaoImpl implements DeviceDao {
    private Connection con = getConnection();
    private PreparedStatement pStmt;
    private ResultSet rs;
    private String sql;
    /*
     * @Description: 分页查询首页热门设备
     * @Param page:页数，第几页  count：每页设备数量 a_no:管理该设备的管理员的学工号
     * @Return: java.util.List<bean.Device>
     */
    public ArrayList<Device> getHotDeviceByPage(int page, int count,String a_no)
    {
        MySqlUtils mySqlUtils =new MySqlUtils();
        String sql = "select * from device " +
                "where a_no='"+a_no+"' limit "+(page-1)*count+","+count;
        ArrayList<Device> devices=new ArrayList<Device>();
        ResultSet rs=null;
        try {
            rs= mySqlUtils.executeQuery(sql);
            //判断是否存在记录
            if (rs.next())
            {
                do {
                    devices.add(
                            new Device(rs.getString("d_no"), rs.getString("a_no"), rs.getString("d_state"), rs.getInt("d_borrowed_times"),
                                    rs.getString("d_name"),rs.getString("d_save_site"),rs.getString("d_factory_no"),rs.getString("d_store_date"),rs.getString("d_model"))
                    );
                }
                while (rs.next());
                rs.close();
            }
            else
            {
                devices=null;
            }
        }
        catch (SQLException e) {
            e.printStackTrace();
        }
        finally {
            mySqlUtils.closeStmt();
            mySqlUtils.closeStmt();
        }
        return devices;
    }
    /*
     * @Description: 获取设备状态
     * @Param d_no
     * @Return: java.lang.String
     */
    public String getDeviceState(String d_no)
    {
        //初始化
        con = null;
        pStmt = null;
        rs = null;

        String result = "";
        try
        {
            con = JDBCUtils.getConnection();
            String sql = "SELECT d_state FROM device WHERE d_no= ?";
            pStmt = con.prepareStatement(sql);
            pStmt.setString(1, d_no);

            //查询
            rs = pStmt.executeQuery();
            if (rs.next())
            {
                result = rs.getString("d_state");
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
        return result;
    }
    /*
     * @Description: 删除设备
     * @Param d_no
     * @Return: int
     */
    public int deleteDevice(String d_no)
    {
        //初始化
        con = null;
        pStmt = null;
        rs = null;
        int flag=0;
        String result = "";
        try
        {
            con = JDBCUtils.getConnection();
            String sql = "DELETE from device where d_no= ?";
            pStmt = con.prepareStatement(sql);
            pStmt.setString(1, d_no);

            //查询
            flag = pStmt.executeUpdate();
        }
        catch (SQLException e)
        {
            e.printStackTrace();
        }
        finally
        {
            JDBCUtils.closeAll(rs, pStmt, con);
        }
        return flag;
    }
    /*
     * @Description: 获取设备总数
     * @Param a_no管理员学工号
     * @Return: int 设备总数
     */
    public int getDeviceSum(String a_no)
    {
        MySqlUtils mySqlUtils =new MySqlUtils();
        String sql="SELECT COUNT(*) sum from device\n" +
                "WHERE a_no='"+a_no+"'";
        ResultSet rs=null;
        int sum=0;
        try
        {
            rs= mySqlUtils.executeQuery(sql);
            if(rs.next())
            {
                sum=rs.getInt("sum");
            }
            rs.close();
        }
        catch (SQLException e){
            e.printStackTrace();
        }
        finally
        {
            mySqlUtils.closeStmt();
            mySqlUtils.closeConn();
        }
        return sum;
    }

    /*
     * @Description: 用户浏览获取设备具体信息
     * @Param deviceNo
     * @Return: com.alibaba.fastjson.JSONObject
     */
    public JSONObject getDeviceDetails(int deviceNo)
    {

        MySqlUtils.init(rs, pStmt, con);
        JSONObject result = new JSONObject();
        try {
            con = getConnection();
            String sql = "SELECT d_no,d_name,d_main_use,d_important_param,d_save_site, " +
                    "(SELECT a_name FROM administrator a1 WHERE a1.a_no = d.a_no ) a_name, " +
                    "(SELECT a_phone FROM administrator a2 WHERE a2.a_no = d.a_no ) a_phone  " +
                    "FROM device d WHERE d_no = ? ";
            pStmt = con.prepareStatement(sql);
            pStmt.setInt(1, deviceNo);
            rs = pStmt.executeQuery();
            if (rs.next())
            {
                result.put("d_no",rs.getString("d_no"));
                result.put("d_name",rs.getString("d_name"));
                result.put("d_main_use",rs.getString("d_main_use"));
                result.put("d_important_param",rs.getString("d_important_param"));
                result.put("d_save_site",rs.getString("d_save_site"));
                result.put("a_name",rs.getString("a_name"));
                result.put("a_phone",rs.getString("a_phone"));
                result.put("flag",1);
            }
            else
            {
                result.put("flag",0);
                result.put("errmsg","查询不到对应的设备");
            }
        }
        catch (SQLException e) {
            e.printStackTrace();
        }
        finally {
            MySqlUtils.closeAll(rs, pStmt, con);
        }
        return result;
    }

    /*
     * @Description: 改变设备状态
     * @Param state  d_no
     * @Return: int
     */
    public int setDeviceState(String d_no, String d_state)
    {
        //初始化
        con = null;
        pStmt = null;
        rs = null;

        int flag = 0;
        try
        {
            con = JDBCUtils.getConnection();
            String sql = "UPDATE device SET d_state = ? WHERE d_no = ?";
            pStmt = con.prepareStatement(sql);
            pStmt.setString(1, d_state);
            pStmt.setString(2, d_no);

            //更新状态
            flag = pStmt.executeUpdate();
        }
        catch (SQLException e)
        {
            e.printStackTrace();
        }
        finally
        {
            JDBCUtils.closeAll(rs, pStmt, con);
        }
        return flag;
    }

    /*
     * @Description: 设备借用次数增长
     * @Param d_no
     * @Return: int
     */
    public int addBorrowedTimes(String d_no)
    {
        //初始化
        con = null;
        pStmt = null;
        rs = null;

        int flag = 0;
        try
        {
            con = JDBCUtils.getConnection();
            sql = "UPDATE device SET d_borrowed_times = d_borrowed_times+1 WHERE d_no = ?";
            pStmt = con.prepareStatement(sql);
            pStmt.setString(1, d_no);

            //更新状态
            flag = pStmt.executeUpdate();
        }
        catch (SQLException e)
        {
            e.printStackTrace();
        }
        finally
        {
            JDBCUtils.closeAll(rs, pStmt, con);
        }
        return flag;
    }

    /*
     * @Description: 录入设备
     * @Param Device
     * @Return: boolean
     */
    public boolean enterDevice(Device d)
    {
        MySqlUtils mySqlUtils =new MySqlUtils();
        String sql="INSERT INTO device(d_no,d_name,d_model,d_save_site,a_no,d_factory_no,d_state,d_store_date)\n" +
                "VALUES('"+d.getD_no()+"','"+d.getD_name()+"','"+d.getD_model()+"','"+d.getD_saveSite()+
                "','"+d.getA_no()+"','"+d.getD_factoryNo()+"','"+d.getD_state()+"','"+d.getD_storeDate()+"');";
        int count= mySqlUtils.executeUpdate(sql);
        if(count==0)
            return false;
        return true;
    }
    /*
     * @Description: 通过设备编号获取设备信息
     * @Param d_no
     * @Return: bean.Device
     */
    public Device getDeviceByNo(String d_no)
    {
        //初始化
        con = null;
        pStmt = null;
        rs = null;
        Device device = new Device();

        try
        {
            con = JDBCUtils.getConnection();
            sql = "SELECT * FROM device WHERE d_no = ?";
            pStmt = con.prepareStatement(sql);

            //替换参数，从1开始
            pStmt.setString(1, d_no);
            rs = pStmt.executeQuery();

            if (rs.next())
            {
                device.setD_no(rs.getString("d_no"));
                device.setD_name(rs.getString("d_name"));
                device.setD_model(rs.getString("d_model"));
                device.setD_saveSite(rs.getString("d_save_site"));
                device.setA_no(rs.getString("a_no"));
                device.setD_factoryNo(rs.getString("d_factory_no"));
                device.setD_state(rs.getString("d_state"));
                device.setD_storeDate(rs.getString("d_store_date"));
                device.setD_borrowedTimes(rs.getInt("d_borrowed_times"));
                device.setD_photo(rs.getString("d_photo"));
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
        return device;
    }

}
