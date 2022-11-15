package movie.action.newstype;

import movie.entity.NewsType;
import movie.newsTypedao.UpdateNewsTypeDao;
import movie.newsTypedao.UpdateNewsTypeDaoImpl;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;

import javax.servlet.http.HttpServletRequest;

public class updateNewsTypeAction extends ActionSupport {
    private UpdateNewsTypeDao updateNewsTypeDao = new UpdateNewsTypeDaoImpl();
    private NewsType NewsType;
    private String type;
    private int id;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public NewsType getNewsType() {
        return NewsType;
    }

    public void setNewsType(NewsType NewsType) {
        this.NewsType = NewsType;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String execute() throws Exception {
        HttpServletRequest request = ServletActionContext.getRequest();
        String type = request.getParameter("type");
        int id=Integer.parseInt(request.getParameter("id"));
        boolean isValid = updateNewsTypeDao.isExist(id);
        if (isValid) {
            updateNewsTypeDao.update(id,type);
            System.out.println("新闻类别：" + type + "已修改！");
            return SUCCESS;
        } else {
            return ERROR;
        }
    }
}
