/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.lbu.helpinghands.dao.impl;

import com.lbu.helpinghands.dao.UserDAO;
import com.lbu.helpinghands.entity.User;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

/**
 *
 * @author zak
 */
@Repository(value = "userDAO")
public class UserDAOImpl implements UserDAO {

    @Autowired
    private SessionFactory sessionFactory;
    private Session session;
    private Transaction trans;

    @Override
    public List<User> getAll() {
        session = sessionFactory.openSession();
        List<User> userList = session.createQuery("SELECT u FROM User u").list();
        session.close();
        return userList;
    }

    @Override
    public void insert(User user) {
        session = sessionFactory.openSession();
        trans = session.beginTransaction();
        session.save(user);
        trans.commit();
        session.close();
    }

    @Override
    public void update(User user) {
        session = sessionFactory.openSession();
        trans = session.beginTransaction();
        session.update(user);
        trans.commit();
        session.close();
    }

    @Override
    public void delete(int id) {
        session = sessionFactory.openSession();
        trans = session.beginTransaction();
        User user = (User) session.get(User.class, id);
        session.delete(user);
        trans.commit();
        session.close();
    }

    @Override
    public User getById(int id) {
        User user = null;
        session = sessionFactory.openSession();
        user = (User) session.get(User.class, id);
        session.close();
        return user;
    }

    @Override
    public User getUser(String username) {
        User user = null;
        session = sessionFactory.openSession();
        Query query = session.createQuery("from User where username=:username");
        query.setParameter("username", username);
        user = (User) query.uniqueResult();
        session.close();
        return user;
    }

    @Override
    public List<User> findByName(String name) {
        session = sessionFactory.openSession();
        List<User> usersList = session.createQuery("From User WHERE firstName like " + "'%" + name + "%'").list();
        session.close();
        return usersList;
    }

}
