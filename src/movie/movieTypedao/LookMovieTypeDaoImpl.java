package movie.movieTypedao;

import movie.entity.MovieType;
import movie.hibernate.HibernateSessionFactory;
import org.apache.struts2.ServletActionContext;
import org.hibernate.Session;
import org.hibernate.query.Query;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import java.util.List;

public class LookMovieTypeDaoImpl implements LookMovieTypeDao {
    HibernateSessionFactory hibernateSessionFactory=new HibernateSessionFactory();


    //浏览电影类型
    @Override
    public List<MovieType> look() {
        Session session=hibernateSessionFactory.getSession();
        try{

            String hql="from MovieType ";
            Query query=session.createQuery(hql);
            List list=query.list();
            HttpServletRequest request= ServletActionContext.getRequest();
            request.setAttribute("list",list);
            RequestDispatcher rd=request.getRequestDispatcher("movietype.jsp");
            return list;
        }catch (Exception e){
            e.printStackTrace();
            System.out.println("look()方法发生异常！");
            return null;
        }
    }

    @Override
    public List<MovieType> searchMovieType(String type) {
        Session session=hibernateSessionFactory.getSession();
        try{
            String hql="from MovieType m where m.type=:type";
            Query query=session.createQuery(hql);
            query.setParameter("type",type);
            List list=query.list();
            HttpServletRequest request=ServletActionContext.getRequest();
            request.setAttribute("list",list);
            return list;
        }catch (Exception e){
            e.printStackTrace();
            System.out.println("searchMovieType()方法异常");
            return null;
        }
    }
}
