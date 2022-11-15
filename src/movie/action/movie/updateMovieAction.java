package movie.action.movie;

import movie.entity.Movie;
import movie.moviedao.UpdateMovieDao;
import movie.moviedao.UpdateMovieDaoImpl;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;

public class updateMovieAction extends ActionSupport {
    private UpdateMovieDao updateMovieDao = new UpdateMovieDaoImpl();
    private Movie movie;
    private int id;
    private String title;
    private String img;
    private String type;
    private String introduction;
    private String src;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
    public File getUploadImage() {
        return uploadImage;
    }

    public void setUploadImage(File uploadImage) {
        this.uploadImage = uploadImage;
    }

    public String getUploadImageContentType() {
        return uploadImageContentType;
    }

    public void setUploadImageContentType(String uploadImageContentType) {
        this.uploadImageContentType = uploadImageContentType;
    }

    public String getUploadImageFileName() {
        return uploadImageFileName;
    }

    public void setUploadImageFileName(String uploadImageFileName) {
        this.uploadImageFileName = uploadImageFileName;
    }

    private File uploadImage;
    private String uploadImageContentType;
    private String uploadImageFileName;

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

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getIntroduction() {
        return introduction;
    }

    public void setIntroduction(String introduction) {
        this.introduction = introduction;
    }

    public String getSrc() {
        return src;
    }

    public void setSrc(String src) {
        this.src = src;
    }

    public String execute() throws Exception {
        System.out.println("ImgFileName:"+this.getUploadImageFileName());
        System.out.println("ImgContentType:"+this.getUploadImageContentType());
        System.out.println("ImgFile:"+this.getUploadImage());

        String realPath="E:/IDEA_Code/web_movie/web/movieImg";
        File file = new File(realPath);

        if(!file.exists())file.mkdirs();
        try {
            //保存文件
            FileUtils.copyFile(uploadImage, new File(file,uploadImageFileName));
        } catch (IOException e) {
            e.printStackTrace();
        }

        HttpServletRequest request = ServletActionContext.getRequest();
        int id=Integer.parseInt(request.getParameter("id"));
        String title = request.getParameter("title");
        String type = request.getParameter("type");
        String introduction = request.getParameter("introduction");
        String src = request.getParameter("src");
        String imageSrc="movieImg/"+this.getUploadImageFileName();
        boolean isValid = updateMovieDao.isExist(id);
        if (isValid) {
            updateMovieDao.update(id,title, imageSrc, type, introduction, src);
            System.out.println("电影：" + title + "已修改！");
            return SUCCESS;
        } else {
            return ERROR;
        }
    }
}
