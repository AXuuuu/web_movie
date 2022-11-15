package movie.moviedao;

public interface AddMovieDao {
    //判断是否有相同的电影
    public boolean isExist(String title);
    //添加新闻
    public boolean add(String title, String img, String type, String introduction, String src);
}
