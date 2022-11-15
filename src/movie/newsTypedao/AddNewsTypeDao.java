package movie.newsTypedao;

public interface AddNewsTypeDao {
    //判断是否有相同的电影类型
    public boolean isExist(String type);
    //添加电影类型
    public boolean add(String type);
}
