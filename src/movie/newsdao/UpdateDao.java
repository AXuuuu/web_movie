package movie.newsdao;

public interface UpdateDao {
    //判断该新闻是否存在
    public boolean isExist(int id);
    //修改新闻
    public boolean update(int id,String title,String type,String content);
}
