package mvc.dao;

import mvc.model.User;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.NativeQuery;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


import java.util.ArrayList;
import java.util.List;

@Repository
public class UserDaoImpl implements UserDao {
    @Autowired
    private SessionFactory sessionFactory;

    Transaction tr1 = null;
    @Override
    public User userId(int id) {
        Session session =sessionFactory.openSession();
        tr1 = session.beginTransaction();
        User user = session.get(User.class, id);
        tr1.commit();
        session.close();

        return user;
    }

    @Override
    public void saveUser(User user) {
        try {
            Session session =sessionFactory.openSession();
            tr1 = session.beginTransaction();
            session.persist(user);
            tr1.commit();
            session.close();
        } catch (Exception e) {
            if (tr1 != null) {
                tr1.rollback();
            }
            e.printStackTrace();
        }
    }

    @Override
    public void update(User user) {

        Session session = sessionFactory.getCurrentSession();
        session.merge(user);
    }

    @Override
    public void delete(int id) {
        try {
            Session session =sessionFactory.openSession();
            Transaction tx1 = session.beginTransaction();
            session.delete(session.get(User.class, id));
            tx1.commit();
            session.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public List<User> findAll() {
        Session session = sessionFactory.getCurrentSession();
          return session.createNativeQuery("select * from mvc3.user", User.class).list();
    }

    public User showUser(String login, String password) {
        Session session =sessionFactory.openSession();
        tr1 = session.beginTransaction();
        Query query = (Query) session.createNativeQuery("select * from user WHERE login= :login and password= :password", User.class);
        query.setParameter("login", login);
        query.setParameter("password", password);
        User user = (User) query.uniqueResult();
        tr1.commit();
        session.close();
        return user;

    }

    public boolean checkLogin(String login) {
        Session session =sessionFactory.openSession();
        tr1 = session.beginTransaction();
        Query query = (Query) session.createNativeQuery("select * from user WHERE login= :login", User.class);
        query.setParameter("login", login);
        tr1.commit();
        session.close();
        try{
            query.getSingleResult();
        }catch (Exception e){
            return false;
        }
        return true;
    }
}
