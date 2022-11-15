package movie.newsdao;

import movie.entity.News;
import movie.hibernate.HibernateSessionFactory;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

public class DeleteDaoImpl implements DeleteDao {
    HibernateSessionFactory hibernateSessionFactory = new HibernateSessionFactory();

    //删除新闻
    @Override
    public void delete(int id) {
        Session session = hibernateSessionFactory.getSession();
        Transaction transaction=null;
        try {
            transaction=session.beginTransaction();
            String hql="delete from News as n where n.id=:id";
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
