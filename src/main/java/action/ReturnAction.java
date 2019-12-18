package action;

import bean.Admin;
import bean.Borrow;
import bean.ReturnDevice;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import service.AdminService;
import service.impl.AdminServiceImpl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class ReturnAction extends ActionSupport
{
    private ReturnDevice returnDevice;
    /*
     * @Description: 获取带确认归还设备信息
     * @Param null
     * @Return: String
     */
    public String getTobereturned()
    {
        ActionContext context= ActionContext.getContext();
        Map session=context.getSession();  //获得会话对象，用来保存当前登录用户的信息
        AdminService adminService = new AdminServiceImpl();
        String a_no=((Admin)session.get("adm")).getA_no();
        List<Borrow> borrows= new ArrayList<Borrow>();
        borrows=adminService.getBorrow(a_no);
        session.put("borrows",borrows);
        return "success";
    }

    /*
     * @Description: 管理员确认归还完好设备
     * @Param null
     * @Return: null
     */
    public String confirmReturn()
    {
        ActionContext context= ActionContext.getContext();
        Map session=context.getSession();  //获得会话对象，用来保存当前登录用户的信息
        AdminService adminService = new AdminServiceImpl();
        int flag=adminService.confirmReturn(returnDevice);
        if(flag==0)
            return "error";
        return "success";
    }
    public ReturnDevice getReturnDevice()
    {
        return returnDevice;
    }

    public void setReturnDevice(ReturnDevice returnDevice)
    {
        this.returnDevice = returnDevice;
    }


}
