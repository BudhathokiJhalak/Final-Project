/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.lbu.helpinghands.dao.impl;

import com.lbu.helpinghands.dao.ReplyDAO;
import com.lbu.helpinghands.entity.Reply;
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
@Repository(value = "replyDAO")
public class ReplyDAOImpl implements ReplyDAO {

    @Autowired
    private SessionFactory sessionFactory;
    private Session session;
    private Transaction trans;

    @Override
    public List<Reply> getAll() {
        session = sessionFactory.openSession();
        List<Reply> replyList = session.createQuery("SELECT r FROM Reply r ORDER BY r.addedDate DESC").list();
        session.close();
        return replyList;
    }

    @Override
    public void insert(Reply reply) {
        session = sessionFactory.openSession();
        trans = session.beginTransaction();
        session.save(reply);
        trans.commit();
        session.close();
    }

    @Override
    public void update(Reply reply) {
        session = sessionFactory.openSession();
        trans = session.beginTransaction();
        session.update(reply);
        trans.commit();
        session.close();
    }

    @Override
    public void delete(int id) {
        session = sessionFactory.openSession();
        trans = session.beginTransaction();
        session.delete(id);
        trans.commit();
        session.close();
    }

    @Override
    public Reply getById(int id) {
        Reply reply = null;
        session = sessionFactory.openSession();
        reply = (Reply) session.get(Reply.class, id);
        session.close();
        return reply;
    }

    @Override
    public List<Reply> getByPostId(int id) {
        session = sessionFactory.openSession();
        List<Reply> replies = session.createQuery("SELECT r FROM Reply r WHERE r.postId=" + id).list();
        session.close();
        return replies;
    }

    @Override
    public List<Reply> find(String keyword) {
        session = sessionFactory.openSession();
        List<Reply> replyList = session.createQuery("From Reply WHERE description like " + "'%" + keyword + "%'").list();
        session.close();
        return replyList;
    }

}
