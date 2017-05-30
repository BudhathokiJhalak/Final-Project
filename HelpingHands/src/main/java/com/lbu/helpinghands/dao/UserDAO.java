/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.lbu.helpinghands.dao;

import com.lbu.helpinghands.dao.generic.GenericDAO;
import com.lbu.helpinghands.entity.User;
import java.util.List;

/**
 *
 * @author zak
 */
public interface UserDAO extends GenericDAO<User> {

    User getUser(String username);

    List<User> findByName(String name);
}
