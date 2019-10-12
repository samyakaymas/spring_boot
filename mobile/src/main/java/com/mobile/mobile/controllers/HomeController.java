package com.mobile.mobile.controllers;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.lang.ProcessBuilder.Redirect;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.util.UriComponentsBuilder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.mobile.mobile.entity.users;
import com.mobile.mobile.service.SecurityService;
import com.mobile.mobile.dao.IusersDao;

@Controller
public class HomeController {
    @Autowired
    private IusersDao dao;
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
        return "notauth";
    }
    // @RequestMapping(value = "/", method=RequestMethod.POST)
    // public String authentication(Model model, @RequestParam(name="username") String username, @RequestParam(name="password") String password, HttpSession session)
    // {
    //     users u = dao.getUserByName(username);
    //     if(password.equals(u.getPassword()))
    //     {
    //         session.setAttribute("user", username);
    //         if(username.equals("admin"))
    //         {
    //             return "redirect:admin";
    //         }
    //         else
    //         {
    //             return "redirect:sales";
    //         }
    //     }
    //     else{
    //         List<users> user = dao.getAllUser();
    //         model.addAttribute("users", user);
    //         model.addAttribute("invalid", "INVALID PASSWORD!");
    //         return "login";
    //     }
    // }
    // @RequestMapping(value="/logout", method = RequestMethod.GET)
    // public String logout(Model model)
    // {
    //     return "redirect:/";
    // }
}