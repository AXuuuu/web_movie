package movie.moviedao;

import movie.entity.Movie;
import movie.hibernate.HibernateSessionFactory;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import java.util.List;

public class AddMovieDaoImpl implements AddMovieDao {
    HibernateSessionFactory hibernateSessionFactory = new HibernateSessionFactory();



    //判断是否有相同的电影
    @Override
    public boolean isExist(String title) {
        boolean isValid = false;
        Session session = hibernateSessionFactory.getSession();
        try {
            String hql = "from Movie as m where m.title=:title";
            Query query = session.createQuery(hql);
            query.setParameter("title", title);
            System.out.println(title);
            List list = query.list();
            if (list.size() > 0) {
                isValid = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("isExist()方法发生异常！");
        } finally {
            hibernateSessionFactory.closeSession(session);
        }
        return isValid;
    }
    //添加电影
    @Override
    public boolean add(String title,String img,String type,String introduction,String src) {
        Session session = hibernateSessionFactory.getSession();
        Transaction transaction = null;
        boolean isValid = false;
        try {
            transaction = session.beginTransaction();
            Movie movie=new Movie();
            movie.setTitle(title);
            movie.setType(type);
            movie.setImg(img);
            movie.setIntroduction(introduction);
            movie.setSrc(src);
            session.save(movie);
            transaction.commit();
        } catch (Exception e) {
            transaction.rollback();
            e.printStackTrace();
            System.out.println("add()方法发生异常！");
        } finally {
            hibernateSessionFactory.closeSession(session);
        }
        return isValid;
    }
}
