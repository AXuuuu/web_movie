package movie.movieTypedao;

import movie.hibernate.HibernateSessionFactory;
import movie.moviedao.DeleteMovieDao;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

public class DeleteMovieTypeDaoImpl implements DeleteMovieTypeDao {
    HibernateSessionFactory hibernateSessionFactory = new HibernateSessionFactory();


    //删除电影类型
    @Override
    public void delete(int id) {
        Session session = hibernateSessionFactory.getSession();
        Transaction transaction=null;
        try {
            transaction=session.beginTransaction();
            String hql="delete from MovieType as m where m.id=:id";
            Query query = session.createQuery(hql);
            query.setParameter("id",id);
            query.executeUpdate();
            transaction.commit();
        } catch (Exception e) {
            System.out.println("delete()方法发生异常！");
            e.printStackTrace();
        } finally {
            hibernateSessionFactory.closeSession(session);
        }
    }
}
