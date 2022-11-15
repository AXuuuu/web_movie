package movie.userdao;

import movie.hibernate.HibernateSessionFactory;
import org.hibernate.Session;
import org.hibernate.query.Query;

import java.util.List;


public class LoginDaoImpl implements LoginDao {
    HibernateSessionFactory hibernateSessionFactory = new HibernateSessionFactory();

    @Override
    public boolean login(String useraccount, String userpassword) {
        Session session = hibernateSessionFactory.getSession();
        boolean isValid = false;
        try {
            String hql = "from User as u where u.useraccount=:useraccount and u.userpassword=:userpassword";
            Query query = session.createQuery(hql);
            query.setParameter("useraccount", useraccount);
            query.setParameter("userpassword", userpassword);
            System.out.println(useraccount);
            System.out.println(userpassword);
            List list = query.list();
            if (list.size() > 0) {
                isValid = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("login()方法异常！！！");
        } finally {
            hibernateSessionFactory.closeSession(session);
        }
        return isValid;
    }
}
