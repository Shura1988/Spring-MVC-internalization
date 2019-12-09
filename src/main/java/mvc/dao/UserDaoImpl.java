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

    @Override
    public User userId(int id) {
        Session session = sessionFactory.getCurrentSession();
        User user = session.get(User.class, id);
        return user;
    }

    @Override
    public void saveUser(User user) {
        try {
            Session session = sessionFactory.getCurrentSession();
            session.persist(user);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public void update(User user) {
        try {
            Session session = sessionFactory.getCurrentSession();
            session.merge(user);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public void delete(int id) {
        try {
            Session session = sessionFactory.getCurrentSession();
            session.delete(session.get(User.class, id));

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

        Session session = sessionFactory.getCurrentSession();
        Query query = (Query) session.createNativeQuery("select * from user WHERE login= :login and password= :password", User.class);
        query.setParameter("login", login);
        query.setParameter("password", password);
        User user = (User) query.uniqueResult();

        return user;

    }

    public boolean checkLogin(String login) {
        Session session = sessionFactory.getCurrentSession();
        Query query = (Query) session.createNativeQuery("select * from user WHERE login= :login", User.class);
        query.setParameter("login", login);
        try {
            query.getSingleResult();
        } catch (Exception e) {
            return false;
        }
        return true;
    }
}
