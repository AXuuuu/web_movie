package movie.action.newstype;

import movie.entity.NewsType;
import movie.newsTypedao.DeleteNewsTypeDao;
import movie.newsTypedao.DeleteNewsTypeDaoImpl;
import com.opensymphony.xwork2.ActionSupport;

public class deleteNewsTypeAction extends ActionSupport {
    private DeleteNewsTypeDao deleteNewsTypeDao=new DeleteNewsTypeDaoImpl();

    private NewsType NewsType;
    private int id;

    public NewsType getNews() {
        return NewsType;
    }

    public void setNewsType(NewsType NewsType) {
        this.NewsType = NewsType;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String execute() throws Exception{
        System.out.println("删除的新闻类型编号："+id);
        deleteNewsTypeDao.delete(id);
        return SUCCESS;
    }
}
