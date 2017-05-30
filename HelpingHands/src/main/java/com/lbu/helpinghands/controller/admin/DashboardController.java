/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.lbu.helpinghands.controller.admin;

import com.lbu.helpinghands.dao.PostDAO;
import com.lbu.helpinghands.dao.ReplyDAO;
import com.lbu.helpinghands.dao.UserDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 *
 * @author zak
 */
@Controller
@RequestMapping(value = "/admin")
public class DashboardController {

    @Autowired
    private UserDAO userDAO;

    @Autowired
    private PostDAO postDAO;

    @Autowired
    private ReplyDAO replyDAO;

    @RequestMapping(method = RequestMethod.GET)
    public String index(Model model) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String username = auth.getName();
        model.addAttribute("loggedUser", userDAO.getUser(username));
        return "admin/index";
    }

    @RequestMapping(value = "/profile/{id}", method = RequestMethod.GET)
    public String profile(Model model, @PathVariable("id") int id) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String username = auth.getName();
        model.addAttribute("loggedUser", userDAO.getUser(username));
        model.addAttribute("user", userDAO.getById(id));
        model.addAttribute("posts", postDAO.getByUserID(id));
        return "admin/profile";
    }

    @RequestMapping(value = "/post/view/{id}", method = RequestMethod.GET)
    public String viewPost(Model model, @PathVariable("id") int id) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String username = auth.getName();
        model.addAttribute("loggedUser", userDAO.getUser(username));
        model.addAttribute("post", postDAO.getById(id));
        model.addAttribute("replies", replyDAO.getByPostId(id));
        return "admin/postView";
    }
}
