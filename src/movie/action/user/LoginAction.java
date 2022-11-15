package movie.action.user;

import movie.userdao.LoginDao;
import movie.userdao.LoginDaoImpl;
import com.opensymphony.xwork2.ActionSupport;



public class LoginAction extends ActionSupport {
    private LoginDao loginDao = new LoginDaoImpl();


    private int id;
    private String useraccount;
    private String userpassword;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

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

        boolean isValid = loginDao.login(useraccount, userpassword);
        if (isValid) {
            System.out.println("用户" + useraccount + "登录成功");
            return SUCCESS;
        } else {
            System.out.println("登录失败！");
            this.addFieldError("useraccount,userpassword", "用户名或密码不正确,请重新输入!");
            return ERROR;
        }
    }


}
