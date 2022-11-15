package movie.action.movietype;

import movie.entity.MovieType;
import movie.movieTypedao.LookMovieTypeDao;
import movie.movieTypedao.LookMovieTypeDaoImpl;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

public class LookTypeAction extends ActionSupport {
    private LookMovieTypeDao lookMovieTypeDao = new LookMovieTypeDaoImpl();
    private MovieType movieType;
    private List<MovieType> list;

    public List<MovieType> getList() {
        return list;
    }

    public void setList(List<MovieType> list) {
        this.list = list;
    }

    public MovieType getMovieType() {
        return movieType;
    }

    public void setMovieType(MovieType movieType) {
        this.movieType = movieType;
    }
    public String execute() throws Exception {
        HttpServletRequest request = ServletActionContext.getRequest();
        request.setAttribute("list", list);
        return SUCCESS;
    }

}
