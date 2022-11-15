package movie.action.news;

import movie.entity.News;
import movie.newsdao.LookDao;
import movie.newsdao.LookDaoImpl;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

public class LookAction extends ActionSupport {
    private LookDao lookDao = new LookDaoImpl();

    private News news;
    private List<News> list;

    public List<News> getList() {
        return list;
    }

    public void setList(List<News> list) {
        this.list = list;
    }



    public News getNews() {
        return news;
    }

    public void setNews(News news) {
        this.news = news;
    }

    public String execute() throws Exception {
        HttpServletRequest request = ServletActionContext.getRequest();
        request.setAttribute("list", list);
        return SUCCESS;
    }

}
