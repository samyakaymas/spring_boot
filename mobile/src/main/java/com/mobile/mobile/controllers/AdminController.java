package com.mobile.mobile.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.sql.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ModelAttribute;

import javax.servlet.http.HttpSession;

import com.mobile.mobile.entity.users;
import com.mobile.mobile.service.SecurityService;
import com.mobile.mobile.entity.accessories;
import com.mobile.mobile.entity.brand;
import com.mobile.mobile.entity.customer;
import com.mobile.mobile.entity.datapoint;
import com.mobile.mobile.entity.mobiles;
import com.mobile.mobile.entity.salesman;
import com.mobile.mobile.dao.accessoryDao;
import com.mobile.mobile.dao.customerDao;
import com.mobile.mobile.dao.expenseDao;
import com.mobile.mobile.dao.mobileDao;
import com.mobile.mobile.dao.purchaseDao;
import com.mobile.mobile.dao.salesDao;
import com.mobile.mobile.dao.salesmanDao;
import com.mobile.mobile.dao.supplierDao;

@Controller
public class AdminController
{
    @Autowired
    private SecurityService securityservice;
    @Autowired
    private mobileDao mobiledao;
    @Autowired
    private accessoryDao accdao;
    @Autowired
    private supplierDao suppdao;
    @Autowired
    private salesmanDao salesmandao;
    @Autowired
    private purchaseDao purchasedao;
    @Autowired
    private expenseDao expensedao;
    @Autowired
    private customerDao custdao;
    @Autowired
    private salesDao salesdao;
    

    @RequestMapping(value="admin", method=RequestMethod.GET)
    public String adminhome(HttpSession session, Model model)
    {
        List<datapoint> points = salesdao.getData();
        for(int i=0;i<points.size();i++)
        {
            System.out.println(points.get(i).date);
        }
        System.out.println(securityservice.findLoggedInUsername());
        model.addAttribute("p", points);
        return "admin_home";
    }
    @RequestMapping(value="admin/brand", method=RequestMethod.GET)
    public String brand(HttpSession session, Model model)
    {
        List<brand> brands = mobiledao.getAllBrands();
        model.addAttribute("brands", brands);
        model.addAttribute("outcome", "");
        return "admin_brand";
    }
    @RequestMapping(value="admin/brand", method=RequestMethod.POST)
    public String brandp(HttpSession session, Model model,
                        @RequestParam("brand") String brand,
                        @RequestParam("action") String action )
    {
       
        if(action.equals("add"))
        {
        String outcome = mobiledao.addBrand(brand);
        model.addAttribute("outcome", outcome);
        }
        else    
        {
            String outcome = mobiledao.delBrand(brand);
            model.addAttribute("outcome", outcome);
        }
        List<brand> brands = mobiledao.getAllBrands();
        model.addAttribute("brands", brands);
        return "admin_brand";
    }
    @RequestMapping(value="admin/mobile", method=RequestMethod.GET)
    public String mobile(HttpSession session, Model model)
    {
        List<mobiles> list = mobiledao.getMobiles("","","","", false);
        List<brand> brands = mobiledao.getAllBrands();
        model.addAttribute("list", list);
        model.addAttribute("brands", brands);
        return "admin_mobile";
    }
    @RequestMapping(value="admin/mobile/add", method=RequestMethod.POST)
    public String mobile_add(HttpSession session,Model model,
                            @RequestParam("color[]") List<String> colors,
                            @RequestParam("brand") String brand,
                            @RequestParam("name") String name,
                            @RequestParam("model") String modell,
                            @RequestParam("display") String display,
                            @RequestParam("resolution") String resolution,
                            @RequestParam("wifi") Double wifi,
                            @RequestParam("network") String network,
                            @RequestParam("fcharge") String fcharge,
                            @RequestParam("gpu") String gpu,
                            @RequestParam("cpu") String cpu,
                            @RequestParam("platform") String platform,
                            @RequestParam("dualsim") String dualsim,
                            @RequestParam("price") int price,
                            @RequestParam("fcamera") int fcamera,
                            @RequestParam("rcamera") int rcamera,
                            @RequestParam("ram") int ram,
                            @RequestParam("battery") int battery,
                            @RequestParam("smemory") int smemory,
                            @RequestParam("exmemory") int exmemory,
                            @RequestParam("screen") Double screen,
                            @RequestParam("bluetooth") Double bluetooth,
                            @RequestParam("usb") Double usb)
    {
        model.addAttribute("outcome_add", mobiledao.add_mobile(colors,brand,name,modell,price,display,resolution,wifi,network,fcharge,gpu,cpu,platform,dualsim,screen,fcamera,rcamera,bluetooth,smemory,ram,battery,exmemory,usb));
        List<mobiles> list = mobiledao.getMobiles("","","","", false);
        List<brand> brands = mobiledao.getAllBrands();
        model.addAttribute("list", list);
        model.addAttribute("brands", brands);
        return "admin_mobile";
    }
    @RequestMapping(value="admin/mobile/update", method=RequestMethod.POST)
    public String mobile_update(HttpSession session, Model model,
                                @RequestParam("model") String modell,
                                @RequestParam("price") int price)
    {
        if(!modell.isEmpty())
        {
            mobiledao.update_price(modell,price);
            model.addAttribute("outcome_update", "Success");
        }
        else{
            model.addAttribute("outcome_update", "Select a mobile");
        }
        List<mobiles> list = mobiledao.getMobiles("","","","", false);
        List<brand> brands = mobiledao.getAllBrands();
        model.addAttribute("list", list);
        model.addAttribute("brands", brands);
        return "admin_mobile";
    }
    @RequestMapping(value="admin/mobile/delete", method=RequestMethod.POST)
    public String mobile_update(HttpSession session, Model model,
                                @RequestParam("model") String modell)
    {
        if(!modell.isEmpty())
        {
            
            model.addAttribute("outcome_delete", mobiledao.delete_mobile(modell));
        }
        else{
            model.addAttribute("outcome_delete", "Select a mobile");
        }
        List<mobiles> list = mobiledao.getMobiles("","","","", false);
        List<brand> brands = mobiledao.getAllBrands();
        model.addAttribute("list", list);
        model.addAttribute("brands", brands);
        return "admin_mobile";
    }
    @RequestMapping(value="admin/mstock",method=RequestMethod.GET)
    public String mstockg(Model model)
    {
        model.addAttribute("list", salesdao.getMstock() );
        return "admin_mstock";
    }
    @RequestMapping(value="admin/astock",method=RequestMethod.GET)
    public String astockg(Model model)
    {
        model.addAttribute("list", salesdao.getAstock());
        return "admin_astock";
    }
    @RequestMapping(value="admin/accessory", method=RequestMethod.GET)
    public String accessory(HttpSession session, Model model)
    {
        List<accessories> list = accdao.getAccessories("", "", "", "");
        List<brand> brands = mobiledao.getAllBrands();
        model.addAttribute("brands", brands);
        model.addAttribute("list", list);
        return "admin_accessory";
    }
    @RequestMapping(value="admin/accessory/add", method=RequestMethod.POST)
    public String accessorya(HttpSession session, Model model,
                            @RequestParam("model") String modell,
                            @RequestParam("name") String name,
                            @RequestParam("type") String type,
                            @RequestParam("brand") String brand,
                            @RequestParam("price") int price,
                            @RequestParam("specs[]") List<String> specs )
    {
        model.addAttribute("outcome_add", accdao.addAccessory(modell, brand, name, type, price, specs));
        List<accessories> list = accdao.getAccessories("", "", "", "");
        List<brand> brands = mobiledao.getAllBrands();
        model.addAttribute("brands", brands);
        model.addAttribute("list", list);
        return "admin_accessory";
    }
    @RequestMapping(value="admin/accessory/delete", method=RequestMethod.POST)
    public String accessoryd(HttpSession session, Model model,
                            @RequestParam("model") String modell)
    {
        accdao.delAccessory(modell);
        List<accessories> list = accdao.getAccessories("", "", "", "");
        List<brand> brands = mobiledao.getAllBrands();
        model.addAttribute("brands", brands);
        model.addAttribute("list", list);
        return "admin_accessory";
    }
    @RequestMapping(value="admin/supplier", method=RequestMethod.GET)
    public String supplier(HttpSession session, Model model)
    {
        model.addAttribute("suppliers", suppdao.getSuppliers(""));
        return "admin_supplier";
    }
    @RequestMapping(value="admin/supplier", method=RequestMethod.POST)
    public String suppliera(HttpSession session, Model model,
                            @RequestParam("name") String name,
                            @RequestParam("address") String address,
                            @RequestParam("mobiles[]") List<Long> numbers )
    {
        model.addAttribute("outcome_add", suppdao.addSupplier(name, address, numbers));
        model.addAttribute("suppliers", suppdao.getSuppliers(""));
        return "admin_supplier";
    }
    @RequestMapping(value="admin/supplier/delete", method=RequestMethod.POST)
    public String supplierd(HttpSession session, Model model,
                            @RequestParam("id") int id )
    {
        model.addAttribute("outcome_delete", suppdao.deleteSupplier(id));
        model.addAttribute("suppliers", suppdao.getSuppliers(""));
        return "admin_supplier";
    }
    @RequestMapping(value="admin/allsuppliers",method=RequestMethod.GET)
    public String allsuppliers(Model model)
    {
        model.addAttribute("list", suppdao.getSuppliers(""));
        return "admin_allsuppliers";
    }
    @RequestMapping(value="admin/salesman", method=RequestMethod.GET)
    public String salesman(@ModelAttribute("userForm") users userForm, HttpSession session, Model model)
    {
        List<salesman> list = salesmandao.getSalesman("",true);
        model.addAttribute("list", list);
        return "admin_salesman";
    }
    @RequestMapping(value="admin/salesman/add", method=RequestMethod.POST)
    public String salesmana(HttpSession session, Model model,
                            @RequestParam("name") String name,
                            @RequestParam("address") String address,
                            @RequestParam("mobiles[]") List<Long> numbers,
                            @RequestParam("start_salary") int start_salary,
                            @RequestParam("dob") String dob,
                            @RequestParam("join_date") String join_date,
                            @ModelAttribute("userForm") users userForm,
                            BindingResult bindingResult)
    {
        System.out.println(userForm.getUsername());
        model.addAttribute("outcome_add", salesmandao.addSalesman(name, userForm, address, Date.valueOf(dob), Date.valueOf(join_date), start_salary, numbers));
        List<salesman> list = salesmandao.getSalesman("",true);
        model.addAttribute("list", list);
        return "admin_salesman";
    }
    @RequestMapping(value="admin/salesman/delete", method=RequestMethod.POST)
    public String salesmand(HttpSession session, Model model,
                            @RequestParam("id") Integer id,
                            @RequestParam("leaving_date") String ld,
                            @ModelAttribute("userForm") users userForm,
                            BindingResult bindingResult)
    {
        
        model.addAttribute("outcome_delete", salesmandao.fireSalesman(id,Date.valueOf(ld)));
        List<salesman> list = salesmandao.getSalesman("",true);
        model.addAttribute("list", list);
        return "admin_salesman";
    }
    @RequestMapping(value="admin/salesman/update", method=RequestMethod.POST)
    public String salesmanu(HttpSession session, Model model,
                            @RequestParam("name") String name,
                            @RequestParam("salary") Integer salary,
                            @ModelAttribute("userForm") users userForm,
                            BindingResult bindingResult)
    {
        
        model.addAttribute("outcome_update", salesmandao.updateSalary(name ,salary));
        List<salesman> list = salesmandao.getSalesman("",true);
        model.addAttribute("list", list);
        return "admin_salesman";
    }
    @RequestMapping(value="admin/allsalesman",method=RequestMethod.GET)
    public String allsalesman(Model model)
    {
        model.addAttribute("list", salesmandao.getSalesman("", false));
        return "admin_allsalesman";
    }
    @RequestMapping(value="admin/allsalesman",method=RequestMethod.POST)
    public String allsalesmanp(Model model, @RequestParam("name") String name ,@RequestParam int status)
    {
        model.addAttribute("list", salesmandao.getSalesman(name, status>0));
        return "admin_allsalesman";
    }
    @RequestMapping(value="admin/allcustomer",method=RequestMethod.GET)
    public String allcustomer(Model model)
    {
        model.addAttribute("list", custdao.getCustomer("", "", ""));
        return "admin_allcustomers";
    }
    @RequestMapping(value="admin/allcustomer",method=RequestMethod.POST)
    public String allcustomerp(Model model, @RequestParam("name") String name ,@RequestParam("address") String address)
    {
        model.addAttribute("list", custdao.getCustomer(name, address, ""));
        return "admin_allcustomers";
    }
    @RequestMapping(value="admin/purchase", method=RequestMethod.GET)
    public String purchase(HttpSession session, Model model)
    {
        model.addAttribute("mobiles", mobiledao.getMobiles("","","","", false));
        model.addAttribute("suppliers", suppdao.getSuppliers(""));
        model.addAttribute("accessories", accdao.getAccessories("", "", "", ""));
        System.out.println(suppdao.getSuppliers("").size());
        return "admin_purchase";
    }
    @RequestMapping(value="admin/purchase", method=RequestMethod.POST)
    public String purchasea(HttpSession session, Model model,
                            @RequestParam("sid") int sid,
                            @RequestParam("moa") String moa,
                            @RequestParam("date") String date,
                            @RequestParam("model[]") List<String> models,
                            @RequestParam("ids[]") List<Long> ids,
                            @RequestParam("prices[]") List<Integer> prices )
    {
        model.addAttribute("outcome", purchasedao.addPurchase(sid,moa,Date.valueOf(date),ids,prices,models));
        model.addAttribute("mobiles", mobiledao.getMobiles("","","","", false));
        model.addAttribute("suppliers", suppdao.getSuppliers(""));
        model.addAttribute("accessories", accdao.getAccessories("", "", "", ""));
        System.out.println(suppdao.getSuppliers("").size());
        return "admin_purchase";
    }
    @RequestMapping(value="admin/allpurchase", method=RequestMethod.GET)
    public String all_purchase(HttpSession session, Model model)
    {
        model.addAttribute("purchase",purchasedao.getPurchase(0, "", "1990-01-01", "2050-01-01"));
        model.addAttribute("supplier", suppdao.getSuppliers(""));
        return "admin_all_purchase";
    }
    @RequestMapping(value="admin/allpurchase", method=RequestMethod.POST)
    public String all_purchasep(HttpSession session, Model model,
                                @RequestParam("sid") Integer sid,
                                @RequestParam("moa") String moa,
                                @RequestParam("start") String start,
                                @RequestParam("end") String end )
    {
        model.addAttribute("purchase",purchasedao.getPurchase(sid, moa, start, end));
        model.addAttribute("supplier", suppdao.getSuppliers(""));
        return "admin_all_purchase";
    }
    @RequestMapping(value="admin/expense", method=RequestMethod.GET)
    public String expense(HttpSession session, Model model)
    {
        return "admin_expense";
    }
    @RequestMapping(value="admin/expense", method=RequestMethod.POST)
    public String expensea(HttpSession session, Model model,
                            @RequestParam("date") String date,
                            @RequestParam("purpose") String purpose,
                            @RequestParam("cost") Integer cost)
    {
        model.addAttribute("outcome", expensedao.addExpense(purpose, Date.valueOf(date), cost));
        return "admin_expense";
    }
    @RequestMapping(value="admin/expenses", method=RequestMethod.GET)
    public String all_expense(HttpSession session, Model model)
    {
        model.addAttribute("list",expensedao.getExpense("", "1990-01-01", "2050-01-01"));
        return "admin_allexpenses";
    }
    @RequestMapping(value="admin/expenses", method=RequestMethod.POST)
    public String all_expensep(HttpSession session, Model model,
                                @RequestParam("purpose") String purpose,
                                @RequestParam("start") String start,
                                @RequestParam("end") String end )
    {
        model.addAttribute("list",expensedao.getExpense(purpose, start, end));
        return "admin_allexpenses";
    }
    @RequestMapping(value="admin/birthdays", method=RequestMethod.GET)
    public String birthday(HttpSession session, Model model)
    {
        return "admin_birthday";
    }
    @RequestMapping(value="admin/birthdays", method=RequestMethod.POST)
    public String birthdayp(HttpSession session, Model model,
                            @RequestParam("date") String date)
    {
        List<customer> list = custdao.getCustomer("", "", date);
        if(list.size()==0)
        {
            model.addAttribute("outcome", "No Customer Exist");
        }
        else
        {
            model.addAttribute("outcome", list.size() + " Customer(s) Found");
        }
        model.addAttribute("list", list);
        model.addAttribute("date", date);
        return "admin_birthday";
    }
    @RequestMapping(value="admin/allsales", method=RequestMethod.GET)
    public String all_sales(HttpSession session, Model model)
    {
        model.addAttribute("sales", salesdao.getSales(0, "", "1990-01-01", "2050-01-01"));
        model.addAttribute("salesman", salesmandao.getSalesman("", false));
        return "admin_allsales";
    }
    @RequestMapping(value="admin/allsales", method=RequestMethod.POST)
    public String all_salesp(HttpSession session, Model model,
                                @RequestParam("sid") Integer sid,
                                @RequestParam("moa") String moa,
                                @RequestParam("start") String start,
                                @RequestParam("end") String end )
    {
        System.out.println(sid);
        System.out.println(moa);
        System.out.println(start);
        System.out.println(end);
        model.addAttribute("sales", salesdao.getSales(sid, moa, start, end));
        model.addAttribute("salesman", salesmandao.getSalesman("", false));
        return "admin_allsales";
    }
    
}