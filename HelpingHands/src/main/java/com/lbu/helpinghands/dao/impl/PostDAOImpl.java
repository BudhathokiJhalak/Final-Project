/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.lbu.helpinghands.dao.impl;

import com.lbu.helpinghands.dao.PostDAO;
import com.lbu.helpinghands.entity.Post;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

/**
 *
 * @author zak
 */
@Repository(value = "postDAO")
public class PostDAOImpl implements PostDAO {

    @Autowired
    private SessionFactory sessionFactory;
    private Session session;
    private Transaction trans;

    @Override
    public List<Post> getAll() {
        session = sessionFactory.openSession();
        List<Post> postList = session.createQuery("SELECT p FROM Post p ORDER BY p.addedDate DESC").list();
        session.close();
        return postList;
    }

    @Override
    public void insert(Post post) {
        session = sessionFactory.openSession();
        trans = session.beginTransaction();
        session.save(post);
        trans.commit();
        session.close();
    }

    @Override
    public void update(Post post) {
        session = sessionFactory.openSession();
        trans = session.beginTransaction();
        session.update(post);
        trans.commit();
        session.close();
    }

    @Override
    public void delete(int id) {
        session = sessionFactory.openSession();
        trans = session.beginTransaction();
        Post post = (Post) session.get(Post.class, id);
        session.delete(post);
        trans.commit();
        session.close();
    }

    @Override
    public Post getById(int id) {
        Post post = null;
        session = sessionFactory.openSession();
        post = (Post) session.get(Post.class, id);
        session.close();
        return post;
    }

    @Override
    public List<Post> getByUserID(int id) {
        session = sessionFactory.openSession();
        List<Post> posts = session.createQuery("SELECT p FROM Post p WHERE p.userId=" + id + "ORDER BY p.addedDate DESC").list();
        session.close();
        return posts;
    }

    @Override
    public List<Post> find(String keyword) {
        session = sessionFactory.openSession();
        List<Post> postsList = session.createQuery("From Post WHERE description like " + "'%" + keyword + "%'").list();
        session.close();
        return postsList;
    }

}
