package movie.action.movie;

import movie.entity.Movie;
import movie.moviedao.DeleteMovieDao;
import movie.moviedao.DeleteMovieDaoImpl;
import com.opensymphony.xwork2.ActionSupport;

import java.io.File;

public class deleteMovieAction extends ActionSupport {
    private DeleteMovieDao deleteMovieDao=new DeleteMovieDaoImpl();

    private Movie movie;
    private String title;

    public Movie getMovie() {
        return movie;
    }

    public void setMovie(Movie movie) {
        this.movie = movie;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String execute() throws Exception{
        System.out.println("删除的电影编号："+title);
        String imageSrc="movieImg/"+title+".jpg";
        File file=new File(imageSrc);
        if(file.exists())
            file.delete();
        deleteMovieDao.delete(title);

        return SUCCESS;
    }
}
