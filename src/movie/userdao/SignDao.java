package movie.userdao;

public interface SignDao {
    //用户注册验证
    public boolean isExist(String useraccount);

    //注册新用户
    public boolean add(String username, String useraccount, String usersex, String userage, String userpassword, String usertell, String useraddress);
}
