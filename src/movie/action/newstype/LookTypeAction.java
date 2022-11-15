package movie.action.newstype;

import movie.entity.NewsType;
import movie.newsTypedao.LookNewsTypeDao;
import movie.newsTypedao.LookNewsTypeDaoImpl;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

public class LookTypeAction extends ActionSupport {
    private LookNewsTypeDao lookNewsTypeDao = new LookNewsTypeDaoImpl();
    private NewsType NewsType;
    private List<NewsType> list;

    public List<NewsType> getList() {
        return list;
    }

    public void setList(List<NewsType> list) {
        this.list = list;
    }

    public NewsType getNewsType() {
        return NewsType;
    }

    public void setNewsType(NewsType NewsType) {
        this.NewsType = NewsType;
    }
    public String execute() throws Exception {
        HttpServletRequest request = ServletActionContext.getRequest();
        request.setAttribute("list", list);
        return SUCCESS;
    }

}
