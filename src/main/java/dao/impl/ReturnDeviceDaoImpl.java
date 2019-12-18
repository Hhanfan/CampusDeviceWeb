package dao.impl;

import bean.ReturnDevice;
import dao.ReturnDeviceDao;
import utils.MySqlUtils;
import java.sql.ResultSet;

public class ReturnDeviceDaoImpl implements ReturnDeviceDao {
    private ResultSet rs;
    /*
     * @Description: 归还设备
     * @Param u_no  d_no
     * @Return: com.alibaba.fastjson.JSONObject
     */
    public int returnDevice(ReturnDevice returnDevice)
    {
        //初始化
        MySqlUtils mySqlUtils =new MySqlUtils();
        rs = null;
        int flag = 0;
        String sql = "INSERT INTO return_device(u_no, d_no, b_no, rd_date, rd_device_state, rd_comment) " +
                "VALUES ('"+returnDevice.getU_no()+"','"+returnDevice.getD_no()+"',"+returnDevice.getB_no()+",CURRENT_DATE,'"+
                returnDevice.getRd_deviceState()+"','"+returnDevice.getRd_comment()+"')";
        //返回执行状态
        flag = mySqlUtils.executeUpdate(sql);
        mySqlUtils.closeStmt();
        mySqlUtils.closeConn();
        return flag;
    }
}
