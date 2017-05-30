/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.lbu.helpinghands.dao.generic;

import java.util.List;

/**
 *
 * @author zak
 */
public interface GenericDAO<T> {

    List<T> getAll();

    void insert(T t);

    void update(T t);

    void delete(int id);

    T getById(int id);
}
