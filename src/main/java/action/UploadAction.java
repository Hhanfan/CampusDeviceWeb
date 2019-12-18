package action;
import java.io.*;
import java.util.Map;

import bean.Admin;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;
import utils.ExcelUtils;


public class UploadAction extends ActionSupport{
    //upload属性名和表单域名name相同，类型为File
    private File upload;
    //上传文件的文件名也是由struts设置好了，为表单域名+FileName
    private String uploadFileName;
    //设置文件类型为表单域名+ContentType
    private String uploadContentType;

    public UploadAction(File upload, String uploadFileName, String uploadContentType) {
        this.upload = upload;
        this.uploadFileName = uploadFileName;
        this.uploadContentType = uploadContentType;
    }

    public UploadAction()
    {

    }

    //设置上传的业务方法
    public String execute(){
        //获取文件上传路径
        String fileSavePath = ServletActionContext.getServletContext().getRealPath("/upload");
        try {
            FileUtils.copyFile(upload,new File(fileSavePath,uploadFileName));
            String absoluteAddress = fileSavePath+"\\"+uploadFileName;
            System.out.println("文件已经上传到"+absoluteAddress);
        }
        catch (IOException ie)
        {
            ie.printStackTrace();
            System.out.println("文件上传失败");
            return "error";
        }
        catch (Exception e)
        {
            e.printStackTrace();
            System.out.println("文件上传为空");
            return "error";
        }
        ActionContext context= ActionContext.getContext();
        Map session=context.getSession();  //获得会话对象，用来保存当前登录用户的信息
        //AdminService adminService = new AdminServiceImpl();
        String a_no=((Admin)session.get("adm")).getA_no();
        if(!ExcelUtils.isTitleValid(fileSavePath,uploadFileName))
        {
            return "error";
        }
        if(!ExcelUtils.isStateValid(fileSavePath,uploadFileName))
            return "error";
        if(!ExcelUtils.isDeviceNoValid(fileSavePath,uploadFileName))
            return "error";
        ExcelUtils.excelToWorkbook(fileSavePath,uploadFileName);
        ExcelUtils.workbookToList(fileSavePath,uploadFileName);
        ExcelUtils.excelToDb(fileSavePath,uploadFileName,a_no);
        return "success";
    }

    public File getUpload() {
        return upload;
    }

    public void setUpload(File upload) {
        this.upload = upload;
    }

    public String getUploadFileName() {
        return uploadFileName;
    }

    public void setUploadFileName(String uploadFileName) {
        this.uploadFileName = uploadFileName;
    }

    public String getUploadContentType() {
        return uploadContentType;
    }

    public void setUploadContentType(String uploadContentType) {
        this.uploadContentType = uploadContentType;
    }
}
