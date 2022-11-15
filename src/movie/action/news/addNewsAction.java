package movie.action.news;

import movie.entity.News;
import movie.newsdao.AddDao;
import movie.newsdao.AddDaoImpl;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;

import javax.servlet.http.HttpServletRequest;

public class addNewsAction extends ActionSupport {
    private AddDao addDao = new AddDaoImpl();

    private News news;

    public News getNews() {
        return news;
    }

    public void setNews(News news) {
        this.news = news;
    }


    public String execute() throws Exception {
        HttpServletRequest request = ServletActionContext.getRequest();
        String title = request.getParameter("title");
        String type=request.getParameter("type");
        String content = request.getParameter("content");
        boolean isValid = addDao.isExist(title);
        if (!isValid) {
            addDao.add(title,type,content);
            System.out.println("新闻" + title + "添加成功");
            return SUCCESS;
        } else {
            System.out.println("该新闻已存在");
            return ERROR;
        }
    }
}
