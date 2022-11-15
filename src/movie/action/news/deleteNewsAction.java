package movie.action.news;

import movie.entity.News;
import movie.newsdao.DeleteDao;
import movie.newsdao.DeleteDaoImpl;
import com.opensymphony.xwork2.ActionSupport;


public class deleteNewsAction extends ActionSupport {
    private DeleteDao deleteDao = new DeleteDaoImpl();


    private News news;
    private int id;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public News getNews() {
        return news;
    }

    public void setNews(News news) {
        this.news = news;
    }


    public String execute() throws Exception {
        System.out.println("删除的新闻编号:"+id);
        deleteDao.delete(id);
        return SUCCESS;
    }
}
