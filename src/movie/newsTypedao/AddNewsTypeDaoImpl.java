package movie.newsTypedao;

import movie.entity.NewsType;
import movie.hibernate.HibernateSessionFactory;
import movie.newsTypedao.AddNewsTypeDao;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import java.util.List;

public class AddNewsTypeDaoImpl implements AddNewsTypeDao {
    HibernateSessionFactory hibernateSessionFactory = new HibernateSessionFactory();



    //判断是否有相同的电影类型
    @Override
    public boolean isExist(String type) {
        boolean isValid = false;
        Session session = hibernateSessionFactory.getSession();
        try {
            String hql = "from NewsType as m where m.type=:type";
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
            NewsType NewsType=new NewsType();
            NewsType.setType(type);
            session.save(NewsType);
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
