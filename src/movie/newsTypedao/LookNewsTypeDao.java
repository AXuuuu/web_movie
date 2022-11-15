package movie.newsTypedao;

import movie.entity.NewsType;

import java.util.List;

public interface LookNewsTypeDao {

    //浏览电影类型
    public List<NewsType> look();
    public List<NewsType> searchNewsType(String type);
}
