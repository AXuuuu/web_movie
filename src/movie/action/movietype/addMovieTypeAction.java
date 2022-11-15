package movie.action.movietype;

import movie.entity.MovieType;
import movie.movieTypedao.AddMovieTypeDao;
import movie.movieTypedao.AddMovieTypeDaoImpl;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;

public class addMovieTypeAction extends ActionSupport {
    private AddMovieTypeDao addMovieDao = new AddMovieTypeDaoImpl();
    private MovieType movieType;

    public MovieType getMovieType() {
        return movieType;
    }

    public void setMovie(MovieType movieType) {
        this.movieType = movieType;
    }

    public String execute() throws Exception {
        HttpServletRequest request = ServletActionContext.getRequest();
        String type = request.getParameter("type");


        boolean isValid = addMovieDao.isExist(type);
        if (!isValid) {
            addMovieDao.add(type);
            System.out.println("电影类别：" + type + "添加成功");
            return SUCCESS;
        } else {
            System.out.println("该电影已存在");
            return ERROR;
        }
    }
}
