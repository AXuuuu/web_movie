package movie.newsdao;

import movie.entity.News;

import java.util.List;

public interface LookDao {
    //浏览新闻
    public List<News> look();
    public List<News> searchNews(String title);
}
