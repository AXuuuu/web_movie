package movie.action.newstype;

import movie.entity.NewsType;
import movie.newsTypedao.AddNewsTypeDao;
import movie.newsTypedao.AddNewsTypeDaoImpl;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;

import javax.servlet.http.HttpServletRequest;

public class addNewsTypeAction extends ActionSupport {
    private AddNewsTypeDao addNewsDao = new AddNewsTypeDaoImpl();
    private NewsType NewsType;

    public NewsType getNewsType() {
        return NewsType;
    }

    public void setNews(NewsType NewsType) {
        this.NewsType = NewsType;
    }

    public String execute() throws Exception {
        HttpServletRequest request = ServletActionContext.getRequest();
        String type = request.getParameter("type");

        boolean isValid = addNewsDao.isExist(type);
        if (!isValid) {
            addNewsDao.add(type);
            System.out.println("新闻类别：" + type + "添加成功");
            return SUCCESS;
        } else {
            System.out.println("该类别已存在");
            return ERROR;
        }
    }
}
