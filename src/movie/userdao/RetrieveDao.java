package movie.userdao;

public interface RetrieveDao {
    //验证是否有该账存在
    public boolean isExist(String useraccount);


    //修改密码
    public boolean update(String useraccount, String userassword);

}
