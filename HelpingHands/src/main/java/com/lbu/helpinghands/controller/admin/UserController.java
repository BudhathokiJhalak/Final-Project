/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.lbu.helpinghands.controller.admin;

import com.lbu.helpinghands.dao.IspDAO;
import com.lbu.helpinghands.dao.MailAddressDAO;
import com.lbu.helpinghands.dao.UserDAO;
import com.lbu.helpinghands.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 *
 * @author zak
 */
@Controller
@RequestMapping(value = "/admin/user")
public class UserController {

    @Autowired
    private UserDAO userDAO;

    @Autowired
    private IspDAO ispDAO;

    @Autowired
    private MailAddressDAO mailAddressDAO;

    @RequestMapping(method = RequestMethod.GET)
    public String index(Model model) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String username = auth.getName();
        model.addAttribute("loggedUser", userDAO.getUser(username));
        model.addAttribute("users", userDAO.getAll());
        return "admin/users/index";
    }

    @RequestMapping(value = "/profile/{id}", method = RequestMethod.GET)
    public String profile(Model model, @PathVariable("id") int id) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String username = auth.getName();
        model.addAttribute("loggedUser", userDAO.getUser(username));
        model.addAttribute("user", userDAO.getById(id));
        return "admin/users/profile";
    }

    @RequestMapping(value = "/edit/{id}", method = RequestMethod.GET)
    public String update(Model model, @PathVariable("id") int id) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String username = auth.getName();
        model.addAttribute("loggedUser", userDAO.getUser(username));
        model.addAttribute("user", userDAO.getById(id));
        return "admin/users/update";
    }

    @RequestMapping(value = "/delete/{id}", method = RequestMethod.GET)
    public String delete(@PathVariable("id") int id) {
        userDAO.delete(id);
        return "redirect:/admin/user?success";
    }

    @RequestMapping(value = "/save", method = RequestMethod.POST)
    public String save(@ModelAttribute("user") User user) {
        if (user.getUserId() == null) {
            userDAO.insert(user);
        } else {
            userDAO.update(user);
        }
        return "redirect:/admin/user?success";
    }

    @RequestMapping(value = "/add", method = RequestMethod.GET)
    public String add(Model model) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String username = auth.getName();
        model.addAttribute("loggedUser", userDAO.getUser(username));
        return "admin/users/insert";
    }

    @RequestMapping(value = "/mail/{id}", method = RequestMethod.GET)
    public String mail(Model model, @PathVariable("id") int id) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String username = auth.getName();
        model.addAttribute("loggedUser", userDAO.getUser(username));
        model.addAttribute("user", userDAO.getById(id));
        model.addAttribute("isps", ispDAO.getAll());
        model.addAttribute("mailAddress", mailAddressDAO.getAll());
        return "admin/users/mail";
    }
    
    @RequestMapping(value = "/search", method = RequestMethod.POST)
    public String search(Model model, String name) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String username = auth.getName();
        model.addAttribute("loggedUser", userDAO.getUser(username));
        model.addAttribute("users", userDAO.findByName(name));
        return "admin/search/findingUser";
    }
}
