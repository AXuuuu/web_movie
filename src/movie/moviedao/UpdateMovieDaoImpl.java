package movie.moviedao;

import movie.hibernate.HibernateSessionFactory;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import java.util.List;

public class UpdateMovieDaoImpl implements UpdateMovieDao {
    HibernateSessionFactory hibernateSessionFactory=new HibernateSessionFactory();

    //判断该电影是否存在
    @Override
    public boolean isExist(int id) {
        boolean isValid=false;
        Session session=hibernateSessionFactory.getSession();
        try{
            String hql="from Movie as m where m.id=:id";
            Query query=session.createQuery(hql);
            query.setParameter("id",id);
            System.out.println("修改的电影编号为"+id);
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
    //修改电影
    @Override
    public boolean update(int id,String title, String img, String type, String introduction, String src) {
        boolean isValid=false;
        Session session=hibernateSessionFactory.getSession();
        Transaction transaction=session.beginTransaction();
        try{
            String hql="update from Movie as m set m.title='"+title+"',m.img='"+img+"',m.type='"+type+"',m.introduction='"
                    +introduction+"',m.src='"+src+"',m.title='"+title+"' where m.id='"+id+"'";
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
