package movie.action.movie;

import movie.entity.Movie;
import movie.moviedao.AddMovieDao;
import movie.moviedao.AddMovieDaoImpl;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;


import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;

public class addMovieAction extends ActionSupport {
    private AddMovieDao addMovieDao = new AddMovieDaoImpl();
    private Movie movie;
//    private File upload;
    private String upload;

    private File uploadImage; //得到上传的文件
    private String uploadImageContentType; //得到文件的类型
    private String uploadImageFileName; //得到文件的名称
//    private File uploadMovie;
//    private String uploadMovieContentType;
//    private String uploadMovieFileName;
//
//    public File getUploadMovie() {
//        return uploadMovie;
//    }
//
//    public void setUploadMovie(File uploadMovie) {
//        this.uploadMovie = uploadMovie;
//    }
//
//    public String getUploadMovieContentType() {
//        return uploadMovieContentType;
//    }
//
//    public void setUploadMovieContentType(String uploadMovieContentType) {
//        this.uploadMovieContentType = uploadMovieContentType;
//    }
//
//    public String getUploadMovieFileName() {
//        return uploadMovieFileName;
//    }
//
//    public void setUploadMovieFileName(String uploadMovieFileName) {
//        this.uploadMovieFileName = uploadMovieFileName;
//    }

    public Movie getMovie() {
        return movie;
    }

    public void setMovie(Movie movie) {
        this.movie = movie;
    }

    public String getUpload() {
        return upload;
    }

    public void setUploadImage(File uploadImage) {
        this.uploadImage = uploadImage;
    }

    public void setUploadImageContentType(String uploadImageContentType) {
        this.uploadImageContentType = uploadImageContentType;
    }

    public void setUploadImageFileName(String uploadImageFileName) {
        this.uploadImageFileName = uploadImageFileName;
    }

    public void setUpload(String upload) {
        this.upload = upload;
    }

    public File getUploadImage() {
        return uploadImage;
    }

    public String getUploadImageContentType() {
        return uploadImageContentType;
    }



    public String getUploadImageFileName() {
        return uploadImageFileName;
    }

    public String execute() throws Exception {
        //上传电影海报
        System.out.println("ImgFileName:"+this.getUploadImageFileName());
        System.out.println("ImgContentType:"+this.getUploadImageContentType());
        System.out.println("ImgFile:"+this.getUploadImage());

        //获取要保存文件夹的物理路径(绝对路径)
        String realPath="E:/IDEA_Code/web_movie/web/movieImg";
        File file = new File(realPath);

        //测试此抽象路径名表示的文件或目录是否存在。若不存在，创建此抽象路径名指定的目录，包括所有必需但不存在的父目录。
        if(!file.exists())file.mkdirs();
        try {
            //保存文件
            FileUtils.copyFile(uploadImage, new File(file,uploadImageFileName));
        } catch (IOException e) {
            e.printStackTrace();
        }

//        //上传电影文件
//        System.out.println("ImgFileName:"+this.getUploadMovieFileName());
//        System.out.println("ImgContentType:"+this.getUploadMovieContentType());
//        System.out.println("ImgFile:"+this.getUploadMovie());
//
//        //获取要保存文件夹的物理路径(绝对路径)
//        realPath="E:/IDEA_Code/web_movie/web/movie";
//        file1 = new File(realPath);
//
//        //测试此抽象路径名表示的文件或目录是否存在。若不存在，创建此抽象路径名指定的目录，包括所有必需但不存在的父目录。
//        if(!file.exists())file.mkdirs();
//        try {
//            //保存文件
//            FileUtils.copyFile(uploadImage, new File(file,uploadMovieFileName));
//        } catch (IOException e) {
//            e.printStackTrace();
//        }


        HttpServletRequest request = ServletActionContext.getRequest();
        String title = request.getParameter("title");
        String type = request.getParameter("type");
        String introduction = request.getParameter("kindedito");
        String movieSrc=request.getParameter("uploadMovie");
//      //本地上传
//      String movieSrc="movie/"this.getUploadMovieFileName();
        String imageSrc="movieImg/"+this.getUploadImageFileName();

        System.out.println("imageSrc"+imageSrc);
        boolean isValid = addMovieDao.isExist(title);

        if (!isValid) {
            addMovieDao.add(title, imageSrc, type, introduction, movieSrc);
            System.out.println("电影：" + title + "添加成功");
            return SUCCESS;
        } else {
            System.out.println("该电影已存在");
            return ERROR;
        }
    }
}
