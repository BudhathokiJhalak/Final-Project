/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.lbu.helpinghands.dao;

import com.lbu.helpinghands.dao.generic.GenericDAO;
import com.lbu.helpinghands.entity.Reply;
import java.util.List;

/**
 *
 * @author zak
 */
public interface ReplyDAO extends GenericDAO<Reply> {

    List<Reply> getByPostId(int id);
    
    List<Reply> find(String keyword);
}
