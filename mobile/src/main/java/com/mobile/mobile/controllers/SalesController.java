package com.mobile.mobile.controllers;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.lang.ProcessBuilder.Redirect;
import java.sql.Date;
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

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.mobile.mobile.entity.customer;
import com.mobile.mobile.entity.users;
import com.mobile.mobile.dao.IusersDao;
import com.mobile.mobile.dao.accessoryDao;
import com.mobile.mobile.dao.customerDao;
import com.mobile.mobile.dao.mobileDao;
import com.mobile.mobile.dao.salesDao;


@Controller
public class SalesController
{
    @Autowired
    private IusersDao dao;
    @Autowired
    private customerDao custdao;
    @Autowired
    private salesDao salesdao;
    @Autowired
    private mobileDao mobiledao;
    @Autowired
    private accessoryDao accdao;
    @RequestMapping(value= "sales", method = RequestMethod.GET)
    public String saleshome(HttpSession session, Model model)
    {
        if(session.getAttribute("user")==null)
        {
            return "redirect:/";
        }
        else if(session.getAttribute("user").equals("admin"))
        {
            return "notauth";
        }
        else
            return "sales_home";
    }
    @RequestMapping(value= "sales/customer", method = RequestMethod.GET)
    public String customer(HttpSession session, Model model)
    {
        model.addAttribute("list", custdao.getCustomer("", "", "", 0));
        return "sales_customer";
    }
    @RequestMapping(value= "sales/customer", method = RequestMethod.POST)
    public String customera(HttpSession session, Model model,
                            @RequestParam("name") String name,
                            @RequestParam("address") String address,
                            @RequestParam("dob") String dob,
                            @RequestParam("reference") Integer reference,
                            @RequestParam("mobiles[]") List<Long> numbers)
    {   
        model.addAttribute("outcome", custdao.addCustomer(name, address, Date.valueOf(dob), reference, numbers));
        model.addAttribute("list", custdao.getCustomer("", "", "", 0));
        return "sales_customer";
    }
    @RequestMapping(value= "sales/sale", method = RequestMethod.GET)
    public String sale(HttpSession session, Model model)
    {
        model.addAttribute("customers", custdao.getCustomer("", "", "", 0));
        model.addAttribute("mobiles", mobiledao.getMobiles("", "", "", "", false));
        model.addAttribute("accessories", accdao.getAccessories("", "", "", ""));
        model.addAttribute("mstock", salesdao.getMstock());
        model.addAttribute("asrock", salesdao.getAstock());
        return "sales_sale";
    }
    @RequestMapping(value= "sales/sale", method = RequestMethod.POST)
    public String salep(HttpSession session, Model model,
                        @RequestParam("ids[]") List<Long> ids,
                        @RequestParam("prices[]") List<Integer> prices,
                        @RequestParam("cid") Integer cid,
                        @RequestParam("date") String date,
                        @RequestParam("moa") String moa)
    {
        model.addAttribute("outcome", salesdao.addSale(cid, 1, moa, Date.valueOf(date), ids, prices));
        model.addAttribute("customers", custdao.getCustomer("", "", "", 0));
        model.addAttribute("mobiles", mobiledao.getMobiles("", "", "", "", false));
        model.addAttribute("accessories", accdao.getAccessories("", "", "", ""));
        model.addAttribute("mstock", salesdao.getMstock());
        model.addAttribute("asrock", salesdao.getAstock());
        return "sales_sale";
    }
}