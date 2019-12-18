package action;

import bean.Admin;
import bean.Borrow;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import service.AdminService;
import service.impl.AdminServiceImpl;

import java.util.List;
import java.util.Map;

public class OverdueAction extends ActionSupport
{
    private int page;
    /*
     * @Description: 获取管理员管理范围内逾期未换的记录
     * @Param null
     * @Return: String
     */
    public String getOverDue(){
        ActionContext context= ActionContext.getContext();
        Map session=context.getSession();  //获得会话对象，用来保存当前登录用户的信息
        AdminService adminService = new AdminServiceImpl();
        String a_no=((Admin)session.get("adm")).getA_no();
        List<Borrow> borrows=adminService.getOverDueList(a_no,page);
        session.put("borrows",borrows);
        return "success";
    }


    public int getPage()
    {
        return page;
    }

    public void setPage(int page)
    {
        this.page = page;
    }
}
