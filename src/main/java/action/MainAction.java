package action;

import bean.*;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import utils.MySqlUtils;
import service.AdminService;
import java.lang.String;
import java.util.ArrayList;
import java.util.Map;
import service.impl.*;
import java.util.List;

public class MainAction extends ActionSupport
{
    private Admin adm;

    /*
     * @Description:管理员处理请求的execute方法
     * @Param null
     * @Return: String
     */
    public String execute()
    {
        String a_no = adm.getA_no();
        String pwd = adm.getA_password();
        ActionContext context = ActionContext.getContext();
        Map session = context.getSession();  //获得会话对象，用来保存当前登录用户的信息
        Admin admin = null;
        AdminService adminService = new AdminServiceImpl();
        int flag = adminService.isAdmin(a_no,pwd);
        if(flag == 1)
        {
            admin = adminService.getPersonalInfo(a_no);
            session.put("adm", admin);
            return "success";
        }
        else
        {
            //验证失败返回字符串"error"
            return "error";
        }
    }

    public  Admin getAdm()
    {
        return adm;
    }
    public void setAdm(Admin adm)
    {
        this.adm=adm;
    }
}
