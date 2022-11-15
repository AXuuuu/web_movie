package movie.movieTypedao;

import movie.entity.MovieType;
import movie.entity.MovieType;

import java.util.List;

public interface LookMovieTypeDao {

    //浏览电影类型
    public List<MovieType> look();
    public List<MovieType> searchMovieType(String type);
}
