package movie.newsdao;

public interface AddDao {
    //判断是否有相同的新闻
    public boolean isExist(String title);
    //添加新闻
    public boolean add(String title,String type,String content);
}
