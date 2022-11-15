package movie.userdao;

import movie.entity.User;
import movie.hibernate.HibernateSessionFactory;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import java.util.List;

public class SignDaoImpl implements SignDao {
    HibernateSessionFactory hibernateSessionFactory = new HibernateSessionFactory();

    //注册验证
    @Override
    public boolean isExist(String useraccount) {
        boolean isValid = false;
        Session session = hibernateSessionFactory.getSession();
        try {
            String hql = "from User as u where u.useraccount=:useraccount";
            Query query = session.createQuery(hql);
            query.setParameter("useraccount", useraccount);
            System.out.println(useraccount);
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

    //注册
    @Override
    public boolean add(String username, String useraccount, String usersex, String userage, String userpassword, String usertell, String useraddress) {
        Session session = hibernateSessionFactory.getSession();
        Transaction transaction = null;
        boolean isValid = false;
        try {
            transaction = session.beginTransaction();
            User user = new User();
            user.setUsername(username);
            user.setUseraccount(useraccount);
            user.setUsersex(usersex);
            user.setUserage(userage);
            user.setUserpassword(userpassword);
            user.setUsertell(usertell);
            user.setUseraddress(useraddress);
            session.save(user);
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
