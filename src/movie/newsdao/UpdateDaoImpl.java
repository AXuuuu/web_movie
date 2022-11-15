package movie.newsdao;

import movie.hibernate.HibernateSessionFactory;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

public class UpdateDaoImpl implements UpdateDao{
    HibernateSessionFactory hibernateSessionFactory=new HibernateSessionFactory();

    //判断新闻是否存在
    @Override
    public boolean isExist(int id) {
        boolean isValid=false;
        Session session=hibernateSessionFactory.getSession();
        try{
            String hql="from News as n where n.id=:id";
            Query query=session.createQuery(hql);
            query.setParameter("id",id);
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
    //修改新闻
    @Override
    public boolean update(int id,String title,String type,String content) {
        System.out.println("修改的新闻标题为："+title);
        boolean isValid=false;
        Session session=hibernateSessionFactory.getSession();
        Transaction transaction=session.beginTransaction();
        Date date=new Date();
        SimpleDateFormat sdf=new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
        String time=sdf.format(date);
        try{
            String hql="update from News as n set n.content='"+content+"', n.time='"+time+"',n.state='修改',n.title='"+title+
                    "',n.type='"+type+"' where n.id='"+id+"'";
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
