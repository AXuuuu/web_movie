package movie.action.movietype;

import movie.entity.MovieType;
import movie.movieTypedao.DeleteMovieTypeDao;
import movie.movieTypedao.DeleteMovieTypeDaoImpl;
import com.opensymphony.xwork2.ActionSupport;

public class deleteMovieTypeAction extends ActionSupport {
    private DeleteMovieTypeDao deleteMovieTypeDao=new DeleteMovieTypeDaoImpl();

    private MovieType movieType;
    private int id;

    public MovieType getMovie() {
        return movieType;
    }

    public void setMovieType(MovieType movieType) {
        this.movieType = movieType;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String execute() throws Exception{
        System.out.println("删除的电影类型编号："+id);
        deleteMovieTypeDao.delete(id);
        return SUCCESS;
    }
}
