package movie.action.movietype;

import movie.entity.MovieType;
import movie.movieTypedao.UpdateMovieTypeDao;
import movie.movieTypedao.UpdateMovieTypeDaoImpl;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;

import javax.persistence.criteria.CriteriaBuilder;
import javax.servlet.http.HttpServletRequest;

public class updateMovieTypeAction extends ActionSupport {
    private UpdateMovieTypeDao updateMovieTypeDao = new UpdateMovieTypeDaoImpl();
    private MovieType movieType;
    private String type;
    private int id;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public MovieType getMovieType() {
        return movieType;
    }

    public void setMovieType(MovieType movieType) {
        this.movieType = movieType;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getType() {
        return type;
    }

    public String execute() throws Exception {
        HttpServletRequest request = ServletActionContext.getRequest();
        int id=Integer.parseInt(request.getParameter("id"));
        String type = request.getParameter("type");
        boolean isValid = updateMovieTypeDao.isExist(id);
        if (isValid) {
            updateMovieTypeDao.update(id,type);
            System.out.println("电影类别：" + type + "已修改！");
            return SUCCESS;
        } else {
            return ERROR;
        }
    }
}
