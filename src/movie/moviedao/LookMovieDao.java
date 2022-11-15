package movie.moviedao;

import java.util.List;
import movie.entity.Movie;

public interface LookMovieDao {

    //浏览电影
    public List<Movie> look();

    //分类别查看
    public List<Movie> lookType(String type);

    //查找特定电影
    public  List<Movie> searchMovie(String title);
}
