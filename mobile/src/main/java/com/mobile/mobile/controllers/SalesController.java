package com.mobile.mobile.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.sql.Date;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;

import javax.servlet.http.HttpSession;

import com.mobile.mobile.service.SecurityService;
import com.mobile.mobile.dao.accessoryDao;
import com.mobile.mobile.dao.customerDao;
import com.mobile.mobile.dao.mobileDao;
import com.mobile.mobile.dao.salesDao;


@Controller
public class SalesController
{
    @Autowired
    private customerDao custdao;
    @Autowired
    private salesDao salesdao;
    @Autowired
    private mobileDao mobiledao;
    @Autowired
    private accessoryDao accdao;
    @Autowired
    private SecurityService securityservice;
    @RequestMapping(value= "sales", method = RequestMethod.GET)
    public String saleshome(HttpSession session, Model model)
    {
        model.addAttribute("p", salesdao.getSData(securityservice.findLoggedInUsername()));
        return "sales_home";
    }
    @RequestMapping(value= "sales/customer", method = RequestMethod.GET)
    public String customer(HttpSession session, Model model)
    {
        model.addAttribute("list", custdao.getCustomer("", "", ""));
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
        model.addAttribute("list", custdao.getCustomer("", "", ""));
        return "sales_customer";
    }
    @RequestMapping(value= "sales/sale", method = RequestMethod.GET)
    public String sale(HttpSession session, Model model)
    {
        model.addAttribute("customers", custdao.getCustomer("", "", ""));
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
        model.addAttribute("outcome", salesdao.addSale(cid,securityservice.findLoggedInUsername() , moa, Date.valueOf(date), ids, prices));
        model.addAttribute("customers", custdao.getCustomer("", "", ""));
        model.addAttribute("mobiles", mobiledao.getMobiles("", "", "", "", false));
        model.addAttribute("accessories", accdao.getAccessories("", "", "", ""));
        model.addAttribute("mstock", salesdao.getMstock());
        model.addAttribute("asrock", salesdao.getAstock());
        return "sales_sale";
    }
}