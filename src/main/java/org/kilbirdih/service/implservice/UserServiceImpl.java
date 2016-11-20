package org.kilbirdih.service.implservice;

import org.kilbirdih.model.User;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.kilbirdih.service.UserService;

import javax.annotation.Resource;
import java.util.List;

@Service(value = "userService")
@Transactional
public class UserServiceImpl implements UserService
{
    @Resource(name = "sessionFactory")
    private SessionFactory sessionFactory;

    @Override
    public void createUser(User user)
    {
        Session session = sessionFactory.getCurrentSession();
        session.save(user);
    }

    @Override
    public void updateUser(User user)
    {
        Session session = sessionFactory.getCurrentSession();

        User changingUser =(User) session.get(User.class, user.getId());

        changingUser.setName(user.getName());
        changingUser.setAge(user.getAge());
        changingUser.setAdmin(user.isAdmin());
        changingUser.setCreateDate(user.getCreateDate());

        session.save(changingUser);
    }

    @Override
    public void deleteUser(Long id)
    {
        Session session = sessionFactory.getCurrentSession();
        User user =(User) session.get(User.class, id);
        session.delete(user);
    }

    @Override
    public User getUser(Long id)
    {
        Session session = sessionFactory.getCurrentSession();

        return (User) session.get(User.class, id);
    }

    @Override
    public List getAllUsers()
    {
        Session session = sessionFactory.getCurrentSession();
        Query getUsers = session.createQuery("FROM User");

        return getUsers.list();
    }
}
