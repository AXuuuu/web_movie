package movie.movieTypedao;

import movie.entity.MovieType;
import movie.hibernate.HibernateSessionFactory;
import movie.movieTypedao.AddMovieTypeDao;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import java.util.List;

public class AddMovieTypeDaoImpl implements AddMovieTypeDao {
    HibernateSessionFactory hibernateSessionFactory = new HibernateSessionFactory();



    //判断是否有相同的电影类型
    @Override
    public boolean isExist(String type) {
        boolean isValid = false;
        Session session = hibernateSessionFactory.getSession();
        try {
            String hql = "from MovieType as m where m.type=:type";
            Query query = session.createQuery(hql);
            query.setParameter("type", type);
            System.out.println(type);
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
    //添加电影类型
    @Override
    public boolean add(String type) {
        Session session = hibernateSessionFactory.getSession();
        Transaction transaction = null;
        boolean isValid = false;
        try {
            transaction = session.beginTransaction();
            MovieType movieType=new MovieType();
            movieType.setType(type);
            session.save(movieType);
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
