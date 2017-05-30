/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.lbu.helpinghands.dao.impl;

import com.lbu.helpinghands.dao.IspDAO;
import com.lbu.helpinghands.entity.Isp;
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
@Repository(value = "ispDAO")
public class IspDAOImpl implements IspDAO {

    @Autowired
    private SessionFactory sessionFactory;
    private Session session;
    private Transaction trans;

    @Override
    public List<Isp> getAll() {
        session = sessionFactory.openSession();
        List<Isp> ispList = session.createQuery("SELECT i FROM Isp i").list();
        session.close();
        return ispList;
    }

    @Override
    public void insert(Isp t) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void update(Isp t) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void delete(int id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public Isp getById(int id) {
        Isp isp = null;
        session = sessionFactory.openSession();
        isp = (Isp) session.get(Isp.class, id);
        session.close();
        return isp;
    }

}
