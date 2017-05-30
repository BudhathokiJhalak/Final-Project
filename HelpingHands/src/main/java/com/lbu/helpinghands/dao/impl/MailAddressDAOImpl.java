/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.lbu.helpinghands.dao.impl;

import com.lbu.helpinghands.dao.MailAddressDAO;
import com.lbu.helpinghands.entity.MailAddress;
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
@Repository(value = "mailAddressDAO")
public class MailAddressDAOImpl implements MailAddressDAO {

    @Autowired
    private SessionFactory sessionFactory;
    private Session session;
    private Transaction trans;

    @Override
    public List<MailAddress> getAll() {
        session = sessionFactory.openSession();
        List<MailAddress> mailAddressesList = session.createQuery("SELECT ma FROM MailAddress ma").list();
        session.close();
        return mailAddressesList;
    }

    @Override
    public void insert(MailAddress ma) {
        session = sessionFactory.openSession();
        trans = session.beginTransaction();
        session.save(ma);
        trans.commit();
        session.close();
    }

    @Override
    public void update(MailAddress ma) {
        session = sessionFactory.openSession();
        trans = session.beginTransaction();
        session.update(ma);
        trans.commit();
        session.close();
    }

    @Override
    public void delete(int id) {
        session = sessionFactory.openSession();
        trans = session.beginTransaction();
        MailAddress ma = (MailAddress) session.get(MailAddress.class, id);
        session.delete(ma);
        trans.commit();
        session.close();
    }

    @Override
    public MailAddress getById(int id) {
        MailAddress ma = null;
        session = sessionFactory.openSession();
        ma = (MailAddress) session.get(MailAddress.class, id);
        session.close();
        return ma;
    }

}
