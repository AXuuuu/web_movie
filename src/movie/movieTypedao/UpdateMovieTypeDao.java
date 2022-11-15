package movie.movieTypedao;




public interface UpdateMovieTypeDao {

    //判断该电影类型是否存在
    public boolean isExist(int id);

    //修改电影类型
    public boolean update(int id,String type);
}
