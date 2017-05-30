/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.lbu.helpinghands.controller.admin;

import com.lbu.helpinghands.dao.PostDAO;
import com.lbu.helpinghands.dao.UserDAO;
import com.lbu.helpinghands.entity.Post;
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
@RequestMapping(value = "/admin/post")
public class PostController {

    @Autowired
    private PostDAO postDAO;
    
    @Autowired
    private UserDAO userDAO;

    @RequestMapping(method = RequestMethod.GET)
    public String index(Model model) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String username = auth.getName();
        model.addAttribute("loggedUser", userDAO.getUser(username));
        model.addAttribute("posts", postDAO.getAll());
        return "admin/post/index";
    }

    @RequestMapping(value = "/edit/{id}", method = RequestMethod.GET)
    public String update(Model model, @PathVariable("id") int id) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String username = auth.getName();
        model.addAttribute("loggedUser", userDAO.getUser(username));
        model.addAttribute("post", postDAO.getById(id));
        return "admin/post/update";
    }

    @RequestMapping(value = "/save", method = RequestMethod.POST)
    public String save(@ModelAttribute("post") Post post) {
        postDAO.update(post);
        return "redirect:/admin/post?success";
    }

    @RequestMapping(value = "/delete/{id}", method = RequestMethod.GET)
    public String delete(@PathVariable("id") int id) {
        postDAO.delete(id);
        return "redirect:/admin/post?success";
    }

    @RequestMapping(value = "/desc/{id}", method = RequestMethod.GET)
    public String desc(Model model, @PathVariable("id") int id) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String username = auth.getName();
        model.addAttribute("loggedUser", userDAO.getUser(username));
        model.addAttribute("post", postDAO.getById(id));
        return "admin/post/desc";
    }
    
    @RequestMapping(value = "/search", method = RequestMethod.POST)
    public String search(Model model, String keyword) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String username = auth.getName();
        model.addAttribute("loggedUser", userDAO.getUser(username));
        model.addAttribute("posts", postDAO.find(keyword));
        return "admin/search/findingPost";
    }
}
