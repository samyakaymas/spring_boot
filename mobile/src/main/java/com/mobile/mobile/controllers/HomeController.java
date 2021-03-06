package com.mobile.mobile.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.beans.factory.annotation.Autowired;

import javax.servlet.http.HttpSession;

import com.mobile.mobile.service.SecurityService;

@Controller
public class HomeController {
    
    @Autowired
    private SecurityService securityservice;

    @RequestMapping(value = "", method=RequestMethod.GET)
    public String home(Model model, HttpSession session, String error, String logout)
    {
        System.out.println(securityservice.findLoggedInUsername());
        if (error != null)
            model.addAttribute("error", "Your username and password is invalid.");

        if (logout != null)
            model.addAttribute("message", "You have been logged out successfully.");
        
        if(securityservice.findLoggedInUsername() == null)
        {
            return "login";
        }
        if(securityservice.findLoggedInUsername().equals("admin"))
        {
            return "redirect:/admin";
        }
        return "redirect:/sales";
    }
    @RequestMapping(value = "/403", method=RequestMethod.GET)
    public String notauth()
    {
        return "403";
    }

}