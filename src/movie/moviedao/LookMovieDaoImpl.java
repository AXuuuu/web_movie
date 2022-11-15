package movie.moviedao;

import movie.hibernate.HibernateSessionFactory;
import org.apache.struts2.ServletActionContext;
import org.hibernate.Session;
import org.hibernate.query.Query;
import movie.entity.Movie;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import java.util.List;

public class LookMovieDaoImpl implements LookMovieDao{
    HibernateSessionFactory hibernateSessionFactory=new HibernateSessionFactory();


    //浏览电影
    @Override
    public List<Movie> look() {
        Session session=hibernateSessionFactory.getSession();
        try{
            Movie movie=new Movie();
            String hql="from Movie ";
            Query query=session.createQuery(hql);
            List list=query.list();
            HttpServletRequest request= ServletActionContext.getRequest();
            request.setAttribute("list",list);
            RequestDispatcher rd=request.getRequestDispatcher("movie.jsp");
            return list;
        }catch (Exception e){
            e.printStackTrace();
            System.out.println("look()方法发生异常！");
            return null;
        }
    }

    @Override
    public List<Movie> lookType(String type) {
        Session session=hibernateSessionFactory.getSession();
        try{

            String hql="from Movie m where m.type=:type";
            Query query=session.createQuery(hql);
            query.setParameter("type",type);
            List list=query.list();
            HttpServletRequest request= ServletActionContext.getRequest();
            request.setAttribute("list",list);
            return list;
        }catch (Exception e){
            e.printStackTrace();
            System.out.println("lookType()方法发生异常！");
            return null;
        }
    }

    @Override
    public List<Movie> searchMovie(String title) {
        Session session=hibernateSessionFactory.getSession();
        try {
            String hql="from Movie m where m.title=:title";
            Query query=session.createQuery(hql);
            query.setParameter("title",title);
            List list=query.list();
            HttpServletRequest request=ServletActionContext.getRequest();
            request.setAttribute("list",list);
            return list;
        }catch (Exception e){
            e.printStackTrace();
            System.out.println("searcherMovie()方法异常！");
            return null;
        }

    }
}
