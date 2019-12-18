package action;

import bean.Admin;
import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import dao.AdminDao;
import dao.impl.AdminDaoImpl;
import org.apache.struts2.ServletActionContext;
import utils.MessageUtils;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;

public class EditPersonalDataAction extends ActionSupport {

    private Admin adm;
    //用户页面的信息
    private String oldPassword;
    private String newPassword;
    private String secondPassword;
    private String verifyCode;
    //生成的验证码
    private String inputVerifyCode;

    public String execute(){
        return Action.SUCCESS;
    }

    public EditPersonalDataAction() {
    }

    public String EditName(){
        try {
            HttpServletRequest request = ServletActionContext.getRequest();
            String name = request.getParameter("newName");
            ActionContext actionContext = ActionContext.getContext();
            Map session = actionContext.getSession();
            adm = (Admin)session.get("adm");
            Admin admin = new Admin(adm.getA_no(),adm.getA_password(),name,adm.getA_wechatid(),adm.getA_type(),adm.getA_phone(),adm.getA_email());
            AdminDao adminDao = new AdminDaoImpl();
            int flag = adminDao.changeAdmin(admin);
            if(flag > 0)
            {
                session.put("adm",admin);
                return "success";
            }

        }catch (Exception e){
            e.printStackTrace();
        }
        return "failure";
    }

    public String sendMessage(){
        MessageUtils messageUtils = new MessageUtils();
        HttpServletRequest request = ServletActionContext.getRequest();
        ActionContext actionContext = ActionContext.getContext();
        Map session = actionContext.getSession();
        adm = (Admin)session.get("adm");
        //String inputVerifyCode = messageUtils.sendVerifyCode(adm.getA_phone());
        inputVerifyCode="123456";
        String oldPassword = request.getParameter("oldPassword");
        String newPassword = request.getParameter("newPassword");
        String secondPassword = request.getParameter("secondPassword");
        String verifyCode = request.getParameter("verifyCode");
        session.put("inputVerifyCode",inputVerifyCode);
        session.put("oldPassword",oldPassword);
        session.put("newPassword",newPassword);
        session.put("secondPassword",secondPassword);
        session.put("verifyCode",verifyCode);
        if(verifyCode == null)
        {
            return "failure";
        }
        return "success";
    }

    public String changePassword(){
        HttpServletRequest request = ServletActionContext.getRequest();
        ActionContext actionContext = ActionContext.getContext();
        Map session = actionContext.getSession();
        try {
            oldPassword = request.getParameter("oldPassword");
            newPassword = request.getParameter("newPassword");
            secondPassword = request.getParameter("secondPassword");
            verifyCode = request.getParameter("verifyCode");
            adm = (Admin)session.get("adm");
            inputVerifyCode = (String)session.get("inputVerifyCode");
            if(oldPassword.equals(adm.getA_password()) && newPassword.equals(secondPassword) && inputVerifyCode.equals(verifyCode))
            {
                Admin admin = new Admin(adm.getA_no(),newPassword,adm.getA_name(),adm.getA_wechatid(),adm.getA_type(),adm.getA_phone(),adm.getA_email());
                AdminDao adminDao = new AdminDaoImpl();
                int flag = adminDao.changeAdmin(admin);
                if(flag > 0)
                {
                    session.put("adm",admin);
                    //清除保留的验证码信息
                    session.remove("oldPassword");
                    session.remove("newPassword");
                    session.remove("secondPassword");
                    session.remove("verifyCode");
                    session.remove("adm");
                    //解决退出登录回退问题
                    ServletActionContext.getResponse().setHeader("Cache-Control","no-cache,no-store");
                    ServletActionContext.getResponse().setHeader("Pragma","no-cache");
                    ServletActionContext.getResponse().setDateHeader ("Expires", -1);
                    return "success";
                }
            }

        }catch (Exception e){
            e.printStackTrace();
        }
        session.remove("verifyCode");
        return "failure";
    }

    public Admin getAdm() {
        return adm;
    }

    public void setAdm(Admin adm) {
        this.adm = adm;
    }

    public String getOldPassword() {
        return oldPassword;
    }

    public void setOldPassword(String oldPassword) {
        this.oldPassword = oldPassword;
    }

    public String getNewPassword() {
        return newPassword;
    }

    public void setNewPassword(String newPassword) {
        this.newPassword = newPassword;
    }

    public String getSecondPassword() {
        return secondPassword;
    }

    public void setSecondPassword(String secondPassword) {
        this.secondPassword = secondPassword;
    }

    public String getVerifyCode() {
        return verifyCode;
    }

    public void setVerifyCode(String verifyCode) {
        this.verifyCode = verifyCode;
    }

    public String getInputVerifyCode() {
        return inputVerifyCode;
    }

    public void setInputVerifyCode(String inputVerifyCode) {
        this.inputVerifyCode = inputVerifyCode;
    }
}