/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.lbu.helpinghands.controller.user;

import com.lbu.helpinghands.dao.PostDAO;
import com.lbu.helpinghands.dao.ReplyDAO;
import com.lbu.helpinghands.dao.UserDAO;
import com.lbu.helpinghands.entity.Post;
import com.lbu.helpinghands.entity.Reply;
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
@RequestMapping(value = "/home")
public class UsersController {

    @Autowired
    private PostDAO postDAO;

    @Autowired
    private ReplyDAO replyDAO;

    @Autowired
    private UserDAO userDAO;

    @RequestMapping(method = RequestMethod.GET)
    public String home(Model model) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String username = auth.getName();
        model.addAttribute("loggedUser", userDAO.getUser(username));
        model.addAttribute("posts", postDAO.getAll());
        return "user/index";
    }

    @RequestMapping(value = "/profile/{id}", method = RequestMethod.GET)
    public String profile(Model model, @PathVariable("id") int id) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String username = auth.getName();
        model.addAttribute("loggedUser", userDAO.getUser(username));
        model.addAttribute("user", userDAO.getById(id));
        model.addAttribute("posts", postDAO.getByUserID(id));
        return "user/profile";
    }
    
    @RequestMapping(value = "/profile/update/{id}")
    public String profileUpdate(Model model, @PathVariable("id") int id){
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String username = auth.getName();
        model.addAttribute("loggedUser", userDAO.getUser(username));
        model.addAttribute("user", userDAO.getById(id));
        return "user/profileUpdate";
    }

    @RequestMapping(value = "/post/save", method = RequestMethod.POST)
    public String addPost(@ModelAttribute("post") Post post) {
        if (post.getPostId() == null) {
            postDAO.insert(post);
        } else {
            postDAO.update(post);
        }
        return "redirect:/home";
    }

    @RequestMapping(value = "/reply/save", method = RequestMethod.POST)
    public String addReply(@ModelAttribute("reply") Reply reply) {
        replyDAO.insert(reply);
        return "redirect:/home";
    }

    @RequestMapping(value = "/post/view/{id}", method = RequestMethod.GET)
    public String viewPost(Model model, @PathVariable("id") int id) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String username = auth.getName();
        model.addAttribute("loggedUser", userDAO.getUser(username));
        model.addAttribute("post", postDAO.getById(id));
        model.addAttribute("replies", replyDAO.getByPostId(id));
        return "user/postView";
    }

    @RequestMapping(value = "/post/update/{id}", method = RequestMethod.GET)
    public String updatePost(Model model, @PathVariable("id") int id) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String username = auth.getName();
        model.addAttribute("loggedUser", userDAO.getUser(username));
        model.addAttribute("post", postDAO.getById(id));
        return "user/updatePost";
    }

    @RequestMapping(value = "/post/search", method = RequestMethod.POST)
    public String search(Model model, String keyword) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String username = auth.getName();
        model.addAttribute("loggedUser", userDAO.getUser(username));
        model.addAttribute("posts", postDAO.find(keyword));
        return "user/finding";
    }

    @RequestMapping(value = "/post/delete/{id}", method = RequestMethod.GET)
    public String deletePost(@PathVariable("id") int id) {
        postDAO.delete(id);
        return "redirect:/home";
    }
}
