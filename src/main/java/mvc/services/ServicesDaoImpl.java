package mvc.services;

import mvc.dao.UserDao;
import mvc.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class ServicesDaoImpl implements ServicesDao {
    @Autowired
    private UserDao userDao;

    @Override
    @Transactional
    public User userId(int id) {
        return userDao.userId(id);
    }

    @Override
    @Transactional
    public void saveUser(User user) {
        userDao.saveUser(user);
    }

    @Override
    @Transactional
    public void update(User user) {
        userDao.update(user);

    }

    @Override
    @Transactional
    public void delete(int id) {
         userDao.delete(id);

    }

    @Override
    @Transactional
    public List<User> findAll(){ return userDao.findAll();
    }

    @Override
    @Transactional
    public User showUser(String login, String password) {
        return userDao.showUser(login, password);
    }

    @Override
    @Transactional
    public boolean checkLogin(String login) {
        return userDao.checkLogin(login);
    }
}
