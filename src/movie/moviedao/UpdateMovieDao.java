package movie.moviedao;




public interface UpdateMovieDao {

    //判断该电影是否存在
    public boolean isExist(int title);

    //修改电影
    public boolean update( int id,String title, String img, String type, String introduction, String src);
}
