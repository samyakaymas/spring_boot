package com.mobile.mobile.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import javax.servlet.http.HttpSession;

import com.mobile.mobile.dao.accessoryDao;
import com.mobile.mobile.dao.mobileDao;
import com.mobile.mobile.entity.brand;
import com.mobile.mobile.entity.mobiles;


@Controller
public class MobileController
{
    @Autowired
    private mobileDao mobiledao;
    @Autowired
    private accessoryDao accdao;

    @RequestMapping(value= "mobiles", method = RequestMethod.GET)
    public String mobilehome(HttpSession session, Model model)
    {
        List<mobiles> list = mobiledao.getMobiles("","","","", false);
        List<brand> brands = mobiledao.getAllBrands();
        model.addAttribute("brands", brands);
        model.addAttribute("list", list);
        return "mobile";
    }
    @RequestMapping(value= "mobiles", method = RequestMethod.POST)
    public String mobilehomep(HttpSession session, Model model,
                                @RequestParam("model") String modell,
                                @RequestParam("brandd") String brandd,
                                @RequestParam("name") String name,
                                @RequestParam("sortby") String sortyby)
    {
        List<mobiles> list = mobiledao.getMobiles(modell,brandd,name,sortyby, false);
        List<brand> brands = mobiledao.getAllBrands();
        model.addAttribute("list", list);
        model.addAttribute("brands", brands);
        return "mobile";
    }
    @RequestMapping(value= "mobiles/compare", method = RequestMethod.GET)
    public String compare(HttpSession session, Model model)
    {
        model.addAttribute("list", mobiledao.getMobiles("", "", "", "", false));
        return "compare";
    }
    @RequestMapping(value= "mobiles/compare", method = RequestMethod.POST)
    public String comparep(HttpSession session, Model model,
                            @RequestParam("first") String first,
                            @RequestParam("second") String second)
    {
        model.addAttribute("a", mobiledao.getMobiles(first, "", "", "", false).get(0));
        model.addAttribute("b", mobiledao.getMobiles(second, "", "", "", false).get(0));
        model.addAttribute("list", mobiledao.getMobiles("", "", "", "", false));
        return "compare";
    }
    @RequestMapping(value= "accessory", method = RequestMethod.GET)
    public String accessoryhome(HttpSession session, Model model)
    {
        model.addAttribute("brands", mobiledao.getAllBrands());
        model.addAttribute("list", accdao.getAccessories("","","",""));
        model.addAttribute("types", accdao.getTypes());
        return "accessory";
    }
    @RequestMapping(value= "accessory", method = RequestMethod.POST)
    public String accessoryhome(HttpSession session, Model model, @RequestParam("model") String modell, @RequestParam("brandd") String brand, @RequestParam("name") String name, @RequestParam("type") String type)
    {
        model.addAttribute("brands", mobiledao.getAllBrands());
        model.addAttribute("list", accdao.getAccessories(modell,name,type,brand));
        model.addAttribute("types", accdao.getTypes());
        return "accessory";
    }
}


