package movie.action.user;

import movie.userdao.SignDao;
import movie.userdao.SignDaoImpl;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;

import javax.servlet.http.HttpServletRequest;

public class SignAction extends ActionSupport {
    private SignDao signDao = new SignDaoImpl();

    private int id;
    private String username;
    private String useraccount;
    private String usersex;
    private String userage;
    private String userpassword;
    private String usertell;
    private String useraddress;

    public void setId(int id) {
        this.id = id;
    }

    public int getId() {
        return id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getUseraccount() {
        return useraccount;
    }

    public void setUseraccount(String useraccount) {
        this.useraccount = useraccount;
    }

    public String getUsersex() {
        return usersex;
    }

    public void setUsersex(String usersex) {
        this.usersex = usersex;
    }

    public String getUserage() {
        return userage;
    }

    public void setUserage(String userage) {
        this.userage = userage;
    }

    public String getUserpassword() {
        return userpassword;
    }

    public void setUserpassword(String userpassword) {
        this.userpassword = userpassword;
    }

    public String getUsertell() {
        return usertell;
    }

    public void setUsertell(String usertell) {
        this.usertell = usertell;
    }

    public String getUseraddress() {
        return useraddress;
    }

    public void setUseraddress(String useraddress) {
        this.useraddress = useraddress;
    }


    public String execute() throws Exception {
        HttpServletRequest request = ServletActionContext.getRequest();
        String username = request.getParameter("username");
        String useraccount = request.getParameter("useraccount");
        String usersex = request.getParameter("usersex");
        String userage = request.getParameter("userage");
        String userpassword = request.getParameter("userpassword");
        String usertell = request.getParameter("usertell");
        String useraddress = request.getParameter("useraddress");
        boolean isValid = signDao.isExist(useraccount);
        if (!isValid) {
            signDao.add(username, useraccount, usersex, userage, userpassword, usertell, useraddress);
            System.out.println(useraccount + "注册成功");
            return SUCCESS;
        } else {
            System.out.println("此用户已存在！");
            this.addFieldError("error", "此用户已存在！");
            return ERROR;
        }
    }

}
