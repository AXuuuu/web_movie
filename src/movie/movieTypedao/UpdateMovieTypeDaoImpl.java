package movie.movieTypedao;

import movie.hibernate.HibernateSessionFactory;
import movie.movieTypedao.UpdateMovieTypeDao;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import java.util.List;

public class UpdateMovieTypeDaoImpl implements UpdateMovieTypeDao {
    HibernateSessionFactory hibernateSessionFactory=new HibernateSessionFactory();

    //判断该电影类型是否存在
    @Override
    public boolean isExist(int id) {
        boolean isValid=false;
        Session session=hibernateSessionFactory.getSession();
        try{
            String hql="from MovieType as m where m.id=:id";
            Query query=session.createQuery(hql);
            query.setParameter("id",id);
            System.out.println("修改的电影类型编号为"+id);
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
        System.out.println(isValid);
        return isValid;
    }
    //修改电影
    @Override
    public boolean update(int id,String type) {
        System.out.println("修改的电影类型为："+type);
        boolean isValid=false;
        Session session=hibernateSessionFactory.getSession();
        Transaction transaction=session.beginTransaction();
        try{
            String hql="update from MovieType as m set m.type='"+type+"' where m.id='"+id+"'";
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
