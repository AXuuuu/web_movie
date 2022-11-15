package movie.userdao;

import movie.hibernate.HibernateSessionFactory;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import java.util.List;

public class RetrieveDaoImpl implements RetrieveDao {
    HibernateSessionFactory hibernateSessionFactory=new HibernateSessionFactory();

    //验证该账号是否存在
    @Override
    public boolean isExist(String useraccount) {
        boolean isValid=false;
        Session session=hibernateSessionFactory.getSession();
        try{
            String hql="from User as u where u.useraccount=:useraccount";
            Query query=session.createQuery(hql);
            query.setParameter("useraccount",useraccount);
            System.out.println("修改密码的账号为"+useraccount);
            List list=query.list();
            if(list.size()>0){
                isValid=true;
            }
        }catch (Exception e){
            e.printStackTrace();
            System.out.println("isExist()方法发生异常！");
        }finally {
            hibernateSessionFactory.closeSession(session);
        }
        return isValid;
    }
    //修改密码
    @Override
    public boolean update(String useraccount, String userpassword) {
        System.out.println("修改的密码为"+userpassword);
        boolean isValid=false;
        Session session=hibernateSessionFactory.getSession();
        Transaction transaction=session.beginTransaction();
        try{
            String hql="update from User as u set u.userpassword='"+userpassword+"' where u.useraccount='"+useraccount+"'";
            Query query=session.createQuery(hql);
            query.executeUpdate();
            transaction.commit();
        }catch (Exception e){
            e.printStackTrace();
            System.out.println("update()方法异常！");
        }finally {
            hibernateSessionFactory.closeSession(session);
        }
        return isValid;
    }
}
