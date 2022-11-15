package movie.newsdao;

import movie.entity.News;
import movie.hibernate.HibernateSessionFactory;
import org.apache.struts2.ServletActionContext;
import org.hibernate.Session;
import org.hibernate.query.Query;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import java.util.List;

public class LookDaoImpl implements LookDao{
    HibernateSessionFactory hibernateSessionFactory=new HibernateSessionFactory();


    //浏览新闻
    @Override
    public List<News> look() {
        Session session=hibernateSessionFactory.getSession();
        try{

            String hql="from News";
            Query query=session.createQuery(hql);
            List list=query.list();
            HttpServletRequest request= ServletActionContext.getRequest();
            request.setAttribute("list",list);
            RequestDispatcher rd=request.getRequestDispatcher("news.jsp");
            return list;
        }catch (Exception e){
            e.printStackTrace();
            System.out.println("look()方法发生异常！");
            return null;
        }
    }

    @Override
    public List<News> searchNews(String title) {
        Session session=hibernateSessionFactory.getSession();
        try{

            String hql="from News n where n.title=:title";
            Query query=session.createQuery(hql);
            query.setParameter("title",title);
            List list=query.list();
            HttpServletRequest request=ServletActionContext.getRequest();
            request.setAttribute("list",list);
            return list;
        }catch (Exception e){
            e.printStackTrace();
            System.out.println("searchNews()方法异常！");
            return null;
        }
    }
}
