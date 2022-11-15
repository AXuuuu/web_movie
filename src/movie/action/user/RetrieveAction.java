package movie.action.user;

import movie.userdao.RetrieveDao;
import movie.userdao.RetrieveDaoImpl;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class RetrieveAction extends ActionSupport {
    private RetrieveDao retrieveDao = new RetrieveDaoImpl();

    private String useraccount;
    private String userpassword;

    public String getUseraccount() {
        return useraccount;
    }

    public void setUseraccount(String useraccount) {
        this.useraccount = useraccount;
    }

    public String getUserpassword() {
        return userpassword;
    }

    public void setUserpassword(String userpassword) {
        this.userpassword = userpassword;
    }

    public String execute() throws Exception {
        //先获取找回密码页面中的验证码
        HttpServletRequest request = ServletActionContext.getRequest();
        HttpServletResponse response = ServletActionContext.getResponse();
        HttpSession session = request.getSession();
        String userCode = request.getParameter("userCode");
        System.out.println("输入的验证码：" + userCode);
        //获取系统生成的验证码，同时移除掉
        String verificationCode = (String) session.getAttribute("checkcode_inSession");
        session.removeAttribute(("check_inSession"));

        boolean isValid = retrieveDao.isExist(useraccount);
        if (isValid) {
//            if (!userCode.equals(verificationCode)) {
//                session.setAttribute("loginError", "验证码错误");
//                this.addFieldError("userCode", "验证码错误");
//                return ERROR;
//            }else{
                retrieveDao.update(useraccount, userpassword);
                System.out.println("用户:" + useraccount + "的密码修改成功！");
                return SUCCESS;
//            }
        } else {
            this.addFieldError("error", "修改失败");
            return ERROR;
        }
    }


}
