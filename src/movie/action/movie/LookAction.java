package movie.action.movie;

import movie.entity.Movie;
import movie.moviedao.LookMovieDao;
import movie.moviedao.LookMovieDaoImpl;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

public class LookAction extends ActionSupport {
    private LookMovieDao lookMovieDao = new LookMovieDaoImpl();
    private Movie movie;
    private List<Movie> list;

    public List<Movie> getList() {
        return list;
    }

    public void setList(List<Movie> list) {
        this.list = list;
    }

    public Movie getMovie() {
        return movie;
    }

    public void setMovie(Movie movie) {
        this.movie = movie;
    }

    public String execute() throws Exception {
        HttpServletRequest request = ServletActionContext.getRequest();
        request.setAttribute("list", list);
        return SUCCESS;
    }
}
