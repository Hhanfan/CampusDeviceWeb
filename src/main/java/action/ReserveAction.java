package action;

import bean.Admin;
import bean.Device;
import bean.Reservation;
import bean.User;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import service.AdminService;
import service.impl.AdminServiceImpl;

import java.util.List;
import java.util.Map;

public class ReserveAction extends ActionSupport
{
    private Device device;
    private User user;
    private int r_no;     //预约编号
    private String r_feedback; //拒绝预约原因
    private String startDate;
    private String endDate;
    private String feedBack; //调整时间原因

    /*
     * @Description:获取已预约设备队列
     * @Param null
     * @Return: String
     */
    public String getReservation() throws Exception
    {
        ActionContext context= ActionContext.getContext();
        Map session=context.getSession();  //获得会话对象，用来保存当前登录用户的信息
        AdminService adminService = new AdminServiceImpl();
        String a_no=((Admin)session.get("adm")).getA_no();
        List<Reservation> rsrvdevicelist=adminService.getReservation(a_no);
        session.put("rsrvdevicelist",rsrvdevicelist);
        return "success";
    }
    /*
     * @Description: 获取某一设备详细预约信息
     * @Param null
     * @Return: String
     */
    public String getReservationDetail() throws Exception
    {
        String d_no=device.getD_no();
        ActionContext context= ActionContext.getContext();
        Map session=context.getSession();  //获得会话对象，用来保存当前登录用户的信息
        session.put("d_no",d_no);
        AdminService adminService = new AdminServiceImpl();
        List<Reservation> reservationlist=adminService.getReservationDetail(d_no);
        session.put("rsrvlist",reservationlist);
        return "success";
    }

    /*
     * @Description: 同意用户的预约请求
     * @Param null
     * @Return: String
     */

    public String AgreeReservation()
    {
        AdminService adminService = new AdminServiceImpl();
        System.out.println(r_no);
        int flag=adminService.confirmBorrow(r_no);
        if(flag==-1)
        {
            return "damaged";
        }
        else if(flag==-2)
        {
            return "scrapped";
        }
        else if(flag==-3)
        {
            return "borrowed";
        }
        return "success";
    }

    /*
     * @Description: 用户拒绝预约请求
     * @Param null
     * @Return: null
     */
    public String RefuseReservation()
    {
        AdminService adminService = new AdminServiceImpl();
        int flag=adminService.refuseBorrow(r_no,r_feedback);
        if(flag!=0)
        {
            return "success";
        }
        else
        {
            return "error";
        }
    }
    /*
     * @Description: 管理员编辑修改用户预约，开始协商
     * @Param null
     * @Return: String
     */
    public String editReservation()
    {
        AdminService adminService = new AdminServiceImpl();
        int flag=adminService.editReservation(r_no,startDate,endDate,feedBack);
        if(flag!=0)
        {
            return "success";
        }
        return "error";
    }

    public Device getDevice()
    {
        return device;
    }
    public void setDevice(Device device)
    {
        this.device=device;
    }

    public User getUser()
    {
        return user;
    }
    public void setUser(User user)
    {
        this.user=user;
    }

    public int getR_no()
    {
        return r_no;
    }

    public void setR_no(int r_no)
    {
        this.r_no = r_no;
    }

    public String getR_feedback()
    {
        return r_feedback;
    }

    public void setR_feedback(String r_feedback)
    {
        this.r_feedback = r_feedback;
    }

    public String getStartDate()
    {
        return startDate;
    }

    public String getEndDate()
    {
        return endDate;
    }

    public void setStartDate(String startDate)
    {
        this.startDate = startDate;
    }

    public void setEndDate(String endDate)
    {
        this.endDate = endDate;
    }

    public String getFeedBack()
    {
        return feedBack;
    }

    public void setFeedBack(String feedBack)
    {
        this.feedBack = feedBack;
    }
}
