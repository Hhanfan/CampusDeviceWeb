package dao;

import bean.Admin;
import com.alibaba.fastjson.JSONObject;

public interface AdminDao {

    Admin getAdminByA_No(String wechatID);
    //判断管理员身份是否正确
    int isAdmin(String name,String password);
    //更改管理员的部分数据
    int changeAdmin(Admin admin);
}
